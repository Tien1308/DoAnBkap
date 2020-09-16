<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Liên Hệ | Mobile-Store</title>
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

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="contact-page" class="container">
		<div class="bg">
			<div class="row">
				<div class="col-sm-8">
					<div class="contact-form">
						<h2 class="title text-center">LIÊN HỆ VỚI CHÚNG TÔI</h2>
						<div class="status alert alert-success" style="display: none"></div>
						<form id="main-contact-form" class="contact-form row"
							name="contact-form" method="post">
							<div class="form-group col-md-6">
								<input type="text" name="name" class="form-control" required
									placeholder="Họ Và Tên">
							</div>
							<div class="form-group col-md-6">
								<input type="email" name="email" class="form-control" required
									placeholder="Địa Chỉ Email">
							</div>
							<div class="form-group col-md-12">
								<input type="text" name="subject" class="form-control" required
									placeholder="Tiêu đề">
							</div>
							<div class="form-group col-md-12">
								<textarea name="message" id="message" required
									class="form-control" rows="8" placeholder="Nội dung"></textarea>
							</div>
							<div class="form-group col-md-12">
								<input type="submit" name="submit"
									class="btn btn-primary pull-right" value="Gửi">
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="contact-info">
						<h2 class="title text-center">THÔNG TIN LIÊN LẠC</h2>
						<address>
							<p>Mobile-Store</p>
							
							<p>Hà Nội, Việt Nam</p>
							<p>Mobile: +84 123 465 789</p>
							<p>Fax: +84 465 234 79</p>
							<p>Email: dovantien1308@gmail.com.com</p>
						</address>
						<div class="social-networks">
							<h2 class="title text-center">MẠNG XÃ HỘI</h2>
							<ul>
								<li><a target="_blank" href="http://facebook.com/"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a target="_blank" href="#"><i class="fa fa-youtube"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/#contact-page-->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>