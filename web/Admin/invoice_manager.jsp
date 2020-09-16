<%@page import="java.text.NumberFormat"%>
<%@page import="uit.dao.ProductDAOImpl"%>
<%@page import="uit.dao.InvoiceDetailDAOImpl"%>
<%@page import="uit.dao.InvoiceDetailDAO"%>
<%@page import="uit.model.InvoiceDetail"%>
<%@page import="uit.dao.AccountDAOImpl"%>
<%@page import="uit.dao.InvoiceDAOImpl"%>
<%@page import="uit.model.Invoice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Quản Lý Danh Mục | Admin Mobile-Store</title>
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
		InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();
		ArrayList<Invoice> listInvoice = invoiceDAO.getListInvoice();
		AccountDAOImpl accDAO = new AccountDAOImpl();

		InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();
		ArrayList<InvoiceDetail> listInvoiceDetail = invoiceDetailDAO.getListInvoiceDetail();
		ProductDAOImpl productDAO = new ProductDAOImpl(); 
		
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
	%>

	<div id="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h2>Quản Lý Hoá Đơn</h2>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".sidebar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						<!-- 	<a class="navbar-brand" href="invoice_manager.jsp" style="color: white;"></a> -->
						</div>
					</div>
				</div>
				<hr />


				<div class="row">
					<div class="col-md-12">

						<%-- <div class="panel panel-default">
							<div class="panel-heading">Hóa Đơn Chi Tiết</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr style="text-align: center;">
												<th>Hóa Đơn Chi Tiết</th>
												<th>Mã Hóa Đơn</th>
												<th>Sản Phẩm</th>
												<th>Số Lượng</th>
												<th>Giá Sản Phẩm</th>
												<th>Giảm Giá</th>
												<th>Tổng Tiền</th>
												<th>Chức Năng</th>
											</tr>
										</thead>

										<%
											for (InvoiceDetail invoiceDetail : listInvoiceDetail) {
										%>
										<tbody>
											<tr class="odd gradeX">
												<td><%=invoiceDetail.getID_InvoiceDetail()%></td>
												<td><%=invoiceDetail.getHoa_Don().getID_Invoice()%></td>
												<td><%=productDAO.getProduct(invoiceDetail.getSan_Pham().getID_Product()).getName_Product()%></td>
												<td><%=invoiceDetail.getQuantity()%></td>
												<td><%=nf.format(invoiceDetail.getPrice())%> VNĐ</td>
												<td><%=invoiceDetail.getSale()%> %</td>
												<td>
												<% if(invoiceDetail.getSale()==0) {%>
													<%=nf.format(invoiceDetail.getQuantity()*invoiceDetail.getPrice())%> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==2) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.98)) %> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==5) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.95)) %> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==8) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.92)) %> VNĐ
												<% } %>
												<% if(invoiceDetail.getSale()==10) {%>
													<%=nf.format((invoiceDetail.getQuantity()*invoiceDetail.getPrice())*(0.90)) %> VNĐ
												<% } %>
												</td>
												<td class="center" style="text-align: center;">
												<a href="/DienThoaiVui/Admin/invoiceDetail_edit.jsp?action=Update&ID_InvoiceDetail=<%=invoiceDetail.getID_InvoiceDetail()%>&Quantity=<%=invoiceDetail.getQuantity()%>" class="btn btn-danger btn-xs">Sửa</a> 
												<a href="/DienThoaiVui/InvoiceDetailServlet_Update_Del?action=Delete&ID_InvoiceDetail=<%=invoiceDetail.getID_InvoiceDetail() %>" onclick="return confirm('Bạn chắc chắn chứ ?')" class="btn btn-warning btn-xs">Xóa</a>
												</td>
											</tr>
										</tbody>
										<%
											}
										%>
									</table>
								</div>
							</div>
						</div> --%>

						<div class="panel panel-default">
							<div class="panel-heading">Quản Lý Hóa Đơn</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr style="text-align: center;">
												<!-- <th>Mã Hóa Đơn</th> -->
												<th>Khách Hàng</th>
												<th>Địa Chỉ Giao Hàng</th>
												<th>Số điện thoại </th>
												<th>Phương Thức Thanh Toán</th>
												<th>Ngày Mua Hàng</th>
												<th>Trạng Thái Đơn Hàng</th>
												<th>Chức Năng</th>
											</tr>
										</thead>

										<%
											for (Invoice invoice : listInvoice) {
										%>
										<tbody>
											<tr class="odd gradeX">
												<%-- <td><%=invoice.getID_Invoice()%></td> --%>
												<td><%=accDAO.getUser(invoice.getTai_Khoan().getID_Account()).getUsername()%></td>
												<td><%=invoice.getShipping_Address()%></td>
												<td><%=accDAO.getUser(invoice.getTai_Khoan().getID_Account()).getSDT()%> </td>
												<td><%=invoice.getPayment_Methods()%></td>
												
												<td><%=invoice.getPurchase_Date()%></td>	
												<td class="center" style="text-align: center;">
												<%
													if (invoice.getStatus_Order()==1){
												%>
												<a class="btn btn-success btn-xs" >Đã Thanh Toán</a>
												<%
													}															
												%>	
												<% 
													if (invoice.getStatus_Order()==2) {											
												%>									
												<a class="btn btn-primary btn-xs">Đang Xử Lý</a>			
												<%
													}
												%>
												</td>
												<td class="center" style="text-align: center;">
												<a href="/DienThoaiVui/Admin/invoice_detail.jsp?ID_Invoice=<%=invoice.getID_Invoice()%>"
													class="btn btn-primary btn-xs">Chi Tiết</a> 
												<a href="/DienThoaiVui/Admin/invoice_edit.jsp?action=Update&ID_Invoice=<%=invoice.getID_Invoice()%>&Shipping_Address=<%=invoice.getShipping_Address() %>"
													class="btn btn-danger btn-xs">Sửa</a> 
												<a href="/DienThoaiVui/InvoiceServlet_Update_Del?action=Delete&ID_Invoice=<%=invoice.getID_Invoice() %> " onclick="return confirm('Bạn chắc chắn chứ ?')"
													class="btn btn-warning btn-xs">Xóa</a></td>
											</tr>
										</tbody>

										<%
											}
										%>
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