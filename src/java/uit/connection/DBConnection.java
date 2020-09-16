package uit.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class DBConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/dienthoai?zeroDateTimeBehavior=convertToNull";
			
			con = DriverManager.getConnection(url, "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void main(String[] arg) {
		System.out.println(getConnection());
	}
}
