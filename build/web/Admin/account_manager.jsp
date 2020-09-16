<%@page import="java.util.ArrayList"%>
<%@page import="uit.model.Account"%>
<%@page import="uit.dao.AccountDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Tài Khoản | Admin Mobile-Store</title>
<!-- BOOTSTRAP STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- MORRIS CHART STYLES-->
<link
	href="/DienThoaiVui/Admin/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- CUSTOM STYLES-->
<link href="/DienThoaiVui/Admin/assets/css/custom.css"
	rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>

	<%
	if (session.getAttribute("usernamex") == null) {
		response.sendRedirect("/DienThoaiVui/account.jsp");
	} 
		AccountDAOImpl accDAO = new AccountDAOImpl();
		ArrayList<Account> listAcc = accDAO.getAll();
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Tài Khoản</h2>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="/DienThoaiVui/Admin/account_insert.jsp" 
								style="color: white;">Thêm Tài Khoản</a>
						</div>
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-md-12">

						<div class="panel panel-default">
							<div class="panel-heading">Quản lý tài khoản</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<!-- <th>Mã Tài Khoản</th> -->
												<th>Tài Khoản</th>
												<!-- <th>Mật Khẩu</th> -->
												<th>Email</th>
												<th>Họ Và Tên</th>
												<th>Địa Chỉ</th>
												<th>Số Điện Thoại</th>
												<th>Quyền</th>
												<th>Trạng Thái</th>
												<th>Chức Năng</th>
											</tr>
										</thead>

										<tbody>
											<%
												for (Account acc : listAcc) {
											%>
											<tr class="odd gradeX">
												<%-- <td><%=acc.getID_Account()%></td> --%>
												<td><%=acc.getUsername()%></td>
												<%-- <td><%=acc.getPassword()%></td> --%>
												<td><%=acc.getEmail()%></td>
												<td><%=acc.getFull_Name()%></td>
												<td><%=acc.getAddress()%></td>
												<td><%=acc.getSDT()%></td>
												<td class="center" style="text-align: center;">
												<%
													if (acc.getAccess() == 1) {
												%>
												<a class="btn btn-success btn-xs" >Admin</a>
												<%
													}
												%>
												<%
													if (acc.getAccess() == 2) {
												%>
												<a class="btn btn-info btn-xs" >Khách Hàng</a>
												<%
													}
												%>
												</td>
												<td class="center" style="text-align: center;">
												<%
													if (acc.getStatus() == 1) {
												%>
												<a class="btn btn-danger btn-xs" >Đã Kích Hoạt</a>
												<%
													}
												%>
												<%
													if (acc.getStatus() == 2) {
												%>
												<a class="btn btn-default btn-xs" >Đang Chờ</a>
												<%
													}
												%>
												</td>
												<td class="center" style="text-align: center;">
													<a href="/DienThoaiVui/Admin/account_edit.jsp?action=Update&ID_Account=<%=acc.getID_Account()%>&Username=<%=acc.getUsername()%>&Email=<%=acc.getEmail() %>&Fullname=<%=acc.getFull_Name() %>&Address=<%=acc.getAddress() %>&Phone=<%=acc.getSDT() %>&Access=<%=acc.getAccess() %>&Status=<%=acc.getStatus() %> "
													class="btn btn-info btn-xs">Sửa</a> 
													<a href="/DienThoaiVui/AccountServlet_Add_Del?action=Delete&ID_Account=<%=acc.getID_Account()%>" onclick="return confirm('Bạn chắc chắn chứ ?')"
													 class="btn btn-warning btn-xs">Xóa</a></td>
											</tr>
											<%
												}
											%>
										</tbody>

									</table>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.min.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- DATA TABLE SCRIPTS -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>
</body>
</html>