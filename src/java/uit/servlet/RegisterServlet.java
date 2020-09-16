package uit.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uit.dao.AccountDAOImpl;
import uit.model.Account;
import uit.util.SendMail;

public class RegisterServlet extends HttpServlet {
	private AccountDAOImpl taiKhoanDAO = new AccountDAOImpl();
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("ten_dang_nhap");
		String password1 = request.getParameter("mat_khau1");
		String password2 = request.getParameter("mat_khau2");
		String email = request.getParameter("email");
		String fullname = request.getParameter("ho_va_ten");
		String address = request.getParameter("dia_chi");
		String phone = request.getParameter("so_dien_thoai");

		String username_error = "";
		String password_error = "";
		String password1_error = "";
		String password2_error = "";
		String email_error = "";
		String fullname_error = "";
		String address_error = "";
		String phone_error = "";

		// Validate Tai Khoan
		if (username.equals("")) {
			username_error = "Vui lòng nhập Tài Khoản của bạn !";
		} else {
			if (taiKhoanDAO.checkAccount(username) == true) {
				username_error = "Tài khoản này đã được đăng ký, vui lòng ch�?n tài khoản khác !";
			}
		}
		if (username_error.length() > 0) {
			request.setAttribute("username_error", username_error);
		}
		// Validate Mat Khau
		if (password1.equals("")) {
			password1_error = "Vui lòng nhập Mật Khẩu của bạn !";
		}
		if (password2.equals("")) {
			password2_error = "Vui lòng nhập Mật Khẩu của bạn !";
		}
		if (password1_error.length() > 0) {
			request.setAttribute("password1_error", password1_error);
		}
		if (password2_error.length() > 0) {
			request.setAttribute("password2_error", password2_error);
		}

		if (password1.toUpperCase().length() != password2.toUpperCase().length()) {
			password_error = "Mật khẩu không trùng khớp !";
		}
		if (password_error.length() > 0) {
			request.setAttribute("password_error", password_error);
		}

		// Validate Email
		if (email.equals("")) {
			email_error = "Vui lòng nhập Email của bạn !";
		} else {
			if (taiKhoanDAO.checkEmail(email) == true) {
				email_error = "Email này đã được đăng ký, vui lòng ch�?n Email khác !";
			}
		}
		if (email_error.length() > 0) {
			request.setAttribute("email_error", email_error);
		}

		// Validate Ho Va Ten
		if (fullname.equals("")) {
			fullname_error = "Vui lòng nhập H�? Tên của bạn !";
		}
		if (fullname_error.length() > 0) {
			request.setAttribute("fullname_error", fullname_error);
		}

		// Validate So Dien Thoai
		if (phone.equals("")) {
			phone_error = "Vui lòng nhập Số �?iện Thoại của bạn !";
		}
		if (phone_error.length() > 0) {
			request.setAttribute("phone_error", phone_error);
		}

		// Validate Dia Chi
		if (address.equals("")) {
			address_error = "Vui lòng nhập �?ịa Chỉ của bạn !";
		}
		if (address_error.length() > 0) {
			request.setAttribute("address_error", address_error);
		}

		request.setAttribute("username", username);
		request.setAttribute("password1", password1);
		request.setAttribute("password2", password2);
		request.setAttribute("email", email);
		request.setAttribute("fullname", fullname);
		request.setAttribute("phone", phone);
		request.setAttribute("address", address);

		String url = "/account.jsp";
		try {
			if (username_error.length() == 0 && password_error.length() == 0 && email_error.length() == 0
					&& fullname_error.length() == 0 && phone_error.length() == 0 && address_error.length() == 0) {
				Date id = new Date();
				String mtk = "KH" + id.getTime();
				Account acc = new Account(mtk, username, password1, email, fullname, address, phone, 2, 1);
				taiKhoanDAO.insertAccount(acc);
				url = "/account.jsp";
				SendMail.sendMail(acc.getEmail(), "HTT Mobile",
						"Xin Chào, " + acc.getEmail() + "\nBan da dang ky thanh cong tai khoan cua minh."
								+ "\nUsername: " + acc.getUsername() + "\nPassword: " + acc.getPassword());
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				request.setAttribute("message", "�?ăng ký thành công !");
			} else {
				url = "/account.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
