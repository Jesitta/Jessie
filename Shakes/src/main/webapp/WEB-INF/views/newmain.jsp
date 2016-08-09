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
.carousel-fade .carousel-inner .item {
  opacity: 0;
  -webkit-transition-property: opacity;
  -moz-transition-property: opacity;
  -o-transition-property: opacity;
  transition-property: opacity;
}
.carousel-fade .carousel-inner .active {
  opacity: 1;
}
.carousel-fade .carousel-inner .active.left,
.carousel-fade .carousel-inner .active.right {
  left: 0;
  opacity: 0;
  z-index: 1;
}
.carousel-fade .carousel-inner .next.left,
.carousel-fade .carousel-inner .prev.right {
  opacity: 1;
}
.carousel-fade .carousel-control {
  z-index: 2;
}
</style>

<script type="text/javascript">
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 3000
    })
  });
</script>
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
<div class="container-fluid"  style=background-color:#FFFFE0>
     <div class="col-md-1 col-md-offset-1">
		<font face="Matura MT Script Capitals"
					style="color:MediumVioletRed "><h1><b>DoughyDelights</b></h1></font>
		</div>
		</div>
		<nav class="navbar">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">WeddingCake</a></li>
          <li><a href="#">BirthdayCake</a></li>
          <li><a href="#">Cupcake</a></li>
           <li><a href="#">PieceCake</a></li>
        </ul>
      </li>
      <li><a href="#">Home</a></li>
      <li><a href="#">AboutUs</a></li>
      <li><a href="admin">Admin</a></li>
    </ul>
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
