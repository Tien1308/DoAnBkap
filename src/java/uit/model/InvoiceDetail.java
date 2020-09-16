package uit.model;


public class InvoiceDetail {
	private int ID_InvoiceDetail;
	private Invoice Hoa_Don;
	private Product San_Pham;
	private int Quantity;
	private int Price;
	private int Sale;

	public InvoiceDetail() {
		super();

	}

	public InvoiceDetail(int iD_InvoiceDetail, Invoice hoa_Don, Product san_Pham, int quantity, int price, int sale) {
		super();
		this.ID_InvoiceDetail = iD_InvoiceDetail;
		this.Hoa_Don = hoa_Don;
		this.San_Pham = san_Pham;
		this.Quantity = quantity;
		this.Price = price;
		this.Sale = sale;
	}
	public int getID_InvoiceDetail() {
		return ID_InvoiceDetail;
	}

	public void setID_InvoiceDetail(int iD_InvoiceDetail) {
		this.ID_InvoiceDetail = iD_InvoiceDetail;
	}

	public Invoice getHoa_Don() {
		return Hoa_Don;
	}

	public void setHoa_Don(Invoice hoa_Don) {
		this.Hoa_Don = hoa_Don;
	}

	public Product getSan_Pham() {
		return San_Pham;
	}

	public void setSan_Pham(Product san_Pham) {
		this.San_Pham = san_Pham;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		this.Quantity = quantity;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		this.Price = price;
	}

	public int getSale() {
		return Sale;
	}

	public void setSale(int sale) {
		this.Sale = sale;
	}

}
