<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demo</title>
</head>
<body>
<h1>Hello JSP</h1>
<% String name = "Ashutosh Shukla";

int age=20;
float salary = 89000.00f;

%>

<% System.out.println("hello "+name); %>

<h1 style="color:red"> Hello <%= name %></h1>
<p>your age is <%= age %> and your salary is <%= salary %> </p>

<h1>another way <%out.println ("hello  "+name); %> </h1>
</body>
</html>