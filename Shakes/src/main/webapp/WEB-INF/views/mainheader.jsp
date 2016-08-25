<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<style type="text/css">
body {
    background-image: url("resources/images/bgimage.jpg");
    
}
    .navbar {
        background-color: LightCoral;
        background-image: none;
       
	width:100%;
       }
       .navbar-brand{
       color:NavajoWhite;
	
	padding: 14px 16px;

	text-decoration: None;
       }
     li a {
	color: NavajoWhite;

	padding: 14px 16px;
	text-decoration: None;
}

</style>
<body>

<div class="container">
<nav class="navbar">
 
    <ul class="nav navbar-nav">
     
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="category">AddCategory</a></li>
          <li><a href="viewcat">ViewCategory</a></li>
          
        </ul>
         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Supplier <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="supplierr">AddSupplier</a></li>
          <li><a href="viewsup">ViewSupplier</a></li>
          
        </ul>
         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Product <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="productt">AddProduct</a></li>
          <li><a href="viewpro">ViewProduct</a></li>
          
        </ul>
      
    </ul>

</nav>
</div>
  

 

</body>
</html>