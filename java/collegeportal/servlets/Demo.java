package collegeportal.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Demo")
public class Demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public Demo() 
    {
        System.out.println("in demo servlet class");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		pw.println("hello browser <br>");
		pw.println("how r u");
		
		String name="Scott";
		String age="20";
		
		pw.print("<h1> My name is "+name+ "</h1>");
		pw.print("<h2> I am "+age+ " years old </h1>");

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

}
