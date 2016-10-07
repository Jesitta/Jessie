<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

<title>Main</title>

</head>
<body>
<%@include file="header.jsp"%>


	
<div class="container">

<h3 align="center">Hi ${cakeUser.name}</h3>
<h4 align="center">You have been registered successfully</h4>

<center><a class="btn btn-success" href="<c:url value = "/" />">HOME</a></center>
</div>
<%@include file="footer.jsp"%>
</body>
</html>