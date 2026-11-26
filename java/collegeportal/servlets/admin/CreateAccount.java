package collegeportal.servlets.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collegeportal.beans.Student;
import collegeportal.dao.AdminDao;

@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateAccount() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String studentEmail = request.getParameter("email");
		String studentPassword = request.getParameter("password");
		String studentName = request.getParameter("name");
		String studentCourse = request.getParameter("course");
		String studentPhone = request.getParameter("phone");

		System.out.println("Email is " + studentEmail);
		System.out.println("Password is " + studentPassword);
		System.out.println("Name is " + studentName);
		System.out.println("Course is " + studentCourse);
		System.out.println("Phone is " + studentPhone);

		Student s = new Student(studentEmail, studentPassword,
				studentName, studentCourse, studentPhone);

		AdminDao dao = new AdminDao();

		int status = dao.addStudent(s);

		if (status > 0) {

			System.out.println("ACCOUNT CREATED");

			String message = "Student Account Created Successfully";

			request.setAttribute("successMsg", message);

			RequestDispatcher rd =
					request.getRequestDispatcher("/admin/create_account.jsp");

			rd.forward(request, response);
		}
	}
}