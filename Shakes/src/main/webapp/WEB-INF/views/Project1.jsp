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
.navbar {
	background-color: MediumVioletRed;
	background-image: none;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

li {
	float: left;
	color: red;
}

li a {
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: None;
}
</style>
</head>


<body>

	<div>
		<nav class="navbar ">
			<div class="container-fluid"
				style="color: white; background-color: LightCoral">
				<ul class="nav navbar-nav navbar-left">


					<font face="Matura MT Script Capitals"><h2>
							<b>DoughyDelights</b>
						</h2></font>
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
		</nav>
	</div>

	<%@include file="mainheader.jsp"%>
<div id="admin">

		<c:if test="${isAdmin eq true }">
			<%@include file="admin.jsp"%>
		</c:if>
	</div>

	<div id="user">

		<c:if test="${isAdmin eq false }">

			<div id="message">
				<h3>${loginsuccess}</h3>
			</div>
			<%@include file="carousel.jsp"%>
			<%@include file="leftnavbar.jsp"%>
		</c:if>

	</div>
	<div id=signup>

		<c:if test="${isuserClickedRegisterHere eq true }">
			<%@include file="signup.jsp"%>

		</c:if>
	</div>
	<div id=login>

		<c:if
			test="${isuserClickedLoginHere eq true || invalidCredentials eq true }">

			<%@include file="login.jsp"%>
		</c:if>
	</div>





</body>
</html>