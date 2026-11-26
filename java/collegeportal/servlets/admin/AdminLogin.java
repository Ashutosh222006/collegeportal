package collegeportal.servlets.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collegeportal.dao.AdminDao;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//data fetching(received) from front end jsp
				String adminEmail = request.getParameter("email"); 
				String adminPassword= request.getParameter("password");
				
				System.out.println("Email is "+adminEmail);
				System.out.println("Password is "+adminPassword);
				
				//skip bean class because we have only two values
					//create object of AdminDao(chef) class object
				
				AdminDao ad= new AdminDao();
				boolean status = ad.login(adminEmail, adminPassword);
				
				if(status==true)
					response.sendRedirect("/collegeportal/admin/admin_home.jsp");
				else
				{
					String message="Invalid Credentials";
					//response.sendRedirect("/collegeportal/admin/admin_login.jsp?errorMessage="+message+"&nm='hello'&age=20");
					//this method of passing value is known as passing value using query string
					
					response.sendRedirect("/collegeportal/admin/admin_login.jsp?errorMessage="+message);

				}

					
	}

}
