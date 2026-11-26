<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<%@include file="/common/common_css.html"%>

<style>
/* class selector */
.flex-container {
	margin-top: 2%;
	display: flex;
	/*  flex-direction:column; */ /* default */
	/* background-color:green; */
	width: 100%;
	height: 200px; 
	gap: 2%;
}

.box {
	width: 25%;
	height: 200px;
	/* 	background-color: #870000; */
	border-radius: 20px;
	margin-left: 2%;
	margin-right: 2%;
	transition: transform.6s;
	overflow: hidden;
}

/* pseudo class */
.box:hover {
	transform: scale(1.07);
	box-shadow: 10px 5px 30px grey;
}

.image {
	width: 100%;
	height: 100%;
	border-radius: 20px;
	transition: transform.6s;
}

.company-container {
	display: flex;
	gap: 12%;
	margin-top: 2%;
	justify-content: center;
	align-items: center;
	margin-left: 4%;
	margin-right: 4%;
}

.box1 {
	width: 120px;
	height: 120px;
	background-color: white;
	border: 2px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	overflow: hidden;
}

.box1:hover {
	transform: scale(1.1);
	transition: 0.5s;
	box-shadow: 0px 0px 15px gray;
}

.start {
	background-color: #060024;
	color: white;
	height: 60px;
	width: 100%;
	margin-top: 2%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 25px;
}

.start1 {
	background-color: #060024;
	color: white;
	height: 60px;
	width: 100%;
	margin-top: 2%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 20px;
	margin-left: 2%;
	margin-right: 2%;
}

.start1:hover {
	background-color: #060024;
	color: white;
	transform: scale(1.1);
	transition: 0.5s;
	box-shadow: 0px 0px 15px gray;
}
</style>

</head>
<body style="margin: 0px; background-color: #F1F5F9">

<!-- top header -->

	<%@ include file="/common/top_header.html"%>

<!-- normal header -->

	<%@ include file="/common/header.html"%>
	<!-- flex div -->
	<!-- main div -->
	<div class="main-div">

		<div class="flex-container">

			<div class="box">
				<a href="/collegeportal/jsp/auditorium.jsp"><img alt=""
					src="/collegeportal/images/audi.jpg" class="image"></a>
			</div>
			<div class="box">
				<a href="/collegeportal/jsp/cafeteria.jsp"><img alt=""
					src="/collegeportal/images/cafe.jpg" class="image"></a>
			</div>
			<div class="box">
				<a href="/collegeportal/jsp/library.jsp"><img alt=""
					src="/collegeportal/images/lib.jpg" class="image"></a>
			</div>
			<div class="box">
				<a href="/collegeportal/jsp/playground.jsp"><img alt=""
					src="/collegeportal/images/ok.jpg" class="image"></a>
			</div>

		</div>

		<div class="start">OUR TOP RECRUITERS</div>

		<div class="company-container">
			<div class="box1">
				<img alt="" src="/collegeportal/images/hcl_logo.jpg" class="image">
			</div>
			<div class="box1">
				<img alt="" src="/collegeportal/images/google_logo.jpg"
					class="image">
			</div>
			<div class="box1">
				<img alt="" src="/collegeportal/images/microsoft_logo.jpg"
					class="image">
			</div>
			<div class="box1">
				<img alt="" src="/collegeportal/images/accenture_logo.jpg"
					class="image">
			</div>
			<div class="box1">
				<img alt="" src="/collegeportal/images/tata_logo.jpg" class="image">
			</div>
		</div>

		<div class="flex-container">
			<a href="/collegeportal/jsp/notice.jsp" class="start1">Notice</a> <a
				href="/collegeportal/jsp/placement.jsp" class="start1">Placement</a>
			<a href="/collegeportal/jsp/our_vision.jsp" class="start1">Our
				Vision</a>
		</div>
	</div>



	<%@include file="/common/footer.html"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>

</html>