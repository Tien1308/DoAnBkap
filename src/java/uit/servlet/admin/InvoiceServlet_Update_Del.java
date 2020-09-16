package uit.servlet.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uit.dao.InvoiceDAOImpl;
import uit.model.Invoice;

@WebServlet("/InvoiceServlet_Update_Del")
public class InvoiceServlet_Update_Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDAOImpl invoiceDAO = new InvoiceDAOImpl();

	public InvoiceServlet_Update_Del() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Invoice = request.getParameter("ID_Invoice");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				invoiceDAO.deleteInvoice(ID_Invoice);
				url = "/Admin/invoice_manager.jsp";
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Invoice = request.getParameter("ID_Invoice");
		String Shipping_Address = request.getParameter("Shipping_Address");
		String Payment_Methods = request.getParameter("Payment_Methods");
		int Status_Order = Integer.parseInt(request.getParameter("Status_Order"));

		String url = "";
		String error_address = "", error_methods = "", error_status = "";

		// Validate dia chi
		if (Shipping_Address.equals("")) {
			error_address = "Vui lòng nhập địa chỉ của bạn !";
		}
		if (error_address.length() > 0) {
			request.setAttribute("error_address", error_address);
		}
		// Validate phuong thuc thanh toan
		if (Payment_Methods.equals("")) {
			error_methods = "Vui lòng chọn phương thức thanh toán !";
		}
		if (error_methods.length() > 0) {
			request.setAttribute("error_methods", error_methods);
		}
		// Validate trang thai
		if (Status_Order == 0) {
			error_status = "Vui lòng chọn trạng thái đơn hàng !";
		}
		if (Status_Order == 1 || Status_Order == 2) {
			request.setAttribute("error_status", error_status);
		}

		request.setAttribute("Shipping_Address", Shipping_Address);
		request.setAttribute("Payment_Methods", Payment_Methods);
		request.setAttribute("Status_Order", Status_Order);

		try {
			if (error_address.length() == 0 && error_methods.length() == 0) {
				switch (action) {
				case "Update":
					invoiceDAO.updateInvoice(
							new Invoice(ID_Invoice, null, Shipping_Address, Payment_Methods, null, Status_Order));
					url = "/Admin/invoice_manager.jsp";
					break;
				}
			} else {
				url = "/Admin/invoice_edit.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);

	}
}
