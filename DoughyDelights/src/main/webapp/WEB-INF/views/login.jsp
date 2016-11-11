<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Loginpage</title>
<meta charset="utf-8">

</head>

<body>
	

	<%@include file="header.jsp"%>
	<br>
<br>
	<div class="container">
	

<div class=col-sm-3></div>

<div class=col-sm-6>

			 <h4 style="color: red ">${logincart}</h4> 
		 <h4 style="color: red">${errorMessage}</h4> 
		 <br>
			<h3>
				<b>LOGIN</b>
			</h3>
			<c:url var="actionlogin" value="/springlogin"></c:url>
			<form action="${actionlogin}" method="post">
				<div class="form-group">
					<label for="name">Username</label> <input type="text"
						name="username" class="form-control" id="username"
						placeholder="Enter username" />
				</div>
				<div class="form-group">
					<label for="pwd">Password</label> <input type="password"
						name="password" class="form-control" id="password"
						placeholder="Enter password" />
				</div>
				<div>
				<button type="submit" class="btn btn-success">Submit</button>
			</div>

				  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
			</form>
		</div>
			

	
	</div>
<br><br>
	
	<%@include file="footer.jsp"%>
</body>
</html>

