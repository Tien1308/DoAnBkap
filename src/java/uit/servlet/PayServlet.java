package uit.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.TreeMap;
import java.util.Map;
import javax.servlet.ServletException;
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

public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private InvoiceDAOImpl hdDAO = new InvoiceDAOImpl();
	private InvoiceDetailDAOImpl hdctDAO = new InvoiceDetailDAOImpl();
	private AccountDAOImpl accDAO = new AccountDAOImpl();

	public PayServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String Shipping_Address = request.getParameter("Shipping_Address");
		String Payment_Methods = request.getParameter("Payment_Methods");
		String Account = request.getParameter("Account");
		String Email = request.getParameter("Email");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		String error_address = "", error_methods = "", error_email = "";

		// Validate dia chi
		if (Shipping_Address.equals("")) {
			error_address = "Vui lòng nhập địa chỉ của bạn !";
		}
		if (error_address.length() > 0) {
			request.setAttribute("error_address", error_address);
		}
		// Validate phuong thuc thanh toan
		if (Payment_Methods.equals("")) {
			error_methods = "Vui lòng chọn phương thức thanh toán";
		}
		if (error_methods.length() > 0) {
			request.setAttribute("error_methods", error_methods);
		}
		// Validate Email
		if (Email.equals("")) {
			error_email = "Vui lòng nhập địa chỉ Email của bạn !";
		}
		if (error_email.length() > 0) {
			request.setAttribute("error_email", error_email);
		}

		request.setAttribute("Shipping_Address", Shipping_Address);
		request.setAttribute("Payment_Methods", Payment_Methods);
		request.setAttribute("Email", Email);
		try {
			if (error_address.length() == 0 && error_methods.length() == 0) {
				Date date = new Date();
				String mhd = "MHD" + date.getTime();
				Account acc = new Account();
				acc.setID_Account(accDAO.getAccount(Account).getID_Account());
				Invoice hd = new Invoice(mhd, acc, Shipping_Address, Payment_Methods,
						new Timestamp(new Date().getTime()), 2);
				hd.setID_Invoice(mhd);
				hdDAO.insertInvoice(hd);
				TreeMap<Product, Integer> list = cart.getList();
				int temp=1;
				for (Map.Entry<Product, Integer> ds : list.entrySet()) {
					temp++;
					Product pr = new Product();
					pr.setID_Product(ds.getKey().getID_Product());
					int mhdct = (int) date.getTime() + temp;
					int uit = ds.getValue() * ds.getKey().getPrice();
					hdctDAO.insertInvoiceDetail(
							new InvoiceDetail(mhdct, hd, pr, ds.getValue(), ds.getKey().getPrice(), ds.getKey().getSale()));

//					SendMail.sendMail(Email, "Xin Chào, sKhách hàng: " + accDAO.getAccount(Account).getID_Account(),
//							"Cam on ban da mua hang tai HTT Mobile" + "\nMa San Pham: " + pr.getID_Product()
//									+ "\nSo Luong: " + ds.getValue() + "\nTong Tien: " + uit + " VND"
//									+ "\nDia Chi Giao Hang: " + Shipping_Address + "\nPhuong Thuc Thanh Toan: "
//									+ Payment_Methods);
				}

				request.setAttribute("message", "Thanh toán thành công !");
				cart.clear();
				request.getRequestDispatcher("success.jsp").forward(request, response);
				
			} else {
				request.setAttribute("message", "Mua hàng thất bại !");
				request.getRequestDispatcher("checkout.jsp").forward(request, response);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
