<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Edit your details</h1>
	<%
	String name = "scott";
	String city = "Lucknow";
	%>

	<input type="text" name="name" value="<%=name%>">
	<br>
	<input type="text" name="city" value="<%=city%>">
	

</body>
</html>