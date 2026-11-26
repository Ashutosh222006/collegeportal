<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="collegeportal.dao.*"%>
<%@page import="collegeportal.beans.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Feedback</title>
<%@include file="/common/common_css.html"%>

<style>
.bg-image {
	background-image: url("/collegeportal/images/iitk1.jpg");
	background-size: cover;
	background-repeat: no repeat;
}

.form-div {
	width: 30%;
	height: auto;
	margin: auto;
	/* background-color: green; */
	/* 	border:1px solid black  */
	box-shadow: 0px 5px 10px grey;
	border-radius: 10px;
	padding: 20px;
}
</style>

</head>
<body class="bg-image">

<%
	String emailId = (String) session.getAttribute("sessionEmail");

	String role = (String) session.getAttribute("role");
	
	if (emailId == null)
	{
		RequestDispatcher rd = request.getRequestDispatcher("/student/student_login.jsp");
		request.setAttribute("errorMessage", "👿👿 UnAuthorized Access 👿👿");
		rd.forward(request, response);
	} 
	else 
	{
		if(!role.equals("student"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("/student/student_login.jsp");
			request.setAttribute("errorMessage", "👿👿 Wrong Access for the specefic Role 👿👿");
			rd.forward(request, response);
		}
		
		else
		{
		StudentDao dao = new StudentDao();
		Student s = dao.viewProfile(emailId);
	%>
	
	<!-- top header -->

	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->

	<%@ include file="/student/student_header1.html"%>

	<!-- main div -->
<%
	String msg = (String) request.getAttribute("successMsg");

	if (msg != null) {
	%>
	<div class="alert alert-success alert-dismissible fade show w-50 mx-auto mt-5" role="alert">
  <strong style="margin-left:35%"><%=msg %></strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
	<%
	}
	%>
	


	<div class="main-div">
		<h2 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">Student
			Feedback Form</h2>

		<div class="form-div">

			<form method="post" action="/collegeportal/StudentFeedback"
				novalidate="novalidate" class="needs-validation">

				<div class="input-group mb-3">
					<span class="input-group-text"><i class="fa-regular fa-user"></i>
					</span> <input type="text" name="name" required class="form-control" value="<%=s.getName()%>" readonly="readonly">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text"><i
						class="fa-regular fa-envelope"></i> </span> 
						<input type="text"name="email" required class="form-control" readonly="readonly" value="<%=s.getEmail()%>">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text"><i
						class="fa-solid fa-pen-to-square"></i> </span>
					<textarea name="remark" required class="form-control"
						placeholder="enter your views"></textarea>
				</div>

				<div class=" mb-3">
					<select name="rating" class="form-select">
						<option>Give Rating</option>
						<option value="1">⭐</option>
						<option value="2">⭐⭐</option> 
						<option value="3">⭐⭐⭐</option>
						<option value="4">⭐⭐⭐⭐</option>
						<option value="5">⭐⭐⭐⭐⭐</option>
					</select>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-danger">Submit</button>
				</div>
			</form>


		</div>


	</div>

	<%@include file="/common/footer.html"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

	<!-- include -->

	<script src="/collegeportal/javascript/custom_validation.js"></script>
	
	<%
	}}
	%>
</body>
</html>