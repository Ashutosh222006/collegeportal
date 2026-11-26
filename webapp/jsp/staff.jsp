<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Details</title>
<%@include file="/common/common_css.html"%>

<style>
/* class selector */
.flex-container {
	display: flex;
	width: 100%;
	height: 300px;
	gap: 2%;
}

.box {
	width: 100%;
	height: 300px;
	border-radius: 20px;
	text-align: center;
}

.image {
	width: 40%;
	height: 90%;
	border-radius: 50%;
}

.text {
	font-size: 12px;
	font-family: Georgia;
	color: red;
}
</style>

</head>

<%@ include file="/common/top_header.html"%>

<%@ include file="/common/header.html"%>
<body style="margin: 0px; background-color: #F1F5F9">

	<div style="background-color: #660000; height: 50px; width: 100%;">
		<h2 style="color: white; margin-top: 0px; text-align: center;">Meet
			with our Staff</h2>

	</div>
	<div class="main-div">

		<div class="flex-container">

			<div class="box">
				<div>
					<img alt="" src="/collegeportal/images/iitk.jpg" class="image">
				</div>

				<div>
					<p class="text">Name- Scott</p>
					<p class="text">Subject - English</p>
					<p class="text">Phone - 9654851255</p>
				</div>
			</div>

			<div class="box">
				<div>
					<img alt="" src="/collegeportal/images/iitk.jpg" class="image">
				</div>

				<div>
					<p class="text">Name- Scott</p>
					<p class="text">Subject - English</p>
					<p class="text">Phone - 9654851255</p>
				</div>
			</div>

			<div class="box">
				<div>
					<img alt="" src="/collegeportal/images/iitk.jpg" class="image">
				</div>

				<div>
					<p class="text">Name- Scott</p>
					<p class="text">Subject - English</p>
					<p class="text">Phone - 9654851255</p>
				</div>
			</div>

		</div>
	</div>
	<%@include file="/common/footer.html"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html> --%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="collegeportal.dao.*"%>
<%@ page import="collegeportal.beans.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff</title>

<%@ include file="/common/common_css.html"%>

<style>
body {
	margin: 0;
	background: #4668f0;
}

.title {
	width: 100%;
	padding: 15px;
	text-align: center;
	color: white;
	font-size: 40px;
}

.flex-container {
	width: 95%;
	margin: auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 25px;
}

.box {
	width: 280px;
	background: white;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0px 0px 15px rgba(0, 0, 0, .3);
}

.image {
	width: 100%;
	height: 300px;
	object-fit: cover;
}

.staff {
	padding-left: 15px;
	font-size: 18px;
	font-family: Arial;
}
</style>

</head>

<body>


<%@ include file="/common/top_header.html"%>

<%@ include file="/common/header.html"%>

	<%
	CommonDao dao = new CommonDao();

	ArrayList<Staff> staffList = dao.allStaff();

	String path = request.getContextPath();
	%>

	<div class="title">Meet With Our Staff</div>

	<div class="flex-container">

		<%
		if (staffList != null && staffList.size() > 0) {

			for (Staff s : staffList) {

				String imageUrl = path + "/" + s.getProfile_pic();
		%>

		<div class="box">

			<img src="<%=imageUrl%>" class="image">

			<p class="staff">
				<b>Name :</b>
				<%=s.getName()%></p>

			<p class="staff">
				<b>Designation :</b>
				<%=s.getDesignation()%></p>

			<p class="staff">
				<b>Email :</b>
				<%=s.getEmail()%></p>

		</div>

		<%
		}

		} else {
		%>

		<h2 style="color: white;">No Staff Available</h2>

		<%
		}
		%>

	</div>

</body>
</html>