<!DOCTYPE html>
<html >
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <link rel="stylesheet" href="resources/main/css/normalize.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto+Slab'>

        <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  height: 100%;
   background-color: #F15A5C;
  font-family: "Roboto Slab", serif;
  color: white;
}

.preload * {
  transition: none !important;
  
}

label {
  display: block;
  font-weight: bold;
  font-size: small;
  color:white;
  text-transform: uppercase;
  font-size: 0.9em;
  margin-bottom: 0.35em;
  text-align: left;
}

input[type="text"], input[type="password"] {
  width: 100%;
  border: none;
  padding: 0.5em;
  border-radius: 2px;
  margin-bottom: 0.5em;
  color: #333;
}
input[type="text"]:focus, input[type="password"]:focus {
  outline: none;
  box-shadow: inset -1px -1px 3px rgba(0, 0, 0, 0.3);
}

button {
  padding-left: 1.5em;
  padding-right: 1.5em;
  padding-bottom: 0.5em;
  padding-top: 0.5em;
  border: none;
  border-radius: 2px;
  background-color: #7E5AF1;
  /* text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25); */
  color: white;
 /*  box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.45); */
}

small {
  font-size: 1em;
  color:white;
}

.login--login-submit {
  float: right;
}

.login--container {
  width: 600px;
  background-color: #F15A5C;
  margin: 0 auto;
  position: relative;
  top: 10%;
 
}

.login--toggle-container {
  position: absolute;
  background-color: #F15A5C;
  right: 0;
  line-height: 2.5em;
  width: 50%;
  height: 320px;
  color:white;
  text-align: center;
  cursor: pointer;
  transform: perspective(1000px) translateZ(1px);
  transform-origin: 0% 0%;
  transition: all 1s cubic-bezier(0.06, 0.63, 0, 1);
  backface-visibility: hidden;
}
.login--toggle-container .js-toggle-login {
  font-size: 4em;
  color:white;
  text-decoration: underline;
}
.login--active .login--toggle-container {
  transform: perspective(1000px) rotateY(180deg);
  background-color: #bc1012;
}

.login--username-container, .login--password-container {
  float: left;
  background-color: #F15A5C;
  width: 50%;
  height: 320px;
  padding: 0.5em;

}

.login--username-container {
  transform-origin: 100% 0%;
  transform: perspective(1000px) rotateY(180deg);
  transition: all 1s cubic-bezier(0.06, 0.63, 0, 1);
  background-color: #bc1012;
  backface-visibility: hidden;
}
.login--active .login--username-container {
  transform: perspective(1000px) rotateY(0deg);
  background-color: #F15A5C;
}

footer {
  position: absolute;
  bottom: 12px;
  left: 20px;
}

    </style>

    
        <script src="resources/main/js/prefixfree.min.js"></script>

    
  </head>

  <body style="  background-color: #F15A5C;">
<%@include file="header.jsp"%>
    <div class='preload login--container'>
    
  <div class='login--form'>
  
		 <c:url var="actionlogin" value="/springlogin"></c:url>
			<form action="${actionlogin}" method="post">
    <div class='login--username-container'>
  
    <br><br>
      <label>Username</label>
      <input name='username' placeholder='Username' type='text'>
    </div>
    <div class='login--password-container'>
    <br><br><br><br><br><br>
      <label>Password</label>
      <input name='password' placeholder='Password' type='password'>
      <br><br>
      
      <button class='button' type='submit' style="color: white" ><b>Login</b></button>
     
    </div>
    
				  <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }"> --%>
    </form>
  </div>
 
  <div class='login--toggle-container'>
     <h4 style="color: white">${logincart}</h4> 
		 <h4 style="color: white">${errorMessage}</h4>
  <br><br>
    <small>Hey you, </small>
    <div class='js-toggle-login'>Login </div>
    <!-- <small>already<span></span></small> -->
  </div>
</div>

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="resources/main/js/index.js"></script>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@include file="footer.jsp"%>
    
    
    
  </body>
</html>
