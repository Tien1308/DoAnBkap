package uit.servlet.admin;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import uit.dao.ProductDAOImpl;
import uit.model.Category;
import uit.model.Product;

@WebServlet("/ProductUpdate")
@MultipartConfig
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductDAOImpl productDAO = new ProductDAOImpl();

	public ProductUpdate() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String ID_Product = request.getParameter("ID_Product");
		String url="";
		if (action.equals("Delete")) {
			productDAO.delete(ID_Product);
			url = "/Admin/qlysanpham.jsp";
			response.sendRedirect(request.getContextPath() + url);
			return;
		}
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		String url = "";
		
		String ID_Product = request.getParameter("ID_Product");
		String Name = request.getParameter("Name");
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		String Describe = request.getParameter("Describe");
		int Price = Integer.parseInt(request.getParameter("Price"));
		Category category = new Category(request.getParameter("Category"),null,null);
		
		String name_error="";

		// Validate Password
		if (Name.equals("")) {
			name_error = "Vui lòng nhập tên sản phẩm !";
		}
		
		request.setAttribute("Name", Name);
		
		
		try {
			switch (action) {
				case "Update":
					if (name_error.length()==0) {
						Product product = new Product();
						product.setID_Product(ID_Product);
						product.setName_Product(Name);
						product.setDescribe(Describe);
						product.setPrice(Price);
						product.setQuantity(Quantity);
						Part filePart= request.getPart("image");
						String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
						String imageName= "images/sanpham/"+fileName;
						if (!fileName.equals("")) {
							product.setImage(imageName);
						}
						else {
							product.setImage("images/sanpham/ip_6_1.jpg");
						}
						product.setDanh_Muc(category);
						productDAO.update(product);
						url = "/Admin/qlysanpham.jsp";
						break;
					} else {
						url = "/Admin/zsanpham.jsp";
					}
				case "Insert":
					Date id = new Date();
					String ID =id.getSeconds()+"00";
					Product product = new Product();
					product.setID_Product(ID);
					product.setName_Product(Name);
					product.setDescribe(Describe);
					product.setPrice(Price);
					product.setQuantity(Quantity);
					Part filePart= request.getPart("image");
					String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
					String imageName= "images/sanpham/"+fileName;
					product.setImage(imageName);
					product.setDanh_Muc(category);
					productDAO.insert(product);
					url = "/Admin/qlysanpham.jsp";
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
