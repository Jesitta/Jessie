<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

  <link rel="stylesheet"
	href="resources/resource/css/bootstrap.min.css">

<link rel="stylesheet"
	href="resources/resource/css/font-awesome.min.css">
<script
	src="resources/resource/js/jquery.min.js"></script>


<script
	src="resources/resource/js/bootstrap.min.js"></script>
	 <script
	src="resources/resource/js/angular.min.js"></script> 
<title>Mainpage</title>
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

	<%@include file="header.jsp"%>

<div class="col-md-offset-1">
	
			<h4>
				<b><i>${msg}</i></b>
				
			</h4></div>

	<%@include file="carousel.jsp"%>

<%--  <%@include file="minicarousel.jsp"%>   --%>
	<%@include file="footer.jsp"%>
	


</body>
</html>