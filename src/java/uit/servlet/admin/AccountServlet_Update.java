package uit.servlet.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uit.dao.AccountDAOImpl;
import uit.model.Account;

@WebServlet("/AccountServlet_Update")
public class AccountServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AccountDAOImpl accDAO = new AccountDAOImpl();

	public AccountServlet_Update() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		String ID_Account = request.getParameter("ID_Account");
		String Password = request.getParameter("Password");
		String Email = request.getParameter("Email");
		String Fullname = request.getParameter("Fullname");
		String Address = request.getParameter("Address");
		String Phone = request.getParameter("Phone");
		int Access = Integer.parseInt(request.getParameter("Access"));
		int Status = Integer.parseInt(request.getParameter("Status"));

		String password_error = "", email_error = "", fullname_error = "", address_error = "", phone_error = "",
				access_error = "", status_error = "";

		// Validate Password
		if (Password.equals("")) {
			password_error = "Vui lòng nhập Mật Khẩu của bạn !";
		}
		if (password_error.length() > 0) {
			request.setAttribute("password_error", password_error);
		}
		// Validate Email
		if (Email.equals("")) {
			email_error = "Vui lòng nhập Email của bạn !";
		} 
//		else {
//			if (accDAO.checkEmail(Email) == true) {
//				email_error = "Email này đã được đăng ký, vui lòng ch�?n Email khác !";
//			}
//		}
		if (email_error.length() > 0) {
			request.setAttribute("email_error", email_error);
		}
		// Validate Fullname
		if (Fullname.equals("")) {
			fullname_error = "Vui lòng nhập Họ Tên của bạn !";
		}
		if (fullname_error.length() > 0) {
			request.setAttribute("fullname_error", fullname_error);
		}
		// Validate �?ịa Chỉ
		if (Address.equals("")) {
			address_error = "Vui lòng nhập Địa Chỉ của bạn !";
		}
		if (address_error.length() > 0) {
			request.setAttribute("address_error", address_error);
		}
		// Validate SDT
		if (Phone.equals("")) {
			phone_error = "Vui lòng nhập Số Điện Thoại của bạn !";
		}
		if (phone_error.length() > 0) {
			request.setAttribute("phone_error", phone_error);
		}
		// Validate Quy�?n Truy Cập
		if (Access == 0) {
			access_error = "Vui lòng chọn Quyền Truy Cập của bạn !";
		}
		if (Access == 1 || Access == 2) {
			request.setAttribute("access_error", access_error);
		}
		// Validate Trạng Thái
		if (Status == 0) {
			status_error = "Vui lòng chọn Trạng Thái của bạn !";
		}
		if (Status == 1 || Status == 2) {
			request.setAttribute("status_error", status_error);
		}

		request.setAttribute("Password", Password);
		request.setAttribute("Email", Email);
		request.setAttribute("Fullname", Fullname);
		request.setAttribute("Address", Address);
		request.setAttribute("Phone", Phone);
		request.setAttribute("Access", Access);
		request.setAttribute("Status", Status);
		try {
			switch (action) {
			case "Update":

				if (password_error.length() == 0 && email_error.length() == 0 && fullname_error.length() == 0
						&& address_error.length() == 0 && phone_error.length() == 0) {
					Account acc = new Account(ID_Account, null, Password, Email, Fullname, Address, Phone, Access,
							Status);
					accDAO.updateAccount(acc);
					url = "/Admin/account_manager.jsp";
					break;
				} else {
					url = "/Admin/account_edit.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
