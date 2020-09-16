<%@page import="uit.dao.AccountDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Tài Khoản | Mobile-Store</title>
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
		String username_error = "", password_error = "", password1_error = "",password2_error = "", email_error = "", fullname_error = "", phone_error = "",
				address_error = "";
		if (request.getAttribute("username_error") != null) {
			username_error = (String) request.getAttribute("username_error");
		}
		if (request.getAttribute("password_error") != null) {
			password_error = (String) request.getAttribute("password_error");
		}
		if (request.getAttribute("password1_error") != null) {
			password1_error = (String) request.getAttribute("password1_error");
		}
		if (request.getAttribute("password2_error") != null) {
			password2_error = (String) request.getAttribute("password2_error");
		}
		if (request.getAttribute("email_error") != null) {
			email_error = (String) request.getAttribute("email_error");
		}
		if (request.getAttribute("fullname_error") != null) {
			fullname_error = (String) request.getAttribute("fullname_error");
		}
		if (request.getAttribute("phone_error") != null) {
			phone_error = (String) request.getAttribute("phone_error");
		}
		if (request.getAttribute("address_error") != null) {
			address_error = (String) request.getAttribute("address_error");
		}

		String username = "", password1 = "",password2 = "", email = "", phone = "", fullname = "", address = "";
		if (request.getAttribute("username") != null) {
			username = (String) request.getAttribute("username");
		}
		if (request.getAttribute("password1") != null) {
			password1 = (String) request.getAttribute("password1");
		}
		if (request.getAttribute("password2") != null) {
			password2 = (String) request.getAttribute("password2");
		}
		if (request.getAttribute("email") != null) {
			email = (String) request.getAttribute("email");
		}
		if (request.getAttribute("fullname") != null) {
			fullname = (String) request.getAttribute("fullname");
		}
		if (request.getAttribute("phone") != null) {
			phone = (String) request.getAttribute("phone");
		}
		if (request.getAttribute("address") != null) {
			address = (String) request.getAttribute("address");
		}

		String error = "";
		if (request.getAttribute("error") != null) {
			error = (String) request.getAttribute("error");
		}
		String usernamex = "", passwordx = "";
		if (request.getAttribute("usernamex") != null) {
			usernamex = (String) request.getAttribute("usernamex");
		}
		if (request.getAttribute("passwordx") != null) {
			passwordx = (String) request.getAttribute("passwordx");
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<section id="form"><!--form-->
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-1">
				<div class="login-form">
					<!--login form-->
					<h2>Đăng Nhập</h2>
					<form action="LoginServlet" method="post">
						<p style="color: red"><%=error%>
							<input type="text" placeholder="Tài Khoản" name="ten_dang_nhap"
								value="<%=usernamex%>" /> <input type="password"
								placeholder="Mật Khẩu" name="mat_khau" value="<%=passwordx%>" />
							<input type="hidden" name="access" value="2" />
							<input type="hidden" name="status" value="1" />
							 <span
								style="color: gray;"> <input type="checkbox"
								class="checkbox"> Duy trì đăng nhập
							</span>
							<button type="submit" class="btn btn-default">Đăng Nhập</button>
					
					</form>
				</div>
				<!--/login form-->
			</div>
			<div class="col-sm-1">
				<h2 class="or">HAY</h2>
			</div>
			<div class="col-sm-4">
				<div class="signup-form">
					<!--sign up form-->
					<h2>Đăng Ký Tài Khoản Mới</h2>
					<form action="RegisterServlet" method="post">
						<p style="color: blue;"><%=password_error%></p>
						
						<p style="color: red;"><%=username_error%></p>
						<input type="text" placeholder="Tài Khoản" name="ten_dang_nhap"
							value="<%=username%>" />
						
						<p style="color: red;"><%=password1_error%></p>
						<input type="password" placeholder="Mật Khẩu" name="mat_khau1"
							value="<%=password1%>" /> 
							
						<p style="color: red;"><%=password2_error%></p>
						<input type="password"
							placeholder="Nhập Lại Mật Khẩu" name="mat_khau2"
							value="<%=password2%>" />
						
							
						<p style="color: red;"><%=email_error%></p>
						<input type="email" placeholder="Địa Chỉ Email" name="email"
							value="<%=email%>" /> 
							
						<p style="color: red;"><%=fullname_error%></p>	
						<input type="text" placeholder="Họ Và Tên"
							name="ho_va_ten" value="<%=fullname%>"/> 
						
						<p style="color: red;"><%=phone_error%></p>
						<input type="text"
							placeholder="Số Điện Thoại" name="so_dien_thoai"  value="<%=phone%>"/> 
						
						<p style="color: red;"><%=address_error%></p>
						<select name="dia_chi">
							<option value="<%=address%>">Chọn Địa Chỉ</option>
							<option value="Hai Phong">Hải Phòng</option>
							<option value="Ha Noi">Hà Nội</option>
							<option value="Ho Chi Minh">Hồ Chí Minh</option>
							<option value="Ca Mau">Cà Mau</option>
							<option value="Bac Ninh">Bắc Ninh</option>
							<option value="Bac Giang">Bắc Giang</option>
							<option value="Vinh Phuc">Vĩnh Phúc</option>
							<option value="Nam Dinh">Nam Định</option>
							<option value="Hai Duong">Hải Dương</option>
						</select>
						
						 <br> </br>
						<button type="submit" class="btn btn-default">Đăng Ký</button>
					</form>
					<span style="color: blue">${message}</span>
				</div>
				<!--/sign up form-->
			</div>
		</div>
	</div>
	</section>
	<!--/form-->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>