package collegeportal.servlets.student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collegeportal.beans.Feedback;
import collegeportal.dao.StudentDao;


@WebServlet("/StudentFeedback")
public class StudentFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentFeedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String adminEmail = request.getParameter("email"); String adminPassword=
		 * request.getParameter("password");
		 * 
		 * System.out.println("Email is "+adminEmail);
		 * System.out.println("Password is "+adminPassword);
		 */

		String studentName = request.getParameter("name");
		String studentEmail = request.getParameter("email");
		String studentRemark = request.getParameter("remark");
		String studentRating = request.getParameter("rating");

		int stRating=Integer.parseInt(studentRating);
		
		System.out.println("name is " + studentName);
		System.out.println("Email is " + studentEmail);
		System.out.println("remark is " + studentRemark);
		System.out.println("rating is " + studentRating);

		/*
		 * StudentDao sd = new StudentDao();
		 * 
		 * boolean status = sd.saveFeedback(studentName, studentEmail,
		 * studentRemark,studentRating);
		 * 
		 * if (status == true) response.sendRedirect("/collegeportal/index.jsp"); else
		 * response.sendRedirect("/collegeportal/student/student_feedback.jsp");
		 */
         
		Feedback f = new Feedback(studentName, studentEmail, studentRemark, stRating);
		StudentDao dao = new StudentDao();
		int status = dao.addfeedback(f);

		if (status > 0)
			System.out.println("FEEDBACK SUBMITTED");
		
				String message ="Thank you for your feedback 😀";
				
				request.setAttribute("successMsg",message);
				
				RequestDispatcher rd=request.getRequestDispatcher("/student/student_feedback.jsp");

				rd.forward(request, response);

		
		
	}

}
