package collegeportal.dao;

import java.sql.*;
import java.util.ArrayList;

import collegeportal.beans.Contact;
import collegeportal.beans.Feedback;
import collegeportal.beans.Staff;
import collegeportal.database.DBConnection;

public class CommonDao {
	public int addContact(Contact c) {
		int rowStatus = 0;

		String name = c.getName();
		String phone = c.getPhone();
		String email = c.getEmail();
		String question = c.getQuestion();

		System.out.println(name + phone + email + question);

		// step 2
		// establish connection with database
		Connection con = DBConnection.createConneaction(); // has college-db database address

		java.util.Date d = new java.util.Date(); // system date(java)

		java.sql.Date sd = new java.sql.Date(d.getTime()); // sql date

		// step 3
		String insertQuery = " insert into contact ( name, email, phone, question, date) values (?,?,?,?,?)";

		// step 4
		PreparedStatement ps = null; // table to database
		try {
			ps = con.prepareStatement(insertQuery);

			// it passes the query to rdbms and db compiler -> compile the query
			// compiler query gets stored into buffer
			// and the address of that buffer is assigned to ps

			// data insertion task is carried by ps
			ps.setString(1, name); // name is the value fetched from bean class
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, question);

			ps.setDate(5, sd);

			System.out.println("generated" + ps);

			// actual final data insertion
			// fetch the result
			// step 5
			rowStatus = ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		}

		// step 6
		finally {
			try {
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return rowStatus;
	}
	
	//---------------------View All Staff-------------------------------------------
	
		public ArrayList<Staff>allStaff(){
			
			Staff s = null;
			ArrayList<Staff>staffList =  new ArrayList<>();
			
			Connection con = DBConnection.createConnection();
			
			String selectQuery = "select * from staff";
			
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				
				ps = con.prepareStatement(selectQuery);
				rs = ps.executeQuery();
				
				while(rs.next())
				{
					String name = rs.getString("name");
					String email = rs.getString("email");
					String desig = rs.getString("designation");
					String profile_pic = rs.getString("profile_pic");
					
					String phone=rs.getString("phone");
					
					s = new Staff();
					
					s.setDesignation(desig);
					s.setEmail(email);
					s.setName(name);
					s.setProfile_pic(profile_pic);
					s.setPhone(phone);
					staffList.add(s);
				}
			} // try close 
			
			catch(SQLException se)
			{
				se.printStackTrace();
			}
			
			finally {
				try {
					if (ps != null)
						ps.close();
					if (con != null)
						con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			return staffList;
			
		}
}


