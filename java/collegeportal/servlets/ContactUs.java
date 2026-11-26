package collegeportal.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collegeportal.beans.Contact;
import collegeportal.dao.CommonDao;


@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ContactUs() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentname = request.getParameter("name");
		String studentphone = request.getParameter("phone");
		String studentEmail = request.getParameter("email");
		String studentQuestion = request.getParameter("question");
		
		/*
		 * System.out.println("name is "+studentname);
		 * System.out.println("phone number is  is "+studentphone);
		 * System.out.println("Email is "+studentEmail);
		 * System.out.println("remark is "+studentRemark);
		 */
		
		//creating object of contact bean class 
		Contact c=new Contact(studentname, studentEmail, studentphone, studentQuestion);
		//creating object of common DAO class
		CommonDao dao=new CommonDao();
		int status=dao.addContact(c);
		
		if(status>0)
			System.out.println("CONTACT ADDED");
			//response.sendRedirect("/collegeportal/jsp/message.jsp");
		
		//data sent from servlet to JSP
		String message ="Thank you for contacting us 😀";
		//request Scope
		request.setAttribute("successMsg",message);
		//book inside a bag
			//bag->key
				//book-> value
		
		//I call you -> take this bag and give it to your hod
		//servlet -> RequestDispatcher -> uses it own method to transfer data on the given URL
		
		RequestDispatcher rd=request.getRequestDispatcher("jsp/contact_us.jsp");
		//you -> hod url relative path 
		rd.forward(request, response);
	}

}
