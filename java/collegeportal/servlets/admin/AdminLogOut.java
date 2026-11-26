package collegeportal.servlets.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogOut")
public class AdminLogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLogOut() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession hs = request.getSession(false);
		// return the reference of existing session

		if (hs != null) {

			System.out.println("In Logout Servlet " + hs.getId());

			hs.removeAttribute("sessionEmail");
			hs.removeAttribute("role");

			hs.invalidate();

			request.setAttribute("errorMessage", "Logout Successfully");

			RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
			rd.forward(request, response);
		}
	}
}