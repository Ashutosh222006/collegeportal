<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="collegeportal.dao.*"%>
<%@page import="collegeportal.beans.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Contacts</title>

<%@include file="/common/common_css.html"%>

<style>
.bg-image {
	background-image: url("/collegeportal/images/iitk1.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

.flex-container {
	display: flex;
	gap: 20px;
	flex-wrap: nowrap;
	margin-left: 5px;
}

.flex-card {
	width: 200px;
	height: 300px;
	background-color: grey;
	padding: 10px;
}

.text {
	color: blue;
	font-size: 15px;
	font-family: arial;
}
</style>

</head>

<body class="bg-image">

	<%
	AdminDao dao = new AdminDao();
	ArrayList<Feedback> FeedbackList = dao.allFeedback();
	%>

	<!-- top header -->
	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->
	<%@ include file="/admin/admin_header.html"%>

	<!-- main div -->

	<div class="main-div">

		<h2 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
			All Feedbacks
		</h2>

		<%
		if (FeedbackList.size() > 0) {
			int totalFeedback = FeedbackList.size();
		%>

		<h2 style="text-align: center;">
			Total Feedbacks are :
			<%=totalFeedback%>
		</h2>

		<div class="flex-container">

			<%
			for (Feedback c : FeedbackList) {
			%>

			<div class="flex-card">

				<%
				String star = "";

				if (c.getRating() == 1)
					star = "⭐";

				if (c.getRating() == 2)
					star = "⭐⭐";

				if (c.getRating() == 3)
					star = "⭐⭐⭐";

				if (c.getRating() == 4)
					star = "⭐⭐⭐⭐";

				if (c.getRating() == 5)
					star = "⭐⭐⭐⭐⭐";
				%>

				<p class="text">
					Name <%=c.getName()%>
				</p>

				<p class="text">
					Rating <%=star%>
				</p>

				<p class="text">
					Remark <%=c.getRemark()%>
				</p>

			</div>

			<%
			}
			%>

		</div>

		<%
		} else {
		%>

		<div style="width: 100%; background-color: grey">
			<h2 style="text-align: center; margin-top: 0px">
				No Feedback given till yet!!!!
			</h2>
		</div>

		<%
		}
		%>

	</div>

	<%@include file="/common/footer.html"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>

	<script src="/collegeportal/javascript/custom_validation.js"></script>

</body>
</html>