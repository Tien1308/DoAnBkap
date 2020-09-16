<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="uit.model.*"%>
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
<title>Thanh Toán | Mobile-Store</title>
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
		if (session.getAttribute("usernamex") == null) {
			response.sendRedirect("/Website-ban-dien-thoai/account.jsp");
		} else {
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			TreeMap<Product, Integer> list = cart.getList();

			NumberFormat nf = NumberFormat.getInstance();
			nf.setMinimumIntegerDigits(0);

			String error_address = "", error_methods = "", error_email="";
			if (request.getAttribute("error_address") != null) {
				error_address = (String) request.getAttribute("error_address");
			}
			if (request.getAttribute("error_email") != null) {
				error_email = (String) request.getAttribute("error_email");
			}
			if (request.getAttribute("error_methods") != null) {
				error_methods = (String) request.getAttribute("error_methods");
			}
			
			String Shipping_Address = "", Payment_Methods = "", Email="";
			if (request.getAttribute("Shipping_Address") != null) {
				Shipping_Address = (String) request.getAttribute("Shipping_Address");
			}
			if (request.getAttribute("Email") != null) {
				Email = (String) request.getAttribute("Email");
			}
			if (request.getAttribute("Payment_Methods") != null) {
				Payment_Methods = (String) request.getAttribute("Payment_Methods");
			}
			AccountDAOImpl account = new AccountDAOImpl();
			Account user  = account.getAccount((String) session.getAttribute("usernamex"));
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="index.jsp">Home</a></li>
				<li class="active">Thanh Toán</li>
			</ol>
		</div>



		<div class="register-req" style="font-size: 20px; font-weight: bold;">
			<p>Thông Tin Thanh Toán</p>
		</div>

		<div class="review-payment">
			<h2>Thông Tin Đơn Hàng</h2>
		</div>

		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">Hình Ảnh</td>
						<td class="description">Thông Tin Sản Phẩm</td>
						<td class="price">Giá Bán</td>
						<td class="quantity">Số Lượng</td>
						<td class="total">Tổng Tiền</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<%
						Integer sum=0;
						for (Map.Entry<Product, Integer> ds : list.entrySet()) {
							sum += (ds.getValue() * ds.getKey().getPrice());
					%>
					<tr>
						<td class="cart_product"><a href=""><img
								src="<%=ds.getKey().getImage()%>" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href=""><%=ds.getKey().getName_Product()%></a>
							</h4>
							<p>
								Mã Sản Phẩm:
								<%=ds.getKey().getID_Product()%></p>
						</td>
						<td class="cart_price">
							<p><%=nf.format(ds.getKey().getPrice())%>
								VNĐ
							</p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up"
									href="CartServlet?enter=tang&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
									+ </a> <input class="cart_quantity_input" type="text"
									value="<%=ds.getValue()%>" autocomplete="off" size="2"
									disabled=""> <a class="cart_quantity_down"
									href="CartServlet?enter=giam&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
									- </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price"><%=nf.format(ds.getValue() * ds.getKey().getPrice())%>
								VNĐ
							</p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="CartServlet?enter=remove&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>"><i
								class="fa fa-times"></i></a></td>
					</tr>

					<%
						}
					%>

				</tbody>
			</table>
			<h2>Tổng tiền: <%=nf.format(sum) %> VNĐ</h2>
		</div>

		<div class="shopper-informations" style="text-align: center; display: flex;
    justify-content: center;">
			<div class="row">
				<div class="col-sm-6" style="
    width: 100%;">
					<div class="shopper-info">
						<form action="PayServlet" method="post">
						
							<p>Địa Chỉ Giao Hàng</p>
							<span style="color: red;"><%=error_address%></span>
							<input name="Shipping_Address" value="<%=user.getAddress() %>"></input>
							
							<p>Số điện thoại</p>
							<span style="color: red;"><%=error_email%></span>
							<input name="SDT" value="<%=user.getSDT() %>"></input>
							
							<p>Email</p>
							<span style="color: red;"><%=error_email%></span>
							<input type="email" name="Email" value="<%=user.getEmail() %>"></input>
							
							<p>Phương Thức Thanh Toán</p>
							<span style="color: red;"><%=error_methods%></span> <select
								name="Payment_Methods">
								<option value="">Chọn</option>
								<option value="Thanh toan khi giao hang" selected>Thanh toán khi giao hàng</option>
								<option value="Thanh toan qua the ngan hang">Thanh toán qua thẻ ngân hàng</option>
								<option value="Chuyen khoan ngan hang">Chuyển khoản ngân hàng</option>
							</select>
							 
							<input type="hidden" value="<%=session.getAttribute("usernamex")%>" name="Account" />
							<input type="submit" value="Xác Nhận Mua Hàng" class="btn btn-primary" />
						</form>
						<span style="color: blue;">${message}</span>
					</div>
				</div>
			</div>



		</div>
		</br>
		</hr>
		</br>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

	<%
		}
	%>
</body>
</html>