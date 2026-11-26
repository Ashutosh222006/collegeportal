package collegeportal.dao;

import java.sql.*;
import java.util.*;
import collegeportal.beans.*;
import collegeportal.database.DBConnection;

public class AdminDao {

	// ---------------method got all contacts--------------
	public ArrayList<Contact> allContacts() {
		// object creation of arraylist (basket)that will hold the object of contact
		// beans
		ArrayList<Contact> contactList = new ArrayList<Contact>();

		Contact c = null;
		Connection con = DBConnection.createConnection();
		String selectQuery = "select * from contact order by date desc";
		PreparedStatement ps = null;

		ResultSet rs = null; // rs will hold the address of the dataset returned by select query

		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			// only for select
			// rs will hold the address of the dataset returned by select query

			while (rs.next()) {
				String userName = rs.getString("name"); // name is column name of table
				String userEmail = rs.getString("email");
				String userPhone = rs.getString("phone");
				String userQuestion = rs.getString("question");

				System.out.println(userName + userEmail + userPhone + userQuestion);

				// object creation of contact bean with filling the value that is coming from
				// table row
				c = new Contact(userName, userEmail, userPhone, userQuestion);
				int i = rs.getInt("id");
				c.setId(i);

				// add this object into a collection(data structure)Arraylist -> growable array
				// hashmap,treemap,hashset,treeset,arraylist-> collection framework

				contactList.add(c); // adding object of contact bean into basket
			}
			// it is used to check whatever
			// there is data , if data is present it will put the cursor on the row
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			}

			catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return contactList;
	} // method close

	// --------------------method ends---------------------

	// ------------------method for login------------------
	public boolean login(String email, String password) {
		if (email.equalsIgnoreCase("admin@gmail.com") && password.equals("1234"))
			return true;
		else
			return false;
	}

	// ------------------------FEEDBACKS----------------------------

	// ---------------method got all feedback--------------
	public ArrayList<Feedback> allFeedback() {
		// object creation of arraylist (basket)that will hold the object of contact
		// beans
		ArrayList<Feedback> FeedbackList = new ArrayList<Feedback>();

		Feedback c = null;
		Connection con = DBConnection.createConnection();
		String selectQuery = "select * from feedback order by date desc";
		PreparedStatement ps = null;

		ResultSet rs = null; // rs will hold the address of the dataset returned by select query

		try {
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			// only for select
			// rs will hold the address of the dataset returned by select query

			while (rs.next()) {
				String userName = rs.getString("name"); // name is column name of table
				String userEmail = rs.getString("email");
				String userRemark = rs.getString("remark");
				int userRating = rs.getInt("rating");

				System.out.println(userName + userEmail + userRemark + userRating);

				// object creation of contact bean with filling the value that is coming from
				// table row
				c = new Feedback(userName, userEmail, userRemark, userRating);
				int i = rs.getInt("id");
				c.setId(i);

				// add this object into a collection(data structure)Arraylist -> growable array
				// hashmap,treemap,hashset,treeset,arraylist-> collection framework

				FeedbackList.add(c); // adding object of contact bean into basket
			}
			// it is used to check whatever
			// there is data , if data is present it will put the cursor on the row
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			}

			catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return FeedbackList;
	} // method close

	public int addStudent(Student s) {

		int rowStatus = 0;

		String email = s.getEmail();
		String password = s.getPassword();
		String name = s.getName();
		String course = s.getCourse();
		String phone = s.getPhone();

		System.out.println(email + password + name + course + phone);

		Connection con = DBConnection.createConnection();

		String insertQuery ="insert into create_account(email,password,name,course,phone) values(?,?,?,?,?)";
		PreparedStatement ps = null;

		try {

			ps = con.prepareStatement(insertQuery);

			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4, course);
			ps.setString(5, phone);

			System.out.println("Generated " + ps);

			rowStatus = ps.executeUpdate();

		}

		catch (SQLException se) {
			se.printStackTrace();
		}

		finally {

			try {

				if (ps != null)
					ps.close();

				if (con != null)
					con.close();

			}

			catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return rowStatus;
	}

	
	//------------------------------------Method for adding staff details------------------------------------
	public int addStaff(Staff s) {
		
		Connection con=DBConnection.createConneaction();
		String insertQuery="insert into staff(name, email, phone, designation, profile_pic) values(?,?,?,?,?)";
		PreparedStatement ps=null;
		
		int rowStatus=0;
		try {

			ps = con.prepareStatement(insertQuery);

			ps.setString(1, s.getName());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getPhone());
			ps.setString(4, s.getDesignation());
			ps.setString(5, s.getProfile_pic());

			System.out.println("Generated query" + ps);

			rowStatus = ps.executeUpdate();
		}
		catch (SQLException se) {
			se.printStackTrace();
		}

		finally {

			try {

				if (ps != null)
					ps.close();

				if (con != null)
					con.close();

			}

			catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return rowStatus;
	}

	
	//+++++++++++++++++++++++++++++ Method for deleting contacts +++++++++++++++++++++++++++++++
	
	public int deleteContact(String[] idArray) {
		int status=0;
		Connection con=DBConnection.createConneaction();
		PreparedStatement  ps=null;
		String deleteQuery="delete from contact where id=?";
		
		//batch processing
		try
		{
			//con.setAutoCommit(false);
			ps=con.prepareStatement(deleteQuery);
			
			for(int i=0;i<idArray.length;i++)
			{
				int id=Integer.parseInt(idArray[i]);
				ps.setInt(1, id);
				
				ps.addBatch();//keep inside a buffer
				System.out.println("generated queries "+ps);
			}
			
			//batch execution
			int[] rowStatus=ps.executeBatch();
			int flag=0;
				for(int data:rowStatus)
				{
					//System.out.println(data);
					if(data<0)
					{
						flag=1;
						break;
					}
				}//to check for successfull batch exexution
				if(flag==0)
				{
					status=1;
					con.setAutoCommit(true);
				}
		}
		
		
		catch (SQLException se) {
			se.printStackTrace();
		}

		finally {

			try {

				if (ps != null)
					ps.close();

				if (con != null)
					con.close();

			}

			catch (SQLException se) {
				se.printStackTrace();
			}
		}


		return 2;
	}

}//-----------------------methods end---------------------------------------
