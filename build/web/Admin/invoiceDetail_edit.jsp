<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sửa Hóa Đơn Chi Tiết | Admin Mobile-Store</title>
<!-- BOOTSTRAP STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="/DienThoaiVui/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
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
		String error_quantity = "";
		if (request.getAttribute("error_quantity") != null) {
			error_quantity = (String) request.getAttribute("error_quantity");
		}			
		String Quantity = "";
		if (request.getAttribute("Quantity") != null) {
			Quantity = (String) request.getAttribute("Quantity");
		}
		
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Hóa Đơn Chi Tiết</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Quản Lý Hóa Đơn Chi Tiết</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form  action="/DienThoaiVui/InvoiceDetailServlet_Update_Del" method="post">
											<div class="form-group">
												<label>Số Lượng</label> 
												<span style="color: red"><%=error_quantity %></span>
												<input class="form-control" type="text" name="Quantity" value="<%=Integer.parseInt(request.getParameter("Quantity"))%>"/>
											</div>										
											<div class="form-group">
												<label>Giảm Giá</label>
												<select class="form-control" name="Sale">
													<option value=0>Không Giảm Giá</option>
													<option value=2>Giảm Giá 2%</option>
													<option value=5>Giảm Giá 5%</option>
													<option value=8>Giảm Giá 8%</option>
													<option value=10>Giảm Giá 10%</option>
												</select>									
											</div>
											<input type="hidden" name="action" value="Update"/>
											<input type="hidden" name="ID_InvoiceDetail" value="<%=Integer.parseInt(request.getParameter("ID_InvoiceDetail"))%>"/>
											<button type="submit" class="btn btn-danger">Sửa</button>
											<button type="reset" class="btn btn-primary">Reset
												Button</button>

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