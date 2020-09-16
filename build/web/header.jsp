<%@page import="uit.model.Category"%>
<%@page import="uit.dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Mobile-Store</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

</head>
<body>

	<%
		CategoryDAOImpl danhMucDAO = new CategoryDAOImpl();
	%>

	<header id="header"><!--header-->
	<div class="header_top">
		<!--header_top-->
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="contactinfo">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-phone"></i> +84 123 465 789</a></li>
							<li><a href="#"><i class="fa fa-envelope"></i>
									dovantien@gmail.com</a></li>
                                                                        
                                                        <li><a href="account.jsp">Bạn chưa có tài khoản. Đăng kí ngay!</a></li>

						</ul>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="social-icons pull-right">
						<ul class="nav navbar-nav">
							<li><a target="_blank" href="#"><i
									class="fa fa-facebook"></i></a></li>
							<li><a target="_blank" href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a target="_blank" href="#"><i
									class="fa fa-linkedin"></i></a></li>
							<li><a target="_blank" href="#"><i
									class="fa fa-dribbble"></i></a></li>
							<li><a target="_blank" href="#"><i
									class="fa fa-google-plus"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header_top-->

	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="index.jsp"><img style="width:150px; height:100px"src="images/home/mobile-store-online.png" alt="" /></a>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<% if (session.getAttribute("usernamex") != null)	{	%>
							<li><a href="#"><i
									class="fa fa-user"></i> Tài khoản: <%=session.getAttribute("usernamex")%></a></li>
							<% } %>
							
							<li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i>
									Thanh Toán</a></li>
							<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
									Giỏ Hàng</a></li>
							<% if (session.getAttribute("usernamex") == null)	{	%>
							<li><a href="account.jsp"><i class="fa fa-lock"></i>
									Đăng Nhập</a></li>
							<% } else { %>	
							<li><a href="LoginServlet?enter=logout"><i class="fa fa-lock"></i>
									Đăng Xuất</a></li>	
							<% } %>		
									
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->
	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only"> Chuyển đổi điều hướng</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>

					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="index.jsp" class="active">Trang Chủ</a></li>

							<%
								for (Category Parent_Category : danhMucDAO.getListParentCategory()) {
							%>

							<li class="dropdown"><a href="#"> Các Loại IPhone <i
									class="fa fa-angle-down"></i></a>

								<ul role="menu" class="sub-menu">
									<%
										for (Category danh_muc_con : danhMucDAO.getListSubCategory(Parent_Category.getID_Category())) {
									%>
									<li><a
										href="index.jsp?ID_Category=<%=danh_muc_con.getID_Category()%>"><%=danh_muc_con.getName_Category()%></a></li>
									<%
										}
									%>
								</ul></li>

							<%
								}
							%>
                                                        <li><a href="index.jsp" >Tin Tức</a></li>
							<li><a href="contact.jsp">Liên Hệ</a></li>
						</ul>
					</div>

				</div>
				<div class="col-sm-3">
					<div class="search_box pull-right">
						<form action="SearchServlet" method="GET">
							<input type="text" placeholder="Tìm Kiếm" name="search" />
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom--> </header>
	<!--/header-->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/main.js"></script>
</body>
</html>