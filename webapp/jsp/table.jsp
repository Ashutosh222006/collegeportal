<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color: red; text-align: centre">Employee Details</h1>

	<%
	String[] name = { "scott", "smith", "john" };
	int[] salary = { 4000, 5000, 6000 };
	String[] dept = { "IT", "CS", "EC" };
	%>

	<table boder=3>
		<tr>
			<th>Name</th>
			<th>Department</th>
			<th>Salary</th>
		</tr>

		<%
		for(int i=0;i<3;i++)
		{
			
		%>

		<tr>
			<td><%=name[i] %></td>
			<td><%=dept[i] %></td>
			<td><%=salary[i] %></td>
		</tr>
		
		<%}%>
	</table>
</body>
</html>