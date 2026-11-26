<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
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
</style>
</head>
<body class="bg-image">
	<!-- top header -->

	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->

	<%@ include file="/common/header.html"%>

	<%
	String msg = request.getParameter("errorMessage");
	if (msg != null) {
	%>
	<div
		class="alert alert-danger alert-dismissible fade show w-50 mx-auto mt-5"
		role="alert">
		<strong style="margin-left: 35%"><%=msg%></strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>

	<!-- main div -->

	<div class="main-div">
		<h2 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">Admin
			Login Form</h2>

		<div class="form-div">

			<form method="post" action="/collegeportal/AdminLogin"
				novalidate="novalidate" class="needs-validation">
				<div class="form-floating mb-3">
					<input type="email" name="email" required class="form-control"
						placeholder="Enter the email"> <label for="floatingInput">Email
						address</label>

					<div class="invalid-feedback">Email is mandatory</div>

				</div>

				<div class="form-floating mb-3">
					<input required type="Password" name="password"
						class="form-control" placeholder="Enter the password"> <label
						for="floatingInput">Enter your password here</label>

					<div class="invalid-feedback">Password is mandatory</div>
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
</body>
</html>