<!DOCTYPE html>
<html lang="en">
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
      <li><a href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="signup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    </ul>
  </div>
</nav>
</body>
</html>
