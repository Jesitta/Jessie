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
/*  body
{
background-image:url("resources/images/3.jpg");

background-size:cover;
}  */
.navbarmain {
	background-color:LightCoral;
	
	

	 	color:NavajoWhite  ;
	 
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	
}



li a {
	color:  NavajoWhite ;
	
	padding: 14px 16px;
	text-decoration: None;
}
.navbar-brand
{
color:NavajoWhite;
}
</style>
</head>
<body style="background-image:url(https://s3.amazonaws.com/Syntaxxx/background-gold-bokeh.jpg);">

<!-- <body background-image: <c:url value="resources/images/2.jpg"/>>
 --><br><br>

 <div class=container>
		<nav class="navbarmain">
			<div class="container-fluid">
			 <div class="navbar-header">
			 
		 <font face="Jokerman">	 <a class="navbar-brand">DoughyDelights</a>
    </font>
						
    </div>
			
        
				<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#"><span
									class="glyphicon glyphicon-home"></span>Home</a></li>
     
       
          <li><a href="#">AboutUs</a></li>
          <li><a href="#">ContactUs</a></li>
					<c:choose>
						<c:when test="${empty loggedInUser}">


							<li><a href="gologin"><span
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
<div id="admin">


		<c:if test="${isAdmin eq true }">
		<%@include file="mainheader.jsp"%> 
			<%@include file="admin.jsp"%>
		</c:if>
	</div>

	<div id="user">

		<c:if test="${isAdmin eq false }">
		
	
		<div class="col-md-offset-1"><h4><b><i>Welcome ${loggedInUser}..!</i></b></h4></div>
		      
			<%@include file="carousel.jsp"%> 
			
		</c:if>

	</div>
	<%--  <div id=signup>

		<c:if test="${isuserClickedRegisterHere eq true }">
		<br>
		<div class="col-md-offset-1"><h1><b><i>${regsuccess}</i></b></h1></div>
			
		</c:if> 
	</div>  --%>
	<%-- <div id=login>

		<c:if
			test="${isuserClickedLoginHere eq true || invalidCredentials eq true }">
             
			<%@include file="login.jsp"%>
		</c:if>
	</div> --%>
	<div id=login>

		<c:if
			test="${empty loggedInUser }">
			<br>
<div class="col-md-offset-1"><h4><b><i>${logout}</i></b></h4></div>
			
         <div class="col-md-offset-1"><h4><b><i>${regsuccess}</i></b></h4></div>
			<%@include file="carousel.jsp"%>
		</c:if>
	</div>




</body>
</html>