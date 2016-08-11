<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

</head>
<style type="text/css">
    .navbar {
        background-color:LightCoral;
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
    color:black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: None;
}

li a:hover:not(.active) {
    background-color:white;
}

</style>
<body>


<nav   class="navbar">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:#FFFFE0">Categories <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">WeddingCake</a></li>
          <li><a href="#">BirthdayCake</a></li>
          <li><a href="#">Cupcake</a></li>
           <li><a href="#">PieceCake</a></li>
        </ul>
      </li>
      <li><a href="#" style="color:#FFFFE0">Home</a></li>
      <li><a href="#"style="color:#FFFFE0">AboutUs</a></li>
      <li><a href="admin" style="color:#FFFFE0"style="color:MediumVioletRed">Admin</a></li>
    </ul>

</div>
</nav>

</body>
</html>