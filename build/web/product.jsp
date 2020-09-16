<%@page import="java.text.NumberFormat"%>
<%@page import="uit.model.Product"%>
<%@page import="uit.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uit.dao.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Sản Phẩm | Mobile-Store</title>
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

	<%
		ProductDAOImpl sanPhamDAO = new ProductDAOImpl();
		ArrayList<Product> arr = sanPhamDAO.getList();
		int start = 0, end = 9;
		if (arr.size() < 9) {
			end = arr.size();
		}
		if (request.getParameter("start") != null) {
			start = Integer.parseInt(request.getParameter("start"));
		}
		if (request.getParameter("end") != null) {
			end = Integer.parseInt(request.getParameter("end"));
		}
		ArrayList<Product> list = sanPhamDAO.getListByPage(arr, start, end);

		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		ArrayList<Product> searchProduct = new ArrayList();
		if (request.getParameter("ID_Category") !=null) {
			searchProduct = sanPhamDAO.getListProductByCategory(request.getParameter("ID_Category"));
		}
		else {
			searchProduct = sanPhamDAO.getListProductByName(request.getParameter("Name_Product"));
		}
		
		
	%>

	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center">Kết quả tìm kiếm</h2>
			<%
				for (Product sp : searchProduct) {
			%>
			<div class="col-sm-4">
				<div class="product-image-wrapper">
					<a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice())%>
								VNĐ
							</h2>
							<p><%=sp.getName_Product()%></p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
						</div>
						<%-- <div class="product-overlay">
							<div class="overlay-content">
								<h2><%=nf.format(sp.getPrice())%>
									VNĐ
								</h2>
								<p><%=sp.getName_Product()%></p>
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
							</div>
						</div> --%>
						<img src="images/home/new.png" class="new" alt="" />
					</div>
					</a>
					<%-- <div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i
									class="fa fa-plus-square"></i>Xem chi tiết</a></li>
							<li><a href="#"><i class="fa fa-plus-square"></i>Thêm
									vào so sánh</a></li>
						</ul>
					</div> --%>
				</div>
			</div>
			<%
				}
			%>
		</div>


		<div class="features_items">
			<!--features_items-->
			<div class="category-tab">
				<!--category-tab-->
				<div class="col-sm-12">
					<ul class="nav nav-tabs">
						<li class="active"><a href="" data-toggle="tab">Sản Phẩm Nổi Bật</a></li>
                                                             
					</ul>

				</div>
			</div>
			<%
				for (Product sp : list) {
			%>

			<div class="col-sm-4">
				<div class="product-image-wrapper">
					<a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="<%=sp.getImage()%>" alt="" />
							<h2><%=nf.format(sp.getPrice())%>
								VNĐ
							</h2>
							<p><%=sp.getName_Product()%></p>
							<a
								href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
						</div>
						<%-- <div class="product-overlay">
							<div class="overlay-content">
								<h2><%=nf.format(sp.getPrice())%>
									VNĐ
								</h2>
								<p><%=sp.getName_Product()%></p>
								<a
									href="CartServlet?enter=insert&ID_Product=<%=sp.getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"
									class="btn btn-default add-to-cart"><i
									class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
							</div>
						</div> --%>
					</div>
					</a>
					<%-- <div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="detail.jsp?ID_Product=<%=sp.getID_Product()%>"><i class="fa fa-plus-square"></i>Xem chi
									tiết</a></li>
							<li><a href=""><i class="fa fa-plus-square"></i>Thêm vào
									so sánh</a></li>
						</ul>
					</div> --%>
				</div>
			</div>

			<%
				}
			%>
			<div style="clear: both;"></div>
			<ul class="pagination">


				<%
					int a, b;
					int limit = arr.size() / 9;
					if (limit * 9 < arr.size()) {
						limit += 1;
					}
					for (int i = 1; i <= limit; i++) {
						a = (i - 1) * 9;
						b = i * 9;
						if (b > arr.size()) {
							b = arr.size();
						}
				%>
				<li><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
				<%
					}
				%>
			</ul>
		</div>

		 <div class="category-tab">
			
			<div class="col-sm-12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tshirt" data-toggle="tab">IPhone
							SE</a></li>
					<li><a href="#blazers" data-toggle="tab">IPhone 6 </a></li>
					<li><a href="#sunglass" data-toggle="tab">IPhone 7</a></li>
					<li><a href="#kids" data-toggle="tab">IPhone 8</a></li>
					<li><a href="#poloshirt" data-toggle="tab">IPhone X</a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div class="tab-pane fade active in" id="tshirt">
					<div class="col-sm-3">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/ip_se_1.jpg" alt="" />
									<h2>5.990.000 VNĐ</h2>
									<p>IPhone SE 16GB</p>
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
									<img src="images/home/ip_se_2.jpg" alt="" />
									<h2>6.990.000 VNĐ</h2>
									<p>IPhone SE 32GB</p>
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
									<img src="images/home/ip_se_3.jpg" alt="" />
									<h2>8.990.000 VNĐ</h2>
									<p>IPhone SE 64GB</p>
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
									<img src="images/home/ip_se_4.jpg" alt="" />
									<h2>10.990.000 VNĐ</h2>
									<p>IPhone SE 128GB</p>
									<a href="#" class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="blazers">
					<div class="col-sm-3">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/ip_6_1.jpg" alt="" />
									<h2>4.990.000 VNĐ</h2>
									<p>IPhone 6</p>
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
									<img src="images/home/ip_6_2.jpg" alt="" />
									<h2>6.990.000 VNĐ</h2>
									<p>IPhone 6 Plus</p>
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
									<img src="images/home/ip_6_3.jpg" alt="" />
									<h2>5.990.000 VNĐ</h2>
									<p>IPhone 6S</p>
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
									<img src="images/home/ip_6_4.jpg" alt="" />
									<h2>7.990.000 VNĐ</h2>
									<p>IPhone 6S Plus</p>
									<a href="#" class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="sunglass">
					<div class="col-sm-3">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/ip_7_1.jpg" alt="" />
									<h2>10.990.000 VNĐ</h2>
									<p>IPhone 7 64GB</p>
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
									<img src="images/home/ip_7_2.jpg" alt="" />
									<h2>12.990.000 VNĐ</h2>
									<p>IPhone 7 256GB</p>
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
									<img src="images/home/ip_7_3.jpg" alt="" />
									<h2>14.990.000 VNĐ</h2>
									<p>IPhone 7 Plus 64GB</p>
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
									<img src="images/home/ip_7_4.jpg" alt="" />
									<h2>16.990.000 VNĐ</h2>
									<p>IPhone 7 Plus 256GB</p>
									<a href="#" class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="kids">
					<div class="col-sm-3">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/ip_8_1.jpg" alt="" />
									<h2>20.990.000 VNĐ</h2>
									<p>IPhone 8 64GB</p>
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
									<img src="images/home/ip_8_2.jpg" alt="" />
									<h2>24.990.000 VNĐ</h2>
									<p>IPhone 8 256GB</p>
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
									<img src="images/home/ip_8_3.jpg" alt="" />
									<h2>26.990.000 VNĐ</h2>
									<p>IPhone 8 Plus 64GB</p>
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
									<img src="images/home/ip_8_4.jpg" alt="" />
									<h2>28.990.000 VNĐ</h2>
									<p>IPhone 8 Plus 256GB</p>
									<a href="#" class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Thêm vào giỏ</a>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="poloshirt">
					<div class="col-sm-3">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/ip_x_1.jpg" alt="" />
									<h2>30.990.000 VNĐ</h2>
									<p>IPhone X 128GB</p>
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
					</div>
				</div>
			</div>
		</div>
		



	</div>
</body>
</html>