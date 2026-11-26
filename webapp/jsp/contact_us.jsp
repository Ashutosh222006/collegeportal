<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@include file="/common/common_css.html"%>

<style>
.flex-container {
	margin-top: 1%;
	display: flex;
	/*  flex-direction:column; */ /* default */
	/*  background-color: black;  */
	width: 100%;
	height: 500px;
	gap: 2%;
}

.box {
	width: 50%;
	height: 450px;
	/* background-color: #870000; */
	border-radius: 20px;
	margin-top: 2%;
	margin-left: 2%;
	margin-right: 2%;
	/* 	overflow: hidden; */
}

/* .image {
	width: 100%;
	height: 100%;
	border-radius: 20px;
	box-shadow: 5px 5px 20px black ;
	border-radius: 10px;
	
} */
.form-div {
	width: 30%;
	height: auto;
	margin: auto;
	/* background-color: green; */
	/*  border:0.5px solid grey;  */
	box-shadow: 0px 5px 10px black;
	padding: 10px;
	border-radius: 10px;
}

.bg-image {
	background-image: url("/collegeportal/images/iitk1.jpg");
	background-size: cover;
	background-repeat: no repeat;
}
</style>
</head>
<body class="bg-image">



	<!-- top header -->

	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->

	<%@ include file="/common/header.html"%>

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

	<!-- main div -->

	<div class="main-div">
		<h1 style="text-align: center; margin-top: 20px;">Feel
			Free to Reach Us 😊</h1>

		<div class="flex-container">

			<div class="form-div">

				<form method="post" action="/collegeportal/ContactUs"
					novalidate="novalidate" class="needs-validation">


					<div class="form-floating mb-3">
						<input type="text" name="name" required class="form-control"
							placeholder="Enter the name"> <label for="floatingInput">Email
							name</label>

						<div class="invalid-feedback">Email name is mandatory</div>

					</div>

					<div class="form-floating mb-3">
						<input required type="text" name="phone" class="form-control"
							placeholder="Enter your phone number"> <label
							for="floatingInput">Enter your phone number</label>

						<div class="invalid-feedback">Phone Number is mandatory</div>

					</div>

					<div class="form-floating mb-3">
						<input required type="email" name="email" class="form-control"
							placeholder="Enter the email"> <label for="floatingInput">Email
							address</label>

						<div class="invalid-feedback">Email is mandatory</div>

					</div>

					<div class="form-floating mb-3">
						<textarea name="question" required class="form-control"
							placeholder="enter your views"></textarea>
						<label for="floatingInput">Enter your question</label>

						<div class="invalid-feedback">Ask the Question?</div>

					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-danger">Submit</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<%@include file="/common/footer.html"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

	<script src="/collegeportal/javascript/custom_validation.js"></script>


	<!-- include -->

	<script src="/collegeportal/javascript/custom_validation.js"></script>

</body>
</html>