<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback</title>
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
	<!-- top header -->

	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->

	<%@ include file="/common/header.html"%>

	<!-- main div -->

	<div class="main-div">
		<h2 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">Thanks for your
			Feedback 😊</h2>
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