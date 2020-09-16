package uit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import uit.connection.DBConnection;
import uit.model.Invoice;
import uit.model.InvoiceDetail;
import uit.model.Product;

public class InvoiceDetailDAOImpl implements InvoiceDetailDAO {

	@Override
	public void insertInvoiceDetail(InvoiceDetail hdct) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "INSERT INTO InvoiceDetail VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, hdct.getID_InvoiceDetail());
			ps.setString(2, hdct.getHoa_Don().getID_Invoice());
			ps.setString(3, hdct.getSan_Pham().getID_Product());
			ps.setInt(4, hdct.getQuantity());
			ps.setInt(5, hdct.getPrice());
			ps.setInt(6, hdct.getSale());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<InvoiceDetail> getListInvoiceDetail() {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM InvoiceDetail";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InvoiceDetail bill = new InvoiceDetail();
				Invoice invoice = new Invoice(rs.getString("ID_Invoice"), null, "", "", null, 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0);
				bill.setID_InvoiceDetail(rs.getInt("ID_InvoiceDetail"));
				bill.setHoa_Don(invoice);
				bill.setSan_Pham(product);
				bill.setQuantity(rs.getInt("Quantity"));
				bill.setPrice(rs.getInt("Price"));
				bill.setSale(rs.getInt("Sale"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	
	public ArrayList<InvoiceDetail> getListInvoiceDetailById(String Id) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "SELECT * FROM InvoiceDetail WHERE ID_Invoice='"+Id+"'";
		ArrayList<InvoiceDetail> list = new ArrayList<>();
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				InvoiceDetail bill = new InvoiceDetail();
				Invoice invoice = new Invoice(rs.getString("ID_Invoice"), null, "", "", null, 0);
				Product product = new Product(rs.getString("ID_Product"), null, "", "", 0, "", 0, 0);
				bill.setID_InvoiceDetail(rs.getInt("ID_InvoiceDetail"));
				bill.setHoa_Don(invoice);
				bill.setSan_Pham(product);
				bill.setQuantity(rs.getInt("Quantity"));
				bill.setPrice(rs.getInt("Price"));
				bill.setSale(rs.getInt("Sale"));
				list.add(bill);
			}
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void updateInvoiceDetail(InvoiceDetail hdct) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "UPDATE InvoiceDetail SET Quantity=?, Sale=? WHERE ID_InvoiceDetail=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, hdct.getQuantity());
			ps.setInt(2, hdct.getSale());
			ps.setInt(3, hdct.getID_InvoiceDetail());
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteInvoiceDetail(int ID_InvoiceDetail) {
		Connection ketNoi = DBConnection.getConnection();
		String sql = "DELETE From InvoiceDetail WHERE ID_InvoiceDetail=?";
		try {
			PreparedStatement ps = ketNoi.prepareStatement(sql);
			ps.setInt(1, ID_InvoiceDetail);
			ps.executeUpdate();
			ketNoi.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
