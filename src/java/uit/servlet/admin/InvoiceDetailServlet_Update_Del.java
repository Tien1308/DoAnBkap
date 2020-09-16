package uit.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uit.dao.InvoiceDetailDAOImpl;
import uit.model.InvoiceDetail;

@WebServlet("/InvoiceDetailServlet_Update_Del")
public class InvoiceDetailServlet_Update_Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static InvoiceDetailDAOImpl invoiceDetailDAO = new InvoiceDetailDAOImpl();

	public InvoiceDetailServlet_Update_Del() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		int ID_InvoiceDetail = Integer.parseInt(request.getParameter("ID_InvoiceDetail"));
		try {
			switch (action) {
			case "Delete":
				invoiceDetailDAO.deleteInvoiceDetail(ID_InvoiceDetail);
				url = "/Admin/invoice_manager.jsp";
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
		String url = "";
		int ID_InvoiceDetail = Integer.parseInt(request.getParameter("ID_InvoiceDetail"));
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		//int Price = Integer.parseInt(request.getParameter("Price"));
		int Sale = Integer.parseInt(request.getParameter("Sale"));

		// Validate so luong
		String error_quantity = "";
		if (Quantity == 0) {
			error_quantity = "Vui lòng nhập số lượng !";
		}
		if (error_quantity.length() > 0) {
			request.setAttribute("error_quantity", error_quantity);
		}
		request.setAttribute("Quantity", Quantity);
		try {
				switch (action) {
				case "Update":
					invoiceDetailDAO.updateInvoiceDetail(
							new InvoiceDetail(ID_InvoiceDetail, null, null, Quantity, 0, Sale));
					url = "/Admin/invoice_manager.jsp";
					break;
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
