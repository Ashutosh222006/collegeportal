
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
	background-position: center;
}

.main-div {
	width: 90%;
	margin: 20px auto;
}

.table-div {
	background-color: rgba(0, 0, 0, 0.8);
	padding: 15px;
	border-radius: 5px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: black;
	color: white;
}

table, th, td {
	border: 1px solid white;
}

th {
	background-color: #222;
	color: white;
	padding: 10px;
	text-align: center;
}

td {
	padding: 10px;
	text-align: center;
}


</style>

</head>

<body class="bg-image">

	<%
	AdminDao dao = new AdminDao();
	ArrayList<Contact> contactList = dao.allContacts();
	%>

	<!-- top header -->
	<%@ include file="/common/top_header.html"%>

	<!-- normal header -->
	<%@ include file="/admin/admin_header.html"%>

	<!-- main div -->
	<div class="main-div">

		<h2
			style="text-align: center; margin-top: 20px; margin-bottom: 20px; color: black;">
			Contacts Details</h2>

		<%
		if (contactList.size() > 0) {
			int totalContacts = contactList.size();
		%>

		<h2 style="text-align: center; color: black;">
			<%=totalContacts%>
			user have done contacts till yet
		</h2>
		<form method ="post" action="/collegeportal/DeleteContact">
			<div class="table-div">

				<table>

					<tr>
						<th>Select</th>
						<th>Email</th>
						<th>Question</th>
						<th>Name</th>
						<th>Phone</th>
					</tr>

					<%
					for (int i = 0; i < contactList.size(); i++) {
						Contact c = contactList.get(i);
					%>

					<tr>

						<td> <input type="checkbox"
							class="form-check-input" name="chk" value="<%=c.getId()%>" >
						</td>

						<td><%=c.getEmail()%></td>
						<td><%=c.getQuestion()%></td>
						<td><%=c.getName()%></td>
						<td><%=c.getPhone()%></td>

					</tr>

					<%
					}
					%>
					<tr>
						<th colspan=5>
						<button class="btn btn-danger">Delete</button></th>
					</tr>
				</table>

			</div>
		</form>
		<%
		} else {
		%>

		<div
			style="width: 100%; background-color: black; color: white; padding: 15px;">
			<h2 style="text-align: center; margin: 0;">No contacts done till
				yet!!!!</h2>
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

