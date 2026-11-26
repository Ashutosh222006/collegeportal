package collegeportal.servlets.student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import collegeportal.dao.StudentDao;

/**
 * Servlet implementation class StudentEditProfile
 */
@WebServlet("/StudentEditProfile")
public class StudentEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentEditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession hs=request.getSession(false);  //existing session reference
		String email=(String)hs.getAttribute("sessionEmail");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			
			System.out.println(name+phone);
			
			StudentDao dao = new StudentDao();
				int status=	dao.editProfile(name,phone,email);
				
				if(status>0)
				{
					response.sendRedirect("/collegeportal/student/student_home.jsp");
				}
	}

}
