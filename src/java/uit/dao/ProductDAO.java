package uit.dao;

import java.util.ArrayList;

import uit.model.Product;

public interface ProductDAO {

	// Lay danh sach san pham dua theo ma danh muc
	public ArrayList<Product> getListProductByCategory(String ID_Category);

	// Hien thi thong tin chi tiet san pham
	public Product getDetailProduct(String ID_Product);

	// Lay danh sach san pham theo danh sach
	public ArrayList<Product> getList();

	public ArrayList<Product> getListByPage(ArrayList<Product> arr, int start, int end);
	
	// Lay San Pham Theo Ma
	public Product getProduct(String ID_Product);
}
