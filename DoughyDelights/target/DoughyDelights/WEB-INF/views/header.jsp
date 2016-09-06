<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@page session="true"%>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" />
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


<style type="text/css">


body {
	background-image: url("resources/pictures/bgimage.jpg");
	padding-bottom: 0px;
	margin-bottom: 0px;
}

.navbar {
	background-color: LightCoral;
	color: NavajoWhite;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

li a {
	color: NavajoWhite;
	padding: 14px 16px;
	text-decoration: None;
}

.navbar-brand {
	color: NavajoWhite;
}
</style>

</head>
<body>
	
	<br>
	

	<div class=container>
		<nav class="navbar">
			<div class="container-fluid">
				<div class="navbar-header">
					<font face="Jokerman"> <a class="navbar-brand">DoughyDelights</a>
					
					</font>
					

				</div>

				<ul class="nav navbar-nav navbar-right">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
				 <li><a href="#"><span
								class="glyphicon glyphicon-user"></span> ${pageContext.request.userPrincipal.name}</a></li>
								<li class="active"><a href="home"><span
							class="glyphicon glyphicon-home"></span>Home</a></li></c:if>
								
		<!-- 			 <li class="active"><a href="gomainpage"><span
							class="glyphicon glyphicon-home"></span>Home</a></li>  -->


					<li><a href="about">AboutUs</a></li>

					<c:if test="${pageContext.request.userPrincipal.name == null}">

                       <li class="active"><a href="./"><span
							class="glyphicon glyphicon-home"></span>Home</a></li>
						<li><a href="goologin"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a href="registration.obj"><span
								class="glyphicon glyphicon-user"></span> SignUp</a></li>

					</c:if>



					<c:if test="${pageContext.request.userPrincipal.name != null}">

						
 					<sec:authorize access="hasRole('ROLE_USER')">

							<li><a href="viewcartt"><span
									class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartSize})</a></li>
						</sec:authorize>

						<li><a href="goologin?logout"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</c:if>

				</ul>

			</div>


		</nav>
	</div>
</body>
</html>