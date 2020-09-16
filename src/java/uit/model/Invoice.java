package uit.model;

import java.sql.Timestamp;

public class Invoice {
	private String ID_Invoice;
	private Account Tai_Khoan;
	private String Shipping_Address;
	private String Payment_Methods;
	private Timestamp Purchase_Date;
	private int Status_Order;

	public Invoice() {
		super();

	}

	public Invoice(String iD_Invoice, Account tai_Khoan, String shipping_Address, String payment_Methods,
			Timestamp purchase_Date, int status_Order) {
		super();
		this.ID_Invoice = iD_Invoice;
		this.Tai_Khoan = tai_Khoan;
		this.Shipping_Address = shipping_Address;
		this.Payment_Methods = payment_Methods;
		this.Purchase_Date = purchase_Date;
		this.Status_Order = status_Order;
	}

	public String getID_Invoice() {
		return ID_Invoice;
	}

	public void setID_Invoice(String iD_Invoice) {
		this.ID_Invoice = iD_Invoice;
	}

	public Account getTai_Khoan() {
		return Tai_Khoan;
	}

	public void setTai_Khoan(Account tai_Khoan) {
		this.Tai_Khoan = tai_Khoan;
	}

	public String getShipping_Address() {
		return Shipping_Address;
	}

	public void setShipping_Address(String shipping_Address) {
		this.Shipping_Address = shipping_Address;
	}

	public String getPayment_Methods() {
		return Payment_Methods;
	}

	public void setPayment_Methods(String payment_Methods) {
		this.Payment_Methods = payment_Methods;
	}

	public Timestamp getPurchase_Date() {
		return Purchase_Date;
	}

	public void setPurchase_Date(Timestamp purchase_Date) {
		this.Purchase_Date = purchase_Date;
	}

	public int getStatus_Order() {
		return Status_Order;
	}

	public void setStatus_Order(int status_Order) {
		this.Status_Order = status_Order;
	}

	
	
}
