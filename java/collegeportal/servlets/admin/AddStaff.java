package collegeportal.servlets.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import collegeportal.beans.Staff;
import collegeportal.dao.AdminDao;


/**
 * Servlet implementation class AddStaff
 */
@WebServlet("/AddStaff")
@MultipartConfig 
public class AddStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStaff() {
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
		
	//******************it is just a request**************************
			Part p=request.getPart("profilePic"); //
		
		String fileName=p.getSubmittedFileName();
		long size=p.getSize();
		System.out.println("File Name and size is  "+fileName+ ""+ " "+size);
	
		//**********************to get server path************************
		
		 ServletContext sc=getServletContext();//GenericServlet
		  
		 String serverPath=sc.getRealPath("");//return the //path of the hosted(deployed,running) website
		 
		 System.out.println("Path is  "+serverPath);
		    
		 //****************for making a new folder************************
		 
		  String folderName="staffPic"; //folder name 
		  
		  String fullPath=serverPath+folderName;
		  
		  File f=new File(fullPath);//creating object
		  
		 String picPath=""; //server pr img store krna chah re h
		   String dbPath="";//store the image path that for database table
		  
		   //*********************for checking that folder is already present or not**********************
		   
		  if(!f.exists()) 
		  {
		   f.mkdir();//for creating directory on that path
		  System.out.println("Directory/folder created"); 
		  }
		  
		  //***************ho skta h admin by mistake img ka name save kr de isiliye ye kr re h overide ho jaegi image***********
		  //******************hr img ke nam ke sath ek time stamp jod dia h so duplicacy ni hogi**********************
		  
		  long t=System.currentTimeMillis();
		  System.out.println("milliseconds "+t);
		  
		  String uniqueFileName = t + "_" + fileName;
		  picPath=fullPath+File.separator+uniqueFileName;
		  
		  dbPath=folderName+File.separator+uniqueFileName;
		  
		  
		  //profileImages/abc.png
		  
		  System.out.println(picPath);
		  System.out.println(dbPath); 
		  p.write(picPath); //photo get copied in the folder
		 
		  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--code for fetching remaining data-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		  String name=request.getParameter("name");
		  String email=request.getParameter("email");
		  String phone=request.getParameter("phone");
		  String designation=request.getParameter("designation");
		  
		  //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-- creating object of staff bean class object -->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		  Staff s= new Staff(name,email,phone,designation,dbPath);
		  
		  AdminDao dao=new AdminDao();
		  int status=dao.addStaff(s);
		  
		  if(status>0)
		  {
			  request.setAttribute("successMsg", "Details added sucessfully");
			  
			  RequestDispatcher rd=request.getRequestDispatcher("admin/add_staff.jsp");
			  rd.forward(request, response);
		  }
	}

}
