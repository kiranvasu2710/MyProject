 <%@page import="user.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="user.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="user.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="Header.jsp"%>     
<!DOCTYPE html>
<html lang="en">
  <head>
  <head> 
<style type="text/css">
.bttnStyle {
	background-color: lightblue;
	border-radius: 0.50rem;
	border: 1px solid transperent;
}
</style>
  </head>

  <body>
    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div class="banner_content d-md-flex justify-content-between align-items-center">
            <div class="mb-3 mb-md-0">
              <h2>Shop Category</h2>
              <p>Very us move be blessed multiply night</p>
            </div>
            <div class="page_link">
              <a href="index.jsp">Home</a>
              <a href="mycart.jsp">Cart</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Category Product Area =================-->
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse">
          <div class="col-lg-12">
      
            <div class="latest_product_inner">
              <div class="row">
              
              <%
              	int net_price=0;
              	List<Cart> list=CartDao.getCartByUser(u.getId());
             	 if(list.size()>0)
             	 { 
              		for(Cart c:list)
              		{
              			net_price=net_price+c.getTotal_price();
              			Product p=ProductDao.getProduct(c.getPid());
              %>
                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <img
                        class="card-img"
                        src="product_img/<%=p.getProduct_img() %>" style="width: 400px;height: 350px;'"
                        alt=""
                      />
                      <div class="p_icon">
                        <a href="product-details.jsp?pid=<%=p.getPid()%>">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                        <a href="#">
                          <i class="ti-shopping-cart"></i>
                        </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4><%=p.getProduct_name() %></h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4">Price : <%=p.getProduct_price() %></span>
                      </div>
                      <div class="mt-3">
                        <span class="mr-4">
                        	<form method="post" action="change-qty.jsp">
                        		<input type="hidden" name="cid" value="<%=c.getCid()%>">
                        Qty : <input type="number" min="1" max="10" name="product_qty" value="<%=c.getProduct_qty()%>" onchange="this.form.submit();">
                        </form>
                        </span> 
                      </div>
                      <div class="mt-3">
                        <span class="mr-4">Total : <%=c.getTotal_price() %></span>
                      </div>
                    </div>
                  </div>
                </div>
				<%
              	}
              }
              	else
              	{
				%>
				<h1>No Products In Cart</h1>
               <%
              	}
               %>
              </div>
            </div>
          </div>
        </div>
        <%
        	if(list.size()>0)
        	{
        %>
        <h1>Net Price : <%=net_price%></h1>
        <form>
				<input type="text" id="famout" value="<%=net_price%>">
			</form>
			<button id="payButton" onclick="CreateOrderID()" class="bttnStyle">Pay Now</button>
        <%
        	} 
        %>
      </div>
    </section>
    <!--================End Category Product Area =================-->

    <!--================ start footer Area  =================-->
    <footer class="footer-area section_gap">
      <div class="container">
        <div class="row">
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Top Products</h4>
            <ul>
              <li><a href="#">Managed Website</a></li>
              <li><a href="#">Manage Reputation</a></li>
              <li><a href="#">Power Tools</a></li>
              <li><a href="#">Marketing Service</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Quick Links</h4>
            <ul>
              <li><a href="#">Jobs</a></li>
              <li><a href="#">Brand Assets</a></li>
              <li><a href="#">Investor Relations</a></li>
              <li><a href="#">Terms of Service</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Features</h4>
            <ul>
              <li><a href="#">Jobs</a></li>
              <li><a href="#">Brand Assets</a></li>
              <li><a href="#">Investor Relations</a></li>
              <li><a href="#">Terms of Service</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Resources</h4>
            <ul>
              <li><a href="#">Guides</a></li>
              <li><a href="#">Research</a></li>
              <li><a href="#">Experts</a></li>
              <li><a href="#">Agencies</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6 single-footer-widget">
            <h4>Newsletter</h4>
            <p>You can trust us. we only send promo offers,</p>
            <div class="form-wrap" id="mc_embed_signup">
              <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                method="get" class="form-inline">
                <input class="form-control" name="EMAIL" placeholder="Your Email Address" onfocus="this.placeholder = ''"
                  onblur="this.placeholder = 'Your Email Address '" required="" type="email">
                <button class="click-btn btn btn-default">Subscribe</button>
                <div style="position: absolute; left: -5000px;">
                  <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                </div>
  
                <div class="info"></div>
              </form>
            </div>
          </div>
        </div>
        <div class="footer-bottom row align-items-center">
          <p class="footer-text m-0 col-lg-8 col-md-12"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          <div class="col-lg-4 col-md-12 footer-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
            <a href="#"><i class="fa fa-behance"></i></a>
          </div>
        </div>
      </div>
    </footer>
    <!--================ End footer Area  =================-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/stellar.js"></script>
    <script src="vendors/lightbox/simpleLightbox.min.js"></script>
    <script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
    <script src="vendors/isotope/isotope-min.js"></script>
    <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="vendors/jquery-ui/jquery-ui.js"></script>
    <script src="vendors/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendors/counter-up/jquery.counterup.js"></script>
    <script src="js/theme.js"></script>
    <script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		xhttp.open("GET","http://localhost:8080/MyProject/OrderCreation?amount=<%=net_price%>",false);
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		alert(RazorpayOrderId);
		OpenCheckOut();
	}
</script>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript">
	
	
	function OpenCheckOut()
	{
		var amount=document.getElementById("famout").value;
		var new_amount=parseInt(amount)*100;
		var options={
				"key":"rzp_test_Zqt99Ao8fhKpnS",
				"amount":new_amount,
				"currency":"INR",
				"name":"MEGHA",
				"description":"Test",
				"callback_url":"http://localhost:8080/MyProject/index.jsp?id=<%=u.getId()%>",
				"prefill" : {
					"name" : "Gaurav vasu",
					"email" : "gaurav@gmail.com",
					"contact" : "9172130706"
				},
				"notes" : {
					"address" : "Ahmedabad"
				},
				"theme" : {
					"color" : "#3399cc"
				}

			};
			var rzp1 = new Razorpay(options);
			rzp1.on('payment.failed', function(response) {
				alert(response.error.code);
				alert(response.error.description);
				alert(response.error.source);
				alert(response.error.step);
				alert(response.error.reason);
				alert(response.error.metadata.order_id);
				alert(response.error.metadata.payment_id);
			});
			rzp1.open();
			e.preventDefault();
		}
	</script>

  </body>
</html>
