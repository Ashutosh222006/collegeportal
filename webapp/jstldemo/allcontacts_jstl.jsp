<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Contacts</title>
</head>
<body>

	<c:catch var="exp">
		<s:setDataSource driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/college_db" user="root"
			password="root" var="con" />

		<c:set var="strsql" value="select * from contact"></c:set>

		<s:query var="rs" sql="${strsql }" dataSource="${con }"></s:query>
		<table border=3 style="margin: auto">
			<th>Name</th>
			<th>Phone</th>

			<c:forEach items="${rs.rows}" var="record">
				<tr>
					<td><c:out value="${record.name }"></c:out></td>
					<td><c:out value="${record.phone }"></c:out></td>
				</tr>
			</c:forEach>

		</table>

	</c:catch>

	<c:if test="${exp!=null }">
		<c:out value="Some thing is error"></c:out>
	</c:if>

</body>
</html>