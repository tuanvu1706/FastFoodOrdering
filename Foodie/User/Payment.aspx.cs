﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Foodie.User
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr, drl;
        DataTable dt;
        SqlTransaction transaction = null;
        string _name = string.Empty; string _cardNo = string.Empty; string _expiryDate = string.Empty; string _mobile = string.Empty; string _note = string.Empty;
        string _address = string.Empty; string _paymentMode = string.Empty; string _cvv = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        //protected void lbCardSubmit_Click(object sender, EventArgs e)
        //{
        //    _name = txtName.Text.Trim();
        //    _cardNo = txtCardNo.Text.Trim();
        //    _cardNo = string.Format("************{0}", txtCardNo.Text.Trim().Substring(12,4));
        //    _expiryDate = txtExpMonth.Text.Trim() + "/" + txtExpYear.Text.Trim();
        //    _cvv = txtCvv.Text.Trim();
        //    _address = txtAddress.Text.Trim();
        //    _paymentMode = "card";
        //    if(Session["userId"] != null)
        //    {
        //        OrderPayment(_name, _cardNo, _expiryDate, _cvv, _address, _paymentMode);
        //    }
        //    else
        //    {
        //        Response.Redirect("Login.aspx");
        //    }
        //}

        protected void lbCodSubmit_Click(object sender, EventArgs e)
        {
            _address = txtCODAddress.Text.Trim();
            _name = txtName.Text;
            _mobile = txtMobile.Text;
            _note = txtNote.Text;
            _paymentMode = "cod";
            if (Session["userId"] != null)
            {
                OrderPayment(_name, _cardNo, _expiryDate, _address, _paymentMode, _note, _mobile, _cvv);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
         
        void OrderPayment(string name, string cardNo, string expiryDate,  string address, string paymentMode,string note, string mobile, string cvv)
        {
            int paymentId; int productId; int quantity;
            dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] {
                new DataColumn("OrderNo", typeof(string)),
                new DataColumn("ProductId", typeof(string)),
                new DataColumn("Quantity", typeof(string)),
                new DataColumn("UserId", typeof(string)),
                new DataColumn("Status", typeof(string)),
                new DataColumn("PaymentId", typeof(string)),
                //new DataColumn("Note", typeof(string)),
                //new DataColumn("Mobile", typeof(string)),
                new DataColumn("OrderDate", typeof(DateTime)),
            });
            con = new SqlConnection(Connection.GetConnectionString());
            con.Open();
            #region Sql Transaction
            transaction = con.BeginTransaction();
            cmd = new SqlCommand("Save_Payment", con, transaction);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Mobile", mobile);
            cmd.Parameters.AddWithValue("@Cvv", cvv);
            cmd.Parameters.AddWithValue("@Note", note);
            cmd.Parameters.AddWithValue("@PaymentMode", paymentMode);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@CardNo", cardNo);
            cmd.Parameters.AddWithValue("@ExpiryDate", expiryDate);
            cmd.Parameters.Add("@InsertedId", SqlDbType.Int);
            cmd.Parameters["@InsertedId"].Direction = ParameterDirection.Output;
            try
            {
                cmd.ExecuteNonQuery();
                paymentId = Convert.ToInt32(cmd.Parameters["@InsertedId"].Value);

                #region Getting Cart Item's
                cmd = new SqlCommand("Cart_Crud", con, transaction);
                cmd.Parameters.AddWithValue("@Action", "SELECT");
                cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
                cmd.CommandType = CommandType.StoredProcedure;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    productId = (int)dr["ProductId"];
                    quantity = (int)dr["Quantity"];
                    // Update Product Quantity
                    UpdateQuantity(productId, quantity, transaction, con);
                    // Update Product Quantity End

                    // Delete Cart Item
                    DeleteCartItem(productId, transaction, con);
                    // Delete Cart Item End

                    dt.Rows.Add(Utils.GetUniqueId(), productId, quantity, (int)Session["userId"], "Đang chuẩn bị", 
                        paymentId, Convert.ToDateTime(DateTime.Now));
                }
                dr.Close();
                #endregion Getting Cart Item's

                #region Order Details
                if(dt.Rows.Count > 0)
                {
                    cmd = new SqlCommand("Save_Orders", con, transaction);
                    cmd.Parameters.AddWithValue("@tblOrders", dt);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                #endregion Order Details

                transaction.Commit();
                lblMsg.Visible = true;
                lblMsg.Text = "Đặt hàng thành công!!!";
                lblMsg.CssClass = "alert alert-success";
                Response.AddHeader("REFRESH", "1;URL=Invoice.aspx?id=" + paymentId);
            }
            catch (Exception e)
            {
                try
                {
                    transaction.Rollback();
                }
                catch(Exception ex) 
                {
                    Response.Write("<script>alert('"+ ex.Message +"');</script>");
                }
            }
            #endregion Sql Transaction
            finally
            {
                con.Close();
            }
        }

        void UpdateQuantity(int _productId, int _quantity, SqlTransaction sqlTransaction, SqlConnection sqlConnection)
        {
            int dbQuantity;
            cmd = new SqlCommand("Product_Crud", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@ProductId", _productId);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                drl = cmd.ExecuteReader();
                while (drl.Read())
                {
                    dbQuantity = (int)drl["Quantity"];

                    if(dbQuantity > _quantity && dbQuantity > 2)
                    {
                        dbQuantity = dbQuantity - _quantity;
                        cmd = new SqlCommand("Product_Crud", sqlConnection, sqlTransaction);
                        cmd.Parameters.AddWithValue("@Action", "QTYUPDATE");
                        cmd.Parameters.AddWithValue("@Quantity", dbQuantity);
                        cmd.Parameters.AddWithValue("@ProductId", _productId);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                    }
                }
                drl.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {

            }
        }

        void DeleteCartItem(int _productId, SqlTransaction sqlTransaction, SqlConnection sqlConnection)
        {
            cmd = new SqlCommand("Cart_Crud", sqlConnection, sqlTransaction);
            cmd.Parameters.AddWithValue("@Action", "DELETE");
            cmd.Parameters.AddWithValue("@ProductId", _productId);
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}