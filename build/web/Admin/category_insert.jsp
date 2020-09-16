<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Danh Mục | Admin Mobile-Store</title>
<!-- BOOTSTRAP STYLES-->
<link href="/SOF301_Assignment/Admin/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/SOF301_Assignment/Admin/assets/css/font-awesome.css" rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link href="/SOF301_Assignment/Admin/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/SOF301_Assignment/Admin/assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Thêm Danh Mục</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Quản Lý Danh Mục</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/DienThoaiVui/CategoryServlet_Update" method="POST">
											<div class="form-group">
												<!-- <label>Mã Danh Mục</label>  --><input class="form-control" name="ID_Category"
													placeholder="VD: IP" type="hidden"  />
											</div>
											<div class="form-group">
												<label>Tên Danh Mục</label> <input class="form-control" name="Name"
													placeholder="VD: IPhone" type="text"  />
											</div>
											<%-- <div class="form-group">
												<label>Danh Mục Cha</label> <input class="form-control"
													placeholder="VD: Null" type="text" value=<%=request.getParameter("ID_Category")%>/>
											</div> --%>
											<input type="hidden" name="action" value="Insert">
											
											<button type="submit" class="btn btn-danger">Cập nhật</button>
											<!-- <button type="reset" class="btn btn-primary">Reset
												Button</button> -->

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