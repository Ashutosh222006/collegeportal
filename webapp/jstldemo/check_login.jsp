<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check login</title>
</head>
<body>

<c:set var="email" value="${param.email }"></c:set>
<c:set var="pass" value="${param.password }"></c:set>

<c:if test="${email=='Scott@gmail.com' and pass=='1234' }">
<c:redirect url="/jstldemo/jstl_home.jsp"></c:redirect>
</c:if>

<c:redirect url="/jstldemo/login_jstl.jsp"></c:redirect>

</body>
</html>