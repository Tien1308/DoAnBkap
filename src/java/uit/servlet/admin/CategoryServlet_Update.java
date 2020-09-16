package uit.servlet.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uit.dao.CategoryDAOImpl;
import uit.model.Category;

@WebServlet("/CategoryServlet_Update")
public class CategoryServlet_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static CategoryDAOImpl cateDAO = new CategoryDAOImpl();

	public CategoryServlet_Update() {
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
		
		String ID_Category = request.getParameter("ID_Category");
		String Name = request.getParameter("Name");
		

		String name_error="";

		// Validate Password
		if (Name.equals("")) {
			name_error = "Vui lòng nhập tên danh mục !";
		}
		
		request.setAttribute("Name", Name);
		
		
		try {
			switch (action) {
				case "Update":
					if (name_error.length()==0) {
						Category cate = new Category(ID_Category, Name, null);
						cateDAO.update(cate);
						url = "/Admin/qlydanhmuc.jsp";
						break;
					} else {
						url = "/Admin/zdanhmuc.jsp";
					}
				case "Insert":
					Date id = new Date();
					String mtk = "SS" + id.getSeconds();
					Category cate = new Category(mtk, Name, null);
					cateDAO.insert(cate);
					url = "/Admin/qlydanhmuc.jsp";
					break;
					
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
//		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//		rd.forward(request, response);
		response.sendRedirect(request.getContextPath() + url);
	}

}
