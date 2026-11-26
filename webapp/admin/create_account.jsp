<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>

<%@include file="/common/common_css.html"%>

<style>
.bg-image {
	background-image: url("/collegeportal/images/iitk1.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

.main-div {
	padding-top: 50px;
}

.form-div {
	width: 35%;
	margin: auto;
	border-radius: 10px;
	padding: 20px;
	background: rgba(255, 255, 255, 0.20);
	backdrop-filter: blur(10px);
	border: 1px solid rgba(255, 255, 255, 0.3);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
}

.btn-create {
	background: #2C3E50;
	color: white;
	border: none;
	width: 150px;
}

.btn-create:hover {
	background: #34495E;
	color: white;
}

.text-center {
	margin-top: 10px;
}
</style>

</head>

<body class="bg-image">

	<!-- top header -->
	<%@ include file="/common/top_header.html"%>

	<!-- admin header -->
	<%@ include file="/admin/admin_header.html"%>
	<%
	String msg = (String) request.getAttribute("successMsg");

	if (msg != null) {
	%>

	<div class="alert alert-success w-50 mx-auto text-center">
		<%=msg%>
	</div>

	<%
	}
	%>

	<div class="main-div">

		<div class="form-div">

			<h3 class="text-center mb-4 fw-bold">Create Account</h3>

			<form method="post" action="/collegeportal/CreateAccount"
				novalidate="novalidate" class="needs-validation">

				<div class="row">

					<div class="col-12">
						<label class="form-label">Name</label> <input type="text"
							class="form-control" required name="name">

						<div class="invalid-feedback">Name is mandatory</div>
					</div>

				</div>

				<div class="row mt-2">

					<div class="col-md-6">
						<label class="form-label">Email</label> <input type="email"
							class="form-control" required name="email">

						<div class="invalid-feedback">Email is mandatory</div>
					</div>

					<div class="col-md-6">
						<label class="form-label">Password</label> <input type="password"
							class="form-control" required name="password">

						<div class="invalid-feedback">Password is mandatory</div>
					</div>

				</div>

				<div class="row mt-2">

					<div class="col-md-6">
						<label class="form-label">Course</label> <input type="text"
							class="form-control" required name="course">

						<div class="invalid-feedback">Course is mandatory</div>
					</div>

					<div class="col-md-6">
						<label class="form-label">Phone</label> <input type="number"
							class="form-control" required name="phone">

						<div class="invalid-feedback">Phone is mandatory</div>
					</div>

				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-create">Create
						Account</button>
				</div>

			</form>

		</div>

	</div>

	<%@include file="/common/footer.html"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script src="/collegeportal/javascript/custom_validation.js"></script>

</body>
</html>