<%@page import="uit.dao.InvoiceDAOImpl"%>
<%@ page import="uit.model.Invoice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sửa Hóa Đơn | Admin Mobile-Store</title>
<!-- BOOTSTRAP STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="/DienThoaiVui/Admin/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<%
	if (session.getAttribute("usernamex") == null) {
		response.sendRedirect("/DienThoaiVui/account.jsp");
	} 
		String error_address = "", error_methods="", error_status="";
		if (request.getAttribute("error_address") != null) {
			error_address = (String) request.getAttribute("error_address");
		}
		if (request.getAttribute("error_methods") != null) {
			error_methods = (String) request.getAttribute("error_methods");
		}
		if (request.getAttribute("error_status") != null) {
			error_status = (String) request.getAttribute("error_status");
		}

		String Shipping_Address = "", Payment_Methods="";
		if (request.getAttribute("Shipping_Address") != null) {
			Shipping_Address = (String) request.getAttribute("Shipping_Address");
		}
		if (request.getAttribute("Payment_Methods") != null) {
			Payment_Methods = (String) request.getAttribute("Payment_Methods");
		}
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2><a href="Admin/invoice_manager.jsp" style="color: red">Sửa Hóa Đơn</a></h2>						
					</div>		
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Quản Lý Hóa Đơn</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form action="/DienThoaiVui/InvoiceServlet_Update_Del"
											method="post">

											<div class="form-group">
												<label>Địa Chỉ Giao Hàng: </label>	
												<span style="color: red;"><%=error_address%></span>							
												<input	class="form-control" type="text" name="Shipping_Address" value="<%=request.getParameter("Shipping_Address")%>" />
											</div>

											<div class="form-group">
												<label>Phương Thức Thanh Toán: </label>
												<span style="color: red;"><%=error_methods%></span>		
												 <select class="form-control" name="Payment_Methods" >
													<option value="<%=Payment_Methods%>">Chọn</option>
													<option value="Thanh toan khi giao hang" selected>Thanh
														toán khi giao hàng</option>
													<option value="Thanh toan qua the ngan hang">Thanh
														toán qua thẻ ngân hàng</option>
													<option value="Chuyen khoan ngan hang">Chuyển
														khoản ngân hàng</option>
												</select>
											</div>

											<div class="form-group">
												<label>Trạng Thái Đơn Hàng: </label> 
													
												<select
													class="form-control" name="Status_Order">
													<option value="1">Đã Thanh Toán</option>
													<option value="2" selected>Đang Xử Lý</option>
												</select>
											</div>
											<input type="hidden" name="action" value="Update"> 
											<input type="hidden" name="ID_Invoice" value="<%=request.getParameter("ID_Invoice")%>"> 
											<input type="submit" class="btn btn-danger" value="Sửa" /> 
											<input type="reset" class="btn btn-primary" value="Reset">
											<p style="color: red;">
											
											
											</p>
		
										</form>
										<br />

									</div>


								</div>
							</div>
						</div>

					</div>
				</div>

			</div>


		</div>
	</div>
	<!-- /. WRAPPER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>