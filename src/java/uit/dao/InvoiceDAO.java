package uit.dao;

import java.util.ArrayList;

import uit.model.Invoice;

public interface InvoiceDAO {

	// Tao hoa don moi
	public void insertInvoice(Invoice hd);

	// Cap nhat du lieu
	public void updateInvoice(Invoice hd);

	// Lay danh sach hoa don
	public ArrayList<Invoice> getListInvoice();

	// Xoa Invoice Theo Ma
	public void deleteInvoice(String id);

	// Lay Hoa Don theo ID
	public Invoice getInvoiceByID(String ID_Invoice);
}
