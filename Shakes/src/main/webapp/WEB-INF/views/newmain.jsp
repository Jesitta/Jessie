<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
  <title>MainPage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  


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
</head>


<body>
<%-- <nav class="navbar">

<div class="container-fluid"  style=background-color:#FFFFE0>
     <div class="col-md-1 col-md-offset-1">
		<font face="Matura MT Script Capitals"
					style="color:MediumVioletRed "><h1><b>DoughyDelights</b></h1></font>
					<ul class="nav navbar-nav navbar-right">
					<c:choose>
<c:when test="${empty loggedInUser}">


<li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
  <li><a href="signup"><span class="glyphicon glyphicon-user"></span> SignUp</a></li>
  

  </c:when>  

 <c:when test="${not empty loggedInUser}">
      
      <li><a href="logout"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
 

      </c:when>
      </c:choose> 
</ul>					

		</div>
		</div>
		</nav> --%>
		
		<%-- <nav class="navbar">
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
      
      <li><a href="logout"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
 

      </c:when>
      </c:choose> 
    </ul>
</div>
</nav>
		
 --%>		
		<nav class="navbar">
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

<%-- <c:choose>

       <c:when test="${isAdmin==true }">
<%@include file="admin.jsp" %>
</c:when>
      
      <c:when test="${isAdmin==false }">
<%@include file="home.jsp" %>
</c:when>
 <c:when test="${invalidCredentials==true }">
${errorMessage }
<%@include file="login.jsp" %>
</c:when>
 
<h1>${regsuccess}</h1>
<h1>${loginsuccess}</h1>
<h1>${logout}</h1>
<h4>${errorMessage}</h4>
<h4>${adminsuccess}</h4>


 </c:choose> --%>
 
 <%-- <h1>${regsuccess}</h1>
<h1>${loginsuccess}</h1>
<h1>${logout}</h1>
<h4>${errorMessage}</h4>
<h4>${adminsuccess}</h4>
  --%>

</body>
</html>
