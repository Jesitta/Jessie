<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
</head>
<style type="text/css">
body {
	background-image: url("resources/pictures/bgimage.jpg");
	padding-top: 0px;
	margin-top: 0px;
}

.navbar {
	background-color: LightCoral;
	background-image: none;
	width: 100%;
}

.navbar-brand {
	color: NavajoWhite;
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
				data-toggle="dropdown">Product <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminproduct">AddProduct</a></li>
					<li><a href="adminviewprod">ViewProduct</a></li>

				</ul>
					<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown">Orders <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminvieworder">Order</a></li>
					<li><a href="">User Order</a></li>

				</ul>
		</ul>

		</nav>
	</div>




</body>
</html>