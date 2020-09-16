package uit.dao;

import java.util.ArrayList;

import uit.model.InvoiceDetail;

public interface InvoiceDetailDAO {
	
	// Them chi tiet hoa don
	public void insertInvoiceDetail(InvoiceDetail hdct);
	
	// Cap nhat du lieu
	public void updateInvoiceDetail(InvoiceDetail hdct);
	
	// Xoa Du Lieu
	public void deleteInvoiceDetail(int ID_InvoiceDetail);
	
	// Lay danh sach hoa don chi tiet
	public ArrayList<InvoiceDetail> getListInvoiceDetail();
}
