<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Mainpage</title>
<style type="text/css">
/* body
{
background-image:url("resources/images/3.jpg");

background-size:cover;
} */
.navbarmain {
	background-color:LightCoral;
	
	

	 	color:  #DAF7A6;
	 
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	
}



li a {
	color:  #DAF7A6;
	
	padding: 14px 16px;
	text-decoration: None;
}
</style>
</head>
<body>

<!-- <body background-image: <c:url value="resources/images/2.jpg"/>>
 --><br><br>
 <div class=container>
		<nav class="navbarmain">
			<div class="container-fluid">
				<ul class="nav navbar-nav navbar-left">


					<font face="Jokerman"><h1>
							<b>DoughyDelights</b>
						</h1></font>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty loggedInUser}">


							<li><a href="login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
							<li><a href="signup"><span
									class="glyphicon glyphicon-user"></span> SignUp</a></li>


						</c:when>

						<c:when test="${not empty loggedInUser}">

							<li><a href="logout"><span
									class="glyphicon glyphicon-user"></span> Logout</a></li>


						</c:when>
					</c:choose>
				</ul>
			</div>
			<%-- <%@include file="mainheader.jsp"%> --%>
	
		</nav>
</div>
</div>
</body>
</html>