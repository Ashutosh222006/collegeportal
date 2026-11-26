package collegeportal.servlets.student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentLogOut
 */
@WebServlet("/StudentLogOut")
public class StudentLogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession hs=request.getSession(false);
		//return the reference of existing session
		System.out.println("in logout servlet "+hs.getId());
		//jo login ke time session id thi vhi wapas mil ri h 
		
		if(hs!=null)
		{
			hs.removeAttribute("sessionEmail");
			hs.removeAttribute("role"); //key ko kaat deta h mtlb jo b likha tha value jo thi jiska database se relation  ni hai 
			hs.invalidate(); //memory se session ka object clear kr deta h 
			request.setAttribute("errorMessage", "Logout Successfully");
			
			RequestDispatcher rd=request.getRequestDispatcher("/student/student_login.jsp");
			rd.forward(request, response);
		}

	}

}
