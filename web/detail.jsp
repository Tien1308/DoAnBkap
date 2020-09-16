
<%@page import="java.text.NumberFormat"%>
<%@page import="uit.model.Product"%>
<%@page import="uit.dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Chi Tiết Sản Phẩm | Mobile-Store</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</head>
<body>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10&appId=517537858578711";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.10&appId=517537858578711";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>

	<%
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		Product sp = sanPhamDAO.getDetailProduct(request.getParameter("ID_Product"));
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		ArrayList<Product> recommendList = sanPhamDAO.getListRecommendProduct();
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<div class="container">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
			<div class="col-sm-9 padding-right">
				<div class="product-details">
					<!--product-details-->
					<div class="col-sm-5">
						<div class="view-product">
							<img src="<%=sp.getImage()%>" alt="" />
							<!-- <h3>Phóng To</h3> -->
						</div>

					</div>

					<div class="col-sm-7">
						<div class="product-information">
							<!--/product-information-->
							<img src="images/product-details/new.jpg" class="newarrival"
								alt="" />

							<h2><%=sp.getName_Product()%></h2>
							<p>
								Mã Sản Phẩm:
								<%=request.getParameter("ID_Product")%>
							</p>

							<img src="images/product-details/rating.png" alt="" /> </br> <span>
								<span><%=nf.format(sp.getPrice())%> VNĐ</span> 
								<!-- <label>Số Lượng:</label> -->
									 <!-- <input type="text" value="Nhập" /> -->

							</span>

							<p>
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									type="button" class="btn btn-fefault cart"> <i
									class="fa fa-shopping-cart"></i> Thêm vào giỏ
								</a>
							</p>
							</br>

							<p></p>
							<p>
								<b>Số lượng</b>: còn
								<%=sp.getQuantity()%>
								sản phẩm
							</p>
							<%-- <p>
								<b>Giảm giá: </b><%=sp.getSale()%>
								VNĐ
							</p> --%>
							<p>
								<b>Mô tả: </b> <%=sp.getDescribe() %>
							</p>
							 <div class="fb-like"
								data-href="https://facebook.com/uitFC.VN"
								data-layout="standard" data-action="like" data-size="small"
								data-show-faces="true" data-share="true"></div> -->
						</div>
						<!--/product-information-->
					</div>
				</div>
				<!--/product-details-->

				<div class="category-tab shop-details-tab">
					<!--category-tab-->
					<div class="col-sm-12">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#details" data-toggle="tab" >Sản Phẩm Khác</a></li>
							 <li class="active"><a href="#reviews" data-toggle="tab">Đánh
									Giá (5)</a></li> 
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="details">
							<% for (Product pr : recommendList) { %> 
							<div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="<%=pr.getImage() %>" alt="" />
											<h2><%=nf.format(pr.getPrice()) %> VNĐ</h2>
											<p><%=pr.getName_Product() %></p>
											<a href="CartServlet?enter=insert&ID_Product=<%=pr.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
										</div>

									</div>
								</div>
							</div>
							<% } %>
							 <div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/ip_x_2.jpg" alt="" />
											<h2>34.990.000 VNĐ</h2>
											<p>IPhone X 256GB</p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
										</div>

									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/ip_x_3.jpg" alt="" />
											<h2>38.990.000 VNĐ</h2>
											<p>IPhone X Plus 128GB</p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
										</div>

									</div>
								</div>
							</div>
							<div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/ip_x_4.jpg" alt="" />
											<h2>42.990.000 VNĐ</h2>
											<p>IPhone X Plus 256GB</p>
											<a href="#" class="btn btn-default add-to-cart"><i
												class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
										</div>

									</div>
								</div>
							</div> -->
						</div>


						<div class="tab-pane fade " id="reviews">
							<div class="col-sm-12">

								<%-- <div class="fb-comments"
									data-href="detail.jsp?msp<%=sp.getID_Product()%>"
									data-width="800px" data-numposts="5"></div> --%>
								 <ul>
									<li><a href=""><i class="fa fa-user"></i>uitFC</a></li>
									<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
									<li><a href=""><i class="fa fa-calendar-o"></i>01-10-2017</a></li>
								</ul>
								<p>      Hãy gửi những ý kiến của bạn về cửa hàng. Những điều gì
									đã làm bạn hài lòng hoặc không hài lòng vui lòng điền vào bên
									dưới để chúng tôi sửa chứa một cách nhanh nhất. Xin cảm ơn</p>
								<p>
									<b>Gửi Đánh Giá Của Bạn</b>
								</p>

								<form action="#">
									<span> <input type="text" placeholder="Your Name" /> <input
										type="email" placeholder="Email Address" />
									</span>
									<textarea name=""></textarea>
									<b>Đánh Giá: </b> <img src="images/product-details/rating.png"
										alt="" />
									<button type="button" class="btn btn-default pull-right">
										Gửi</button>
								</form> 
							</div>
						</div>

					</div>
				</div>
				<!--/category-tab-->


			</div>
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>