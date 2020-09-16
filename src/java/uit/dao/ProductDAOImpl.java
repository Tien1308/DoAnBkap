package uit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import uit.connection.DBConnection;
import uit.model.Category;
import uit.model.Product;

public class ProductDAOImpl implements ProductDAO {

	// Lay danh sach san pham dua theo ma danh muc
	@Override
	public ArrayList<Product> getListProductByCategory(String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE ID_Category='" + ID_Category + "'";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public ArrayList<Product> getListProductByName(String Name) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE Name_Product like '%" + Name + "%'";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}

	// Hien thi thong tin chi tiet san pham
	@Override
	public Product getDetailProduct(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE ID_Product='" + ID_Product + "'";
		Product sanPham = new Product();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setID_Product(rs.getString("ID_Product"));
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
			}
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
			ex.printStackTrace();
		}
		return sanPham;
	}

	// Lay danh sach san pham theo List
	@Override
	public ArrayList<Product> getList() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<Product> getListByPage(ArrayList<Product> arr, int start, int end) {
		ArrayList<Product> list = new ArrayList<>();
		for (int i = start; i < end; i++) {
			list.add(arr.get(i));
		}
		return list;
	}

	@Override
	public Product getProduct(String ID_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product WHERE ID_Product =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Product);
			ResultSet rs = ps.executeQuery();
			Product pr = new Product();
			while (rs.next()) {
				pr.setDescribe(rs.getString("Describe"));
				pr.setID_Product(rs.getString("ID_Product"));
				pr.setImage(rs.getString("Image"));
				pr.setPrice(rs.getInt("Price"));
				pr.setQuantity(rs.getInt("Quantity"));
				pr.setName_Product(rs.getString("Name_Product"));
			}
			return pr;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void update(Product product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Product SET Name_Product=?, `Describe`=?, Price=?, Quantity =?, Image=?,ID_Category=?  WHERE ID_Product=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, product.getName_Product());
			ps.setString(2, product.getDescribe());
			ps.setInt(3, product.getPrice());
			ps.setInt(4, product.getQuantity());
			ps.setString(5, product.getImage());
			ps.setString(6, product.getDanh_Muc().getID_Category());
			ps.setString(7, product.getID_Product());
			
			ps.executeUpdate();
			ketNoi.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void insert(Product product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Product VALUES (?,?,?,?,?,?,?,0)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, product.getID_Product());
			ps.setString(2, product.getDanh_Muc().getID_Category());
			ps.setString(3, product.getName_Product());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getQuantity());
			ps.setString(6, product.getDescribe());
			ps.setInt(7, product.getPrice());
			
			
			
			ps.executeUpdate();
			ketNoi.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void delete(String iD_Product) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE FROM Product WHERE ID_Product = ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, iD_Product);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Product> getListRecommendProduct() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Product ORDER BY RAND() LIMIT 4;";
		ArrayList<Product> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product sanPham = new Product();
				sanPham.setID_Product(rs.getString("ID_Product"));
				Category danhMuc = new Category(rs.getString("ID_Category"), "", "");
				sanPham.setDanh_Muc(danhMuc);
				sanPham.setName_Product(rs.getString("Name_Product"));
				sanPham.setImage(rs.getString("Image"));
				sanPham.setQuantity(rs.getInt("Quantity"));
				sanPham.setDescribe(rs.getString("Describe"));
				sanPham.setPrice(rs.getInt("Price"));
				sanPham.setSale(rs.getInt("Sale"));
				arr.add(sanPham);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
}
