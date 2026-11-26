<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="collegeportal.dao.*"%>
<%@page import="collegeportal.beans.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudentEditProfile</title>
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
	padding: 10px;
}

.profile-div {
	margin: auto;
	background-color: cyan;
	width: 20%;
	border-radius: 6%;
	padding: 2%;
	box-shadow: 0px 0px 20px black;
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

	<%@ include file="/common/top_header.html"%>

	<%@ include file="/student/student_header1.html"%>


	<!-- main div -->

	<div class="main-div">
		<h2 style="text-align: center; margin-top: 20px; margin-bottom: 20px;"> Hello <%=s.getName()%> You can Edit your profile</h2>

		<div class="profile-div">
			<p><i class="fa-solid fa-at"></i> Email:<%=s.getEmail()%></p>
			<p><i class="fa-brands fa-free-code-camp"></i> Course:<%=s.getCourse()%></p>

			<form method="post" action="/collegeportal/StudentEditProfile" novalidate="novalidate">
			
			<div class="mb-3">
			<input type="text" name="name" required="required" class="form-control" value="<%=s.getName()%>">
			</div>
			
			<div class="mb-3">
			<input type="text" name="phone" required="required" class="form-control" value="<%=s.getPhone()%>">
			</div>
			
			<div class="text-center">
			<button class="btn btn-danger">Edit</button>
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