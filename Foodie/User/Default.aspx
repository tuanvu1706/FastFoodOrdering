<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Foodie.User.Default" %>

<%@ Import Namespace="Foodie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- offer section -->

    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container ">
                <div class="row">
                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6  ">
                                <div class="box ">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5><%# Eval("Name") %>
                                        </h5>
                                        <h6>
                                            <%--<span>20%</span> off--%>
                                        </h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Đặt hàng thôi 
                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                        <g>
                            <g>
                                <path d="M345.6,338.862c-29.184,0-53.248,23.552-53.248,53.248c0,29.184,23.552,53.248,53.248,53.248
                     c29.184,0,53.248-23.552,53.248-53.248C398.336,362.926,374.784,338.862,345.6,338.862z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M439.296,84.91c-1.024,0-2.56-0.512-4.096-0.512H112.64l-5.12-34.304C104.448,27.566,84.992,10.67,61.952,10.67H20.48
                     C9.216,10.67,0,19.886,0,31.15c0,11.264,9.216,20.48,20.48,20.48h41.472c2.56,0,4.608,2.048,5.12,4.608l31.744,216.064
                     c4.096,27.136,27.648,47.616,55.296,47.616h212.992c26.624,0,49.664-18.944,55.296-45.056l33.28-166.4
                     C457.728,97.71,450.56,86.958,439.296,84.91z" />
                            </g>
                        </g>
                        <g>
                            <g>
                                <path d="M215.04,389.55c-1.024-28.16-24.576-50.688-52.736-50.688c-29.696,1.536-52.224,26.112-51.2,55.296
                     c1.024,28.16,24.064,50.688,52.224,50.688h1.024C193.536,443.31,216.576,418.734,215.04,389.55z" />
                            </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                    </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </section>

    <!-- end offer section -->


    <!-- about section -->

    <section class="about_section layout_padding">
        <div class="container  ">

            <div class="row">
                <div class="col-md-6 ">
                    <div class="img-box">
                        <img src="../TemplateFiles/images/about-img.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>Tuấn Vũ Restaurant
                            </h2>
                        </div>
                        <p>
                            Kể từ khi mới bắt đầu hoạt động từ năm 2019, Tuấn Vũ Restaurant đã chinh phục hoàn toàn được khẩu vị của người Việt bởi hương vị đặc biệt của những chiếc bánh pizza, burger, gà rán hay các loại mỳ ống Ý tuyệt vời và một số món ăn được ưa chuộng trên thế giới với giá cả cực kỳ hợp lý.
              <br />
                            <br />
                            Với khẩu phần và hương vị đặc trưng, Tuấn Vũ Restaurant không những đã và đang được những người nước ngoài sinh sống & làm việc tại Việt Nam, những khách du lịch mà còn cả những người Việt cũng vô cùng hâm mộ và yêu mến.
               <br />
                            <br />
                            Nằm ngay tại trung tâm thành phố, với không gian rộng mở bạn có thể ghé vào để thưởng thức những món ăn tự chọn, mà chỉ với một chi phí phải chăng. Tuấn Vũ Restaurant đúng là nơi lý tưởng cho Quý khách đến dùng bữa cùng gia đình và bè bạn.
                Phục vụ các loại bánh pizza nhiều kích cỡ với đế bánh giòn thơm, những miếng đùi gà nóng hổi, những chiếc burger thơm lừng các loại mỳ Ý phong phú với các loại sốt thay đổi theo ngày, các loại phomai thơm ngon và thực đơn đặc biệt…. 
              <br />
                            <br />
                            Tuấn Vũ Restaurant mang đến dịch vụ hoàn hảo nhất dành tặng Quý khách và chắc chắn sẽ tiếp tục được Quý khách ủng hộ nhiệt tình.
               <br />
                            <br />
                            Tuấn Vũ Restaurant luôn luôn và mãi mãi duy trì một phong cách phục vụ: Vui lòng khách đến vừa lòng khách đi.
                        </p>
                        <a href="About.aspx">Về chúng tôi
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end about section -->


    <!-- client section -->

    <section class="client_section layout_padding-bottom pt-5">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">
                <h2>Khách hàng đã nói gì về chúng tôi
                </h2>
            </div>
            <div class="carousel-wrap row ">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Tiệc tùng, lễ lộc hay sinh nhật mình đều chọn Tuấn Vũ Restaurant. Bởi giá cả vừa hợp lí, đồ ăn lại ngon. Như vừa rồi, mình đặt trên website một phần combo mà giá ưu đãi hơn nhiều. Sẵn tiện, mình đặt thêm chiếc bánh Pizza Carbonara và một lon Coca-Cola mà giá chỉ có 15K thui. Pizza ship đến nóng hỏi, thơm ngon như ăn tại cửa hàng. 
                                </p>
                                <h6>Hằng Nguyễn
                                </h6>
                                <p>
                                    Một khách hàng lâu năm
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client4.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Mình mê nhất món là Gà rán giòn sốt mật ong của quán. Mỗi lần đặt đồ ăn đều phải kêu ít nhất một phần. Các món gà thì ngon nha, burrger thì chỉ tạm được thôi. Nhưng mình vẫn chấm 5* vì “món ruột” của mình và sự nhiệt tình của nhà hàng. 
                                </p>
                                <h6>Hiếu Phạm
                                </h6>
                                <p>
                                    Khách quen của nhà hàng
                                </p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFiles/images/client3.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end client section -->

</asp:Content>
