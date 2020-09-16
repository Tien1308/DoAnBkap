package uit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import uit.connection.DBConnection;
import uit.model.Account;

public class AccountDAOImpl implements AccountDAO {

	@Override
	public boolean checkAccount(String Username) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT Username FROM Account WHERE Username ='" + Username + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean checkEmail(String Email) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT Username FROM Account WHERE Email ='" + Email + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void insertAccount(Account acc) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Account VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, acc.getID_Account());
			ps.setString(2, acc.getUsername());
			ps.setString(3, acc.getPassword());
			ps.setString(4, acc.getEmail());
			ps.setString(5, acc.getFull_Name());
			ps.setString(6, acc.getAddress());
			ps.setString(7, acc.getSDT());
			ps.setInt(8, acc.getAccess());
			ps.setInt(9, acc.getStatus());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateAccount(Account acc) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Account SET Password=?, Email=?, Full_Name=?, Address=?, SDT=?, Access=?, Status=? WHERE ID_Account=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, acc.getPassword());
			ps.setString(2, acc.getEmail());
			ps.setString(3, acc.getFull_Name());
			ps.setString(4, acc.getAddress());
			ps.setString(5, acc.getSDT());
			ps.setInt(6, acc.getAccess());
			ps.setInt(7, acc.getStatus());
			ps.setString(8, acc.getID_Account());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteAccount(String ID_Account) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE FROM Account WHERE ID_Account = ?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Account);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkLogin(String Username, String Password, int Access, int Status) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Account WHERE username ='" + Username + "'and password='" + Password
				+ "' and Access='" + 2 + "' and status ='" + 1 + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean checkLogin1(String Username, String Password, int Access, int Status) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Account WHERE username ='" + Username + "'and password='" + Password
				+ "' and Access='" + 1 + "' and status ='" + 1 + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Account getAccount(String Username) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Account WHERE username ='" + Username + "'";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account acc = new Account();
				acc.setID_Account(rs.getString("ID_Account"));
				acc.setEmail(rs.getString("Email"));
				acc.setSDT(rs.getString("SDT"));
				acc.setAddress(rs.getString("Address"));
				return acc;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Account getUser(String ID_Account) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Account WHERE ID_Account =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Account);
			ResultSet rs = ps.executeQuery();
			Account acc = new Account();
			while (rs.next()) {
				acc.setUsername(rs.getString("Username"));
				acc.setSDT(rs.getString("SDT"));
			}
			return acc;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Account getEmail(String Email) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Account WHERE Email =?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, Email);
			ResultSet rs = ps.executeQuery();
			Account acc = new Account();
			while (rs.next()) {
				acc.setEmail(rs.getString("Email"));
			}
			return acc;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<Account> getAll() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Account";
		ArrayList<Account> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account acc = new Account();
				acc.setID_Account(rs.getString("ID_Account"));
				acc.setUsername(rs.getString("Username"));
				acc.setPassword(rs.getString("Password"));
				acc.setEmail(rs.getString("Email"));
				acc.setFull_Name(rs.getString("Full_Name"));
				acc.setAddress(rs.getString("Address"));
				acc.setSDT(rs.getString("SDT"));
				acc.setAccess(rs.getInt("Access"));
				acc.setStatus(rs.getInt("Status"));
				list.add(acc);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
