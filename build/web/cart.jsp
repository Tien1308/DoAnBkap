<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="uit.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Giỏ Hàng | Mobile-Store</title>
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
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<Product, Integer> list = cart.getList();

		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<section>
	<div class="container">
		<div class="row">

			<section id="cart_items">
			<div class="container">
				<div class="breadcrumbs">
					<ol class="breadcrumb">
						<li><a href="index.jsp">Home</a></li>
						<li class="active">HTT Mobile</li>
					</ol>
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
									 <a class="cart_quantity_down"
											href="CartServlet?enter=giam&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
											- </a>
										 <input class="cart_quantity_input" type="text"
											value="<%=ds.getValue()%>" autocomplete="off" size="2"
											disabled="">
											<a class="cart_quantity_up"
											href="CartServlet?enter=tang&ID_Product=<%=ds.getKey().getID_Product()%>&cartID=<%=System.currentTimeMillis()%>">
											+ </a>
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
			</div>
			</section>
			<!--/#cart_items-->

			<section id="do_action">
			<div class="container">
				<div class="heading">
					<h3>Bạn muốn lam gì tiếp theo?</h3>
					
				</div>
				<div class="row">				
					<div class="col-sm-6">
						<div class="total_area">						
							<a class="btn btn-default update" href="index.jsp" onclick="return confirm('Bạn muốn hủy đơn hàng ?')">Hủy Đơn Hàng</a>
							<a class="btn btn-default check_out" href="checkout.jsp">Mua Hàng</a>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--/#do_action-->
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>