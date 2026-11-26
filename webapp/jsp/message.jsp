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
	margin-top: 2%;
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
<body class="bg-image" >
	<!-- top header -->

	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->

	<%@ include file="/common/header.html"%>

	<!-- main div -->

	<div class="main-div">
		<h1 style="text-align: center; margin-top: 20px; margin-bottom: 10px;">Thank you for contacting us 😊</h1>
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