package uit.model;

public class Product implements Comparable<Product> {
	private String ID_Product;
	private Category Danh_Muc;
	private String Name_Product;
	private String Image;
	private int Quantity;
	private String Describe;
	private int Price;
	private int Sale;

	public Product() {
		super();

	}

	public Product(String iD_Product, Category danh_Muc, String name_Product, String image, int quantity,
			String describe, int price, int sale) {
		super();
		this.ID_Product = iD_Product;
		this.Danh_Muc = danh_Muc;
		this.Name_Product = name_Product;
		this.Image = image;
		this.Quantity = quantity;
		this.Describe = describe;
		this.Price = price;
		this.Sale = sale;
	}

	public String getID_Product() {
		return ID_Product;
	}

	public void setID_Product(String iD_Product) {
		this.ID_Product = iD_Product;
	}

	public Category getDanh_Muc() {
		return Danh_Muc;
	}

	public void setDanh_Muc(Category danh_Muc) {
		this.Danh_Muc = danh_Muc;
	}

	public String getName_Product() {
		return Name_Product;
	}

	public void setName_Product(String name_Product) {
		this.Name_Product = name_Product;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		this.Image = image;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int quantity) {
		this.Quantity = quantity;
	}

	public String getDescribe() {
		return Describe;
	}

	public void setDescribe(String describe) {
		this.Describe = describe;
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

	@Override
	public int compareTo(Product pr) {
		return Integer.parseInt(this.ID_Product) - Integer.parseInt(pr.ID_Product);
	}

}
