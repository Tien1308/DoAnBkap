package uit.servlet.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uit.dao.AccountDAOImpl;
import uit.model.Account;
import uit.util.SendMail;

@WebServlet("/AccountServlet_Add_Del")
public class AccountServlet_Add_Del extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AccountDAOImpl accDAO = new AccountDAOImpl();

	public AccountServlet_Add_Del() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String ID_Account = request.getParameter("ID_Account");
		String url = "";
		try {
			switch (action) {
			case "Delete":
				accDAO.deleteAccount(ID_Account);
				url = "/Admin/account_manager.jsp";
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
		String url = "";
		String ID_Account = request.getParameter("ID_Account");
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		String Email = request.getParameter("Email");
		String Fullname = request.getParameter("Fullname");
		String Address = request.getParameter("Address");
		String Phone = request.getParameter("Phone");
		int Access = Integer.parseInt(request.getParameter("Access"));
		int Status = Integer.parseInt(request.getParameter("Status"));

		String username_error = "", password_error = "", email_error = "", fullname_error = "", address_error = "",
				phone_error = "", access_error = "", status_error = "";

		// Validate Username
		if (Username.equals("")) {
			username_error = "Vui lòng nhập Tài Khoản của bạn !";
		} else {
			if (accDAO.checkAccount(Username) == true) {
				username_error = "Tài khoản này đã được đăng ký, vui lòng chọn tài khoản khác !";
			}
		}
		if (username_error.length() > 0) {
			request.setAttribute("username_error", username_error);
		}
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
		} else {
			if (accDAO.checkEmail(Email) == true) {
				email_error = "Email này đã được đăng ký, vui lòng chọn Email khác !";
			}
		}
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

		request.setAttribute("Username", Username);
		request.setAttribute("Password", Password);
		request.setAttribute("Email", Email);
		request.setAttribute("Fullname", Fullname);
		request.setAttribute("Address", Address);
		request.setAttribute("Phone", Phone);
		request.setAttribute("Access", Access);
		request.setAttribute("Status", Status);
		try {
			switch (action) {
			case "Insert":
				if (username_error.length() == 0 && password_error.length() == 0 && email_error.length() == 0
						&& fullname_error.length() == 0 && address_error.length() == 0 && phone_error.length() == 0
						&& access_error.length() == 0 && status_error.length() == 0) {
					Date id = new Date();
					String mtk = "KH" + id.getTime();
					Account acc = new Account(mtk, Username, Password, Email, Fullname, Address, Phone, Access, Status);
					accDAO.insertAccount(acc);
					url = "/Admin/account_manager.jsp";
//					SendMail.sendMail(acc.getEmail(), "HTT Mobile",
//							"Xin Chào, " + acc.getEmail() + "\nBan da dang ky thanh cong tai khoan cua minh."
//									+ "\nUsername: " + acc.getUsername() + "\nPassword: " + acc.getPassword());
//					gửi mail
					break;
				} else {
					url = "/Admin/account_insert.jsp";
				}
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
