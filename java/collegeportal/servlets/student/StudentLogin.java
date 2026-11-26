package collegeportal.servlets.student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import collegeportal.dao.StudentDao;
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public StudentLogin() 
	{
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
		
		//data fetching(received) from front end jsp
		String studentEmail = request.getParameter("email"); 
		String studentPassword= request.getParameter("password");
		
		System.out.println("Email is "+studentEmail);
		System.out.println("Password is "+studentPassword);
		
		StudentDao sd = new StudentDao();
		boolean status = sd.studentLogin(studentEmail, studentPassword);

		if (status == true)
		{
			//-------------------------creating session of a logged in user----------------------------
			
			HttpSession hs=request.getSession(); //create a session if does not exists
			System.out.println("Session Id is "+hs.getId());
			
			//----------------------setting values in the session---------------------------
			hs.setAttribute("sessionEmail", studentEmail);
			hs.setAttribute("role","student");
			
			
			response.sendRedirect("/collegeportal/student/student_home.jsp");
		}
		else
		{
			request.setAttribute("errorMessage","Invalid Credentials");
			RequestDispatcher rd=request.getRequestDispatcher("/student/student_login.jsp");
			rd.forward(request, response);
		}
	}

}
