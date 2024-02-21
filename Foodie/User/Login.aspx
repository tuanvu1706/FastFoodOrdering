<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Foodie.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        /*For disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
       <%-- <div class="container">
            <div class="align-self-end">
                <asp:Label runat="server" ID="lblMsg"></asp:Label>
            </div>
            <h2>Login</h2>
        </div>--%>
        <div class="row">
            <div class="col-md-6" style ="display:flex; justify-content:end">
               <div style ="width:66%">
                    <div class="form_container">
                        <%--<div class="align-self-end">
                            <asp:Label runat="server" ID="lblMsg"></asp:Label>
                        </div>--%>
                        <h2>Đăng nhập</h2>
                    </div>
                    <div class="form_container">
                        <img id="userLogin" src="../Images/Login.jpg" alt="" class="img-thumbnail"/>
                    </div>
               </div>
            </div>
            <div class="col-md-6">
                <div class="form_container" style="height:47px;">
                    <div class="align-self-end">
                            <asp:Label style="margin-left: 307px;" runat="server" ID="lblMsg"></asp:Label>
                        </div>
                </div>
                <div class="form_container">
                    <div>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Yêu cầu nhập tên đăng nhập!" ControlToValidate="txtUsername" 
                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Nhập tên đăng nhập" width="500"></asp:TextBox>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Yêu cầu nhập mật khẩu!" ControlToValidate="txtPassword"
                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Nhập mật khẩu" width="500" TextMode="Password">
                        </asp:TextBox>
                    </div>
                    <div class="btn-box">
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" 
                            OnClick="btnLogin_Click"/>
                        <span class="pl-3 text-info">Khách hàng mới? <a href="Registration.aspx" class="badge badge-info">Đăng ký tại đây...</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
