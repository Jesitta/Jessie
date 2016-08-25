<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="UTF-8">
<title>signuppage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<style type="text/css">
body {
    background-image: url("resources/images/bgimage.jpg");
    
}
</style>
<body>
<%@include file="Loginheader.jsp"%>
	<div class="container">
	
	<div class=col-sm-6>
	<h3><b>SIGNUP</b></h3> 
		<form:form action="signup" id="signup" method="post"
			commandName="cakeUser">


			<div class="form-group ">
				<label for="name">Name</label><br>
				<form:input path="name" class="form-control" 
					 placeholder="Enter name"  />
					 <form:errors style="color:red" path="name"/>
			</div>

			<div class="form-group">
				<label for="username">UserName</label>
				<form:input path="username" class="form-control"
					title="Example:xxxxx124" pattern="^[a-zA-Z|0-9]+$"
					placeholder="Enter userid" required="true" />
					 <form:errors style="color:red" path="username"/>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<form:password path="password" class="form-control" pattern=".{5,}"
					title="Five or more characters" placeholder="Enter password"
					required="true" />
					<form:errors style="color:red" path="password"/>
			</div>
			<div class="form-group">
				<label for="address">Address</label>
				<form:input path="address" class="form-control"
					placeholder="Enter address" required="true" />
					<form:errors style="color:red" path="address"/>
			</div>
			<div class="form-group">
				<label for="mobilenumber">Mobilenumber</label>
				<form:input path="mobilenumber" class="form-control"
					pattern="[7|8|9][0-9]{9}"
					title="Phone number should start with 7-9 and remaing 9 digit with 0-9"
					placeholder="Enter mobilenumber" required="true" />
					<form:errors style="color:red" path="mobilenumber"/>
			</div>
			<button type="submit" class="btn btn-success">Submit</button>

		</form:form>
	</div></div><br>
	<%@include file="footer.jsp"%>
	
</body>
</html>
