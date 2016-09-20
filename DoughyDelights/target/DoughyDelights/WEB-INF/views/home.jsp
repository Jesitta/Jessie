
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Home Page</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

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


	<sec:authorize access="hasRole('ROLE_USER')">
		<div class="col-md-offset-1">
		
		
			<h4>
				<b><i>Welcome ${loggedInUser}..!</i></b></h4>
				
			
		</div>

		<%@include file="carousel.jsp"%>


	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<%@include file="mainheader.jsp"%>
		<%@include file="admin.jsp"%>

	</sec:authorize>


	<%@include file="footer.jsp"%>
</body>
</html>