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

<h3 align="center">Hi ${cakeUser.name}..!</h3>
<h4 align="center">You have registered successfully</h4>
<h4 align="center">We have sent you an otp</h4>
<h4 align="center">Use username and otp to login with  our site</h4>
<br>
<center><a class="btn btn-success" href="<c:url value = "goologin" />">LOGIN</a></center>
</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@include file="footer.jsp"%>
</body>
</html>