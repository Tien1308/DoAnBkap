package uit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import uit.connection.DBConnection;
import uit.model.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public ArrayList<Category> getListParentCategory() {
		Connection ketNoi = DBConnection.getConnection();
		//lấy danh mục
		String sql = "SELECT * FROM Category WHERE Parent_Category='null'";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category();
				danhMuc.setID_Category(rs.getString("ID_Category"));
				danhMuc.setName_Category(rs.getString("Name_Category"));
				danhMuc.setParent_Category(rs.getString("Parent_Category"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}

	@Override
	public ArrayList<Category> getListSubCategory(String ID_Category) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Category ";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category();
				danhMuc.setID_Category(rs.getString("ID_Category"));
				danhMuc.setName_Category(rs.getString("Name_Category"));
				danhMuc.setParent_Category(rs.getString("Parent_Category"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	
	
	public ArrayList<Category> getAll() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Category";
		ArrayList<Category> arr = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category danhMuc = new Category();
				danhMuc.setID_Category(rs.getString("ID_Category"));
				danhMuc.setName_Category(rs.getString("Name_Category"));
				danhMuc.setParent_Category(rs.getString("Parent_Category"));
				arr.add(danhMuc);
			}
			ketNoi.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return arr;
	}
	
	public void update(Category cate) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Category SET Name_Category=? WHERE ID_Category=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, cate.getName_Category());
			ps.setString(2, cate.getID_Category());
			ps.executeUpdate();
			ketNoi.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insert(Category cate) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Category VALUES (?,?,null)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, cate.getID_Category());
			ps.setString(2, cate.getName_Category());
			
			ps.executeUpdate();
			ketNoi.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
