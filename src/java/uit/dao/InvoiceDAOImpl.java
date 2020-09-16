package uit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import uit.connection.DBConnection;
import uit.model.Account;
import uit.model.Invoice;

public class InvoiceDAOImpl implements InvoiceDAO {

	@Override
	public void insertInvoice(Invoice hd) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO Invoice VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, hd.getID_Invoice());
			ps.setString(2, hd.getTai_Khoan().getID_Account());
			ps.setString(3, hd.getShipping_Address());
			ps.setString(4, hd.getPayment_Methods());
			ps.setTimestamp(5, hd.getPurchase_Date());
			ps.setInt(6, hd.getStatus_Order());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<Invoice> getListInvoice() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM Invoice";
		ArrayList<Invoice> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Invoice bill = new Invoice();
				Account acc = new Account(rs.getString("ID_Account"), "", "", "","","","", 0, 0);
				bill.setID_Invoice(rs.getString("ID_Invoice"));
				bill.setTai_Khoan(acc);
				bill.setShipping_Address(rs.getString("Shipping_Address"));
				bill.setPayment_Methods(rs.getString("Payment_Methods"));
				bill.setPurchase_Date(rs.getTimestamp("Purchase_Date"));
				bill.setStatus_Order(rs.getInt("Status_Order"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateInvoice(Invoice hd) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE Invoice SET Shipping_Address=?,Payment_Methods=?, Status_Order=? WHERE ID_Invoice=? ";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, hd.getShipping_Address());
			ps.setString(2, hd.getPayment_Methods());
			ps.setInt(3, hd.getStatus_Order());
			ps.setString(4, hd.getID_Invoice());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteInvoice(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE From Invoice WHERE ID_Invoice=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Invoice);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Invoice getInvoiceByID(String ID_Invoice) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "Select * From Invoice Where ID_Invoice=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setString(1, ID_Invoice);
			ResultSet rs = ps.executeQuery();
			Invoice hd = new Invoice();
			if (rs.next()) {
				Account acc = new Account(rs.getString("Account"), sql, sql, sql, sql, sql, sql, 0, 0);
				hd.setID_Invoice(rs.getString("ID_Invoice"));
				hd.setTai_Khoan(acc);
				hd.setShipping_Address(rs.getString("Shipping_Address"));
				hd.setPayment_Methods(rs.getString("Payment_Methods"));
				hd.setPurchase_Date(rs.getTimestamp("Payment_Methods"));
				hd.setStatus_Order(rs.getInt("Status_Order"));
			}
			return hd;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

}
