package collegeportal.database;

import java.sql.*;
import java.util.ResourceBundle;//to read info from the properties from the file 

public class DBConnection {

	private static Connection con;
	private static ResourceBundle rb;
	public static Connection createConneaction()
	{
		rb=ResourceBundle.getBundle("collegeportal/database/dbinfo");
		//System.out.println(rb);
		//returning the adderess of connected database
		
		String dbUser=rb.getString("db.userId");
		String dbPass=rb.getString("db.userPass");
		String dbUrl=rb.getString("db.url");
		String dbSlogan=rb.getString("db.slogan");
		
		System.out.println("ID = "+dbUser+" PASS = "+dbPass+" URL = "+dbUrl+" SLOGAN = "+dbSlogan);

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			//FACTORY METHOD CREATES THE OBJECT IMPLICITLY
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college_db", "root", "root");
			con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
//SUBPROTOCOL
			//3306 IS A PORT NUMBER OF DATABASE
			//LOCALHOST=NAME OR IP ADDRESS WHERE DB IS INSTALLED
		}

		catch (ClassNotFoundException | SQLException se) {
			se.printStackTrace();
		}

		return con;
	}

	public static Connection createConnection() {

		return createConneaction();

	}

	public static void main(String[] args) {

		Connection con = DBConnection.createConnection();

		System.out.println(con);

	}
}