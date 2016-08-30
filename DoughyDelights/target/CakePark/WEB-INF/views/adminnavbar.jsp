<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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


<title>nav</title>
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
<div>
<nav class="navbar ">
  <div class="container-fluid"style=background-color:#FFFFE0>
    <ul class="nav navbar-nav navbar-left">
    
     
      <font face="Matura MT Script Capitals" style="color:MediumVioletRed "><h2><b>DoughyDelights</b></h2></font>
					</ul>
<ul class="nav navbar-nav navbar-right">
<c:choose>
<c:when test="${empty loggedInUser}">


<li><a href="login" style="color:MediumVioletRed"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
  <li><a href="signup" style="color:MediumVioletRed"><span class="glyphicon glyphicon-user"></span> SignUp</a></li>
  

  </c:when>  

 <c:when test="${not empty loggedInUser}">
      
      <li><a href="logout"style="color:MediumVioletRed"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
 

      </c:when>
      </c:choose> 
    </ul>
</div>
</nav>
</div>
</body>
</html>