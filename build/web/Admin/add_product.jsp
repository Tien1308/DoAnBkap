<%@page import="java.util.ArrayList"%>
<%@page import="uit.model.Product"%>
<%@page import="uit.dao.ProductDAOImpl"%>
<%@page import="uit.model.Category"%>
<%@page import="uit.dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Sản Phẩm | Admin Mobile-Store</title>
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
		CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
		ArrayList<Category> listCate = categoryDAO.getAll();
	%>
	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Sản Phẩm</h2>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Quản Lý Sản Phẩm</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<form role="form" action="/DienThoaiVui/ProductUpdate" method="POST" enctype="multipart/form-data">
											<div class="form-group">
												<!-- <label>Mã Sản Phẩm</label> --> <input class="form-control"
													placeholder="VD: 5001" type="hidden" name="ID_Product" value="" />
											</div>
											<div class="form-group">
												<label>Danh Mục</label> 
												<select name="Category" id="Category">
													<% for (Category category : listCate) { %>	
												  		<option value="<%=category.getID_Category() %>"><%=category.getName_Category() %></option>
												  	<% } %>
												</select>
											</div> 
											<div class="form-group">
												<label>Tên Sản Phẩm</label> <input class="form-control"
													placeholder="VD: IPhone 5" type="text" name="Name" value=""/>
											</div>
											<div class="form-group">
												<label>Chọn Hình Ảnh</label> <input type="file" name="image" id="imageFile" onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])">
												<img  src="" alt="" id="image">
											</div>
											<div class="form-group">
												<label>Số Lượng</label> <input class="form-control"
													placeholder="VD: Nhập số lượng" type="text" name="Quantity" value="" />
											</div>
											<div class="form-group">
												<label>Mô Tả</label>
												<textarea class="form-control" rows="" cols="" name="Describe"></textarea>
											</div>
											<div class="form-group">
												<label>Giá Bán</label> <input class="form-control"
													placeholder="VD: Nhập giá bán" type="text" name="Price" value=""/>
											</div>
											<!-- <div class="form-group">
												<label>Giảm Giá</label> <input class="form-control"
													placeholder="VD: Nhập giá giảm" type="text" />
											</div> -->
											<!-- <button type="submit" class="btn btn-success">Thêm</button> -->
											<input type="hidden" name="action" value="Insert">
											<button type="submit" class="btn btn-danger">Thêm</button>
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
<script type="text/javascript">
<!--

//-->
</script>
