package uit.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uit.dao.AccountDAOImpl;

public class LoginServlet extends HttpServlet {
	private AccountDAOImpl taiKhoanDAO = new AccountDAOImpl();
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String usernamex = request.getParameter("ten_dang_nhap");
		String passwordx = request.getParameter("mat_khau");
		int access1 = Integer.parseInt(request.getParameter("access"));
		int status1 = Integer.parseInt(request.getParameter("status"));
		String error = "";

		if (usernamex.equals("") || passwordx.equals("")) {
			error = "Vui lòng nhập đầy đủ thông tin !";

		} else if (taiKhoanDAO.checkLogin(usernamex, passwordx, access1, status1) == false) {
			error = "Quy�?n chưa được cấp hoặc Tài Khoản hoặc Mật Khẩu không chính xác !";
		} else if (taiKhoanDAO.checkLogin1(usernamex, passwordx, access1, status1) == false) {
			error = "Quy�?n chưa được cấp hoặc Tài Khoản hoặc Mật Khẩu không chính xác !";
		}
		if (error.length() > 0) {
			request.setAttribute("error", error);
		}

		request.setAttribute("usernamex", usernamex);
		request.setAttribute("passwordx", passwordx);

		String url = "/account.jsp";

		try {
			if (taiKhoanDAO.checkLogin(usernamex, passwordx, access1, status1) == true) {
				url = "/index.jsp";
				HttpSession session = request.getSession();
				session.setAttribute("usernamex", usernamex);
			} else if (taiKhoanDAO.checkLogin1(usernamex, passwordx, access1, status1) == true) {
				url = "/Admin/index.jsp";
				HttpSession session = request.getSession();
				session.setAttribute("usernamex", usernamex);
			} else {
				url = "/account.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("enter").equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("/Website-ban-dien-thoai/account.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
