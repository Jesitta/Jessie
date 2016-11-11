<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/resource/css/bootstrap.min.css">

<link rel="stylesheet"
	href="resources/resource/css/font-awesome.min.css">
<script src="resources/resource/js/jquery.min.js"></script>
<link rel="stylesheet" href="resources/resource/css/style1.css">
<script src="resources/resource/js/bootstrap.min.js"></script>
<script src="resources/resource/js/angular.min.js"></script>
<script src="resources/resource/js/common.js"></script>
<script src="resources/resource/js/jquery.magnific-popup.min.js"></script>
<link rel="stylesheet"
	href="resources/resource/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/resource/css/stylesheet.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">




.navbar-fixed-top .nav {
    padding: 15px 0;
}

.navbar-fixed-top .navbar-brand {
    padding: 0 15px;
}

@media(min-width:768px) {
    body {
        padding-top: 100px; /* Required padding for .navbar-fixed-top. Change if height of navigation changes. */
    }

   .navbar-fixed-top .navbar-brand {
        padding: 15px 0;
    }
}
.navbar-custom {
    color: #EB2F4C ;
    background-color:Crimson ;
}


</style>
</head>
<body>

<header class="main__header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<!-- Brand and toggle get grouped for better mobile display -->
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="navbar-header">
					<h1 class="navbar-brand">
						<a href="index.html"> <img src="resources/pictures/logzz.png"
							alt=""></a>
					</h1>
					<a href="#" onClick="javascript.void()" class="submenu">Menus</a>
				</div>
				<div class="menuBar">
					<ul class="menu">
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<!-- <ul class="nav navbar-nav">
 -->
							<li><a class="dropdown-toggle" data-toggle="dropdown"
								> <span class="glyphicon glyphicon-user"></span>
									${pageContext.request.userPrincipal.name} <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="reset">Reset Password</a></li>
								</ul> <li class="active"><a href="home">Home</a></li>
						
					</c:if>
				


					

					<c:if test="${pageContext.request.userPrincipal.name == null}">

						<li class="active"><a href="./"> Home</a></li>
											<li class="dropdown"><a href="#">CATEGORY <i class="fa fa-angle-down"></i></a>
          
  <ul>
              
              <c:forEach items="${categoryList}" var="category">
						<li><a href="productlist?catname=${category.name }"><b>${category.name }</b></a></li>
					</c:forEach></ul>
						<li><a href="about">AboutUs</a></li>
						<li><a href="goologin"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a href="registration.obj"><span
									class="glyphicon glyphicon-user"></span> SignUp</a></li>
									>		
					

					</c:if>



			<c:if test="${pageContext.request.userPrincipal.name != null}">


						<security:authorize access="hasRole('ROLE_USER')">
						
											<li class="dropdown"><a href="#">CATEGORY <i class="fa fa-angle-down"></i></a>
          
  <ul>
              
              <c:forEach items="${categoryList}" var="category">
						<li><a href="productlist?catname=${category.name }"><b>${category.name }</b></a></li>
					</c:forEach></ul>
<li><a href="about">AboutUs</a></li>
							<li><a href="viewcartt"><span
										class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartSize})</a></li>
									
						</security:authorize>
								<security:authorize access="hasRole('ROLE_ADMIN')">
						<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown">Category <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="admincategory">AddCategory</a></li>
					<li><a href="adminviewcat">ViewCategory</a></li>

				</ul>
			
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown">Supplier <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminsupplier">AddSupplier</a></li>
					<li><a href="adminviewsupl">ViewSupplier</a></li>

				</ul>
			
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" >Product <span
										class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminproduct">AddProduct</a></li>
					<li><a href="adminviewprod">ViewProduct</a></li>

				</ul>
					
								
							</security:authorize>

						<li><a href="goologin?logout"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</c:if>
        </ul>
      </div>
      <!-- /.navbar-collapse --> 
    </nav>
  </div>
</header>
 
</body>
</html>