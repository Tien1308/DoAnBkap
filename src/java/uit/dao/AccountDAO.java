package uit.dao;

import java.util.ArrayList;

import uit.model.Account;

public interface AccountDAO {

	// Kiem tra ten tai khoan da ton tai chua
	public boolean checkAccount(String Username);

	// Kiem tra email ton tai chua
	public boolean checkEmail(String Email);

	// Them moi tai khoan
	public void insertAccount(Account acc);

	// Sua tai khoan
	public void updateAccount(Account acc);

	// Xoa tai khoan
	public void deleteAccount(String ID_Account);

	// Kiem tra dang nhap
	public boolean checkLogin(String Username, String Password, int Access, int Status);

	// Kiem tra dang nhap
	public boolean checkLogin1(String Username, String Password, int Access, int Status);

	// Lay tai khoan nguoi dung
	public Account getAccount(String Username);

	// Lay ma nguoi dung
	public Account getUser(String ID_Account);

	// Lay email nguoi dung
	public Account getEmail(String Email);

	// Lay danh sach tai khoan
	public ArrayList<Account> getAll();

}
