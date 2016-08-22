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
<style type="text/css">

</style>
</head>

 <body> <!-- style="background-image:url(https://s3.amazonaws.com/Syntaxxx/background-gold-bokeh.jpg);" -->

<%@include file="Loginheader.jsp"%>
<br><br>
<div class="container">

<h3>${errorMessage}</h3>
  <h2>LOGIN</h2>
   <c:url var="actionlogin" value="/login"></c:url>
  <form action="${actionlogin}" method="post" >
     <div class="form-group">
      <label for="name">UserName</label>
      <input type="text" name="username" class="form-control" id="username" placeholder="Enter userid"/>
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" name="password" class="form-control" id="password" placeholder="Enter password"/>
    </div> 
    
    <button type="submit" class="btn btn-primary">Submit</button>
   <%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> --%>
  </form>
</div>

</body>
</html>

