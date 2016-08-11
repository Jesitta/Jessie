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
	background-color: LightCoral;
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
}

li a {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: None;
}

li a:hover:not (.active ) {
	background-color: white;
}
</style>

</head>

<body>

	<div>
		<nav class="navbar ">
			<div class="container-fluid" style="background-color: #FFFFE0">
				<ul class="nav navbar-nav navbar-left">


					<font face="Matura MT Script Capitals"	style="color: MediumVioletRed"><h2>
							<b>DoughyDelights</b>
						</h2></font>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty loggedInUser}">


							<li><a href="login" style="color: MediumVioletRed"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
							<li><a href="signup" style="color: MediumVioletRed"><span
									class="glyphicon glyphicon-user"></span> SignUp</a></li>


						</c:when>

						<c:when test="${not empty loggedInUser}">

							<li><a href="logout" style="color: MediumVioletRed"><span
									class="glyphicon glyphicon-user"></span> Logout</a></li>


						</c:when>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
<%@include file="mainheader.jsp"%>

	<%-- <h3>${regsuccess}</h3>
	<h3>${loginsuccess}</h3>
	<h3>${logout}</h3>
	<h3>${errorMessage}</h3>
	<h3>${adminsuccess}</h3>
 --%>




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
		</c:if>

	</div>
	<div id=signup>
		
		<c:if test="${isuserClickedRegisterHere eq true }">
  <%@include file="signup.jsp"%>

		</c:if>
	</div>
	<div id=login>
		
		<c:if test="${isuserClickedLoginHere eq true || invalidCredentials eq true }">
			 
			<%@include file="login.jsp"%>
		</c:if>
		</div>
		<%-- <div id=login> 
		
		<c:if test="${isuserClickedLoginHere eq true}">
			
			<%@include file="login.jsp"%>
		</c:if>
		</div> --%>
		
		
	<%--
	
<c:if test="${isAdmin==true }">
<%@include file="admin.jsp" 
</c:if>


	<c:if test="${isUserClickedRegistereHere eq true }">
<%@include file="signup.jsp" %>
</c:if>


<c:if test="${isuserClickedLoginHere==true || invalidCredentials=true }">
<div id="error" ${errorMessage }></div>
<%@include file="login.jsp" %>
</c:if>
<div id="admin">
<c:if test="${isAdmin==true }">
<%@include file="admin.jsp" %>
</c:if>






	<h3>${regsuccess}</h3>
	<h3>${loginsuccess}</h3>
	<h3>${logout}</h3>
	<h3>${errorMessage}</h3>
	<h3>${adminsuccess}</h3>

	<div class="container-fluid">
		<div id="Carousel" class="carousel slide carousel-fade "
			style="padding-left: 30%; padding-top: 70px; width: 100%">
			<ol class="carousel-indicators"
				style="padding-left: 40%; width: 100%">
				<li data-target="Carousel" data-slide-to="0" class="active"></li>
				<li data-target="Carousel" data-slide-to="1"></li>
				<li data-target="Carousel" data-slide-to="2"></li>
				<li data-target="Carousel" data-slide-to="3"></li>
				<li data-target="Carousel" data-slide-to="4"></li>
				<li data-target="Carousel" data-slide-to="5"></li>
				<li data-target="Carousel" data-slide-to="6"></li>
				<li data-target="Carousel" data-slide-to="7"></li>

				<li data-target="Carousel" data-slide-to="8"></li>
			</ol>

			<div class="carousel-inner">
				<div class="item ">
					<img src="resources/images/slide1.png" class="img-responsive">
				</div>
				<div class="item active">
					<img src="resources/images/slide2.png" class="img-responsive">
				</div>
				<div class="item">
					<img src="resources/images/slide3.png" class="img-responsive">
				</div>
				<div class="item">
					<img src="resources/images/slide4.png" class="img-responsive">
				</div>
				<div class="item">
					<img src="resources/images/slide5.png" class="img-responsive">
				</div>
				<div class="item">
					<img src="resources/images/slide6.png" class="img-responsive">
				</div>
				<div class="item">
					<img src="resources/images/slide7.png" class="img-responsive">
				</div>
				<div class="item">
					<img src="resources/images/slide8.png" class="img-responsive">
				</div>
			</div>
		</div>
	</div> --%>


</body>
</html>