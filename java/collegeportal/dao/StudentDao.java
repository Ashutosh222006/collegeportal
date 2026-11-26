package collegeportal.dao;

import java.sql.*;
import collegeportal.beans.Feedback;
import collegeportal.beans.Student;
import collegeportal.database.DBConnection;

public class StudentDao {
    //**********************method for view profile**************************
	
	public Student viewProfile(String studentEmail)
	{
		Student s=null;
		Connection con=DBConnection.createConneaction();
		String selectQuery="select * from create_account where email=?";
		PreparedStatement ps=null;
		ResultSet rs=null; //brain
		
		try
		{
			ps=con.prepareStatement(selectQuery);
			ps.setString(1, studentEmail);
			System.out.println("generated query "+ps);
			rs=ps.executeQuery();
			rs.next(); //place the cursor on that row because that email exists
			
			//email, password, name, course, phone
			String studentName=rs.getString("name");
			String course=rs.getString("course"); //table column name
			String phone=rs.getString("phone");
			String password=rs.getString("password");
			
			//create object of student bean class
			
			s=new Student();
			s.setCourse(course);
			s.setName(studentName);
			s.setPhone(phone);
			s.setEmail(studentEmail);
			s.setPassword(password);
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		finally
		{
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}//finally close
		return s; //student class -> mapped with student table row
	
		}//method closed for view profile
	

	//-----------------------method for student login------------------------
	
	public boolean studentLogin(String em,String pwd)
	{
		boolean status=false;
		Connection con = DBConnection.createConnection();

		String selectQuery ="select * from create_account where email=? and password=?";
				
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement(selectQuery);
			ps.setString(1, em); //coming from jsp login form
			ps.setString(2, pwd);
			
			System.out.println("generated query"+ps);
			rs=ps.executeQuery();
			
			
			if(rs.next()==true) //check for email and password availability
			{
				status=true;
				/*return status;*/
			}
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		finally
		{
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(con!=null)
					con.close();
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
		return status; //false -> email and password does not match

	} 
	//-------------method ends for login------------------
	
	
	
	
	
	
	
	
	//-----------------method for adding feedback-------------------------
	public int addfeedback(Feedback f) {
		int rowStatus = 0;

		String name = f.getName();
		String email = f.getEmail();
		String remark = f.getRemark();
		int rating = f.getRating();

		System.out.println(name + email + remark + rating);

		// step 2
		Connection con = DBConnection.createConnection();
		
		// step 4
		PreparedStatement ps = null;
		boolean  emailStatus=checkEmail(email);
		
		//-------------------------------------------------------------------------------
		if(emailStatus==false) //email not present in the table 
		{
		
		// step 3
	    String insertQuery = "insert into feedback (name,email,remark,rating,date)values(?,?,?,?,?)";
				
		//step 2		
		java.util.Date d = new java.util.Date();
		java.sql.Date sd = new java.sql.Date(d.getTime());

		

		
		try {
			ps = con.prepareStatement(insertQuery);

			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, remark);
			ps.setInt(4, rating);

			ps.setDate(5, sd);

			System.out.println("generated" + ps);

			// step 5
			rowStatus = ps.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		}

		// step 6
		finally 
		{
			try
			{
				if (ps != null)
					ps.close();
				//if (con != null)
				//	con.close();
			} 
			catch (SQLException se)
			{
				se.printStackTrace();
			}
		}
	}//if close (for email check )
		
		else
		{
			//***********************code for feedback updation******************************
			
			String updateFeedback="update feedback set rating=?,remark=?,date=? where email=?";
			System.out.println( new java.util.Date().getTime());
			//step 2		
			java.sql.Date sd = new java.sql.Date( new java.util.Date().getTime());

			try
			{
				ps=con.prepareStatement(updateFeedback);
				ps.setInt(1, rating);
				ps.setString( 2,f.getRemark());
				ps.setDate(3, sd);
				ps.setString(4,f.getEmail());
				
				System.out.println("generated update query "+ps);
				
				rowStatus=ps.executeUpdate();
			}
			catch (SQLException se) 
			{
				se.printStackTrace();
			}

			// step 6
			finally
			{
				try 
				{
					if (ps != null)
						ps.close();
					if (con != null)
						con.close();
				} 
				catch (SQLException se) 
				{
					se.printStackTrace();
				}
			}
		}		
		return rowStatus;

	}

	//************************method for email checking in feedback table**************************
	public boolean checkEmail(String email)
	{
		Connection con=DBConnection.createConneaction();
		String searchQuery="select email from feedback where email=?";
		
		PreparedStatement ps=null;
		ResultSet rs= null;
		
		try
		{
			ps=con.prepareStatement(searchQuery);
			ps.setString(1,email);
			
			rs=ps.executeQuery();
			
			if(rs.next()==true)
				return true;
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		finally
		{
			try 
			{
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}

		return false;
	}

//***************************Student Edit Profile*************************
	public int editProfile(String name, String phone, String email) 
	{
		int updateStatus=0;
		Connection con=DBConnection.createConneaction();
		String updateQuery ="update create_account set name=?,phone=? where email=?"; 
		PreparedStatement ps=null;
		try
		{
			ps=con.prepareStatement(updateQuery);
			ps.setString(1, name);
			ps.setString(2, phone);
			ps.setString(3, email);
			
			System.out.println("generated query "+ps);
			updateStatus=ps.executeUpdate();
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		finally 
		{
			try 
			{
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} 
			catch (SQLException se) 
			{
				se.printStackTrace();
			}
		}//finally close
		return updateStatus;
	} //method ends 

}
