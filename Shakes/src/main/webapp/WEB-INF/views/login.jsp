<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
  <title>Loginpage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<h3>${errorMessage}</h3>
  <h2>LOGIN</h2>
  <form action="login" method="post" id="login">
     <div class="form-group">
      <label for="email">UserID</label>
      <input type="text" name="userid" class="form-control" id="userid" placeholder="Enter userid"/>
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" name="password" class="form-control" id="password" placeholder="Enter password"/>
    </div> 
    <div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>

