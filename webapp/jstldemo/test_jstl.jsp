<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demo</title>
</head>
<body>

<%String nm="Scott"; %>
<%=nm %>
<c:set var="nm" value="Scott" scope="application"></c:set>
<h1>Hello <c.out value="${nm}"> </c.out></h1>

<c:forEach var="i" begin="1" end="10" step="2">

<h2><c:out value="${i}"></c:out></h2>

</c:forEach>


<c:if test="${nm=='Scott' }">
<c:out value="Condition matched"></c:out>
</c:if>

<c:choose>

<c:if test="">

</c:if>

<c:if test="">

</c:if>

<c:otherwise>

</c:otherwise>

</c:choose>

</body>
</html>