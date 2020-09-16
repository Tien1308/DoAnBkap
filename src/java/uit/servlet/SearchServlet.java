package uit.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.TreeMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uit.dao.AccountDAOImpl;
import uit.dao.InvoiceDAOImpl;
import uit.dao.InvoiceDetailDAOImpl;
import uit.model.Account;
import uit.model.Cart;
import uit.model.Invoice;
import uit.model.InvoiceDetail;
import uit.model.Product;
import uit.util.SendMail;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	public SearchServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/index.jsp?Name_Product=" + request.getParameter("search");
		response.sendRedirect(request.getContextPath() + url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
