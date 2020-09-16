package uit.model;

public class Account {
	private String ID_Account;
	private String Username;
	private String Password;
	private String Email;
	private String Full_Name;
	private String Address;
	private String SDT;
	private int Access;
	private int Status;

	public Account() {
		super();
	}

	public Account(String iD_Account, String username, String password, String email, String full_Name, String address,
			String sDT, int access, int status) {
		super();
		ID_Account = iD_Account;
		Username = username;
		Password = password;
		Email = email;
		Full_Name = full_Name;
		Address = address;
		SDT = sDT;
		Access = access;
		Status = status;
	}

	public String getID_Account() {
		return ID_Account;
	}

	public void setID_Account(String iD_Account) {
		ID_Account = iD_Account;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getFull_Name() {
		return Full_Name;
	}

	public void setFull_Name(String full_Name) {
		Full_Name = full_Name;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}

	public int getAccess() {
		return Access;
	}

	public void setAccess(int access) {
		Access = access;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

}