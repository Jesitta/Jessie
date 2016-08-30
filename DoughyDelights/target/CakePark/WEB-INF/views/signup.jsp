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
<body>

	<div class="container">
		<h2>SIGNUP</h2>
		<form:form action="signup" id="signup" method="post"
			commandName="userTable">


			<div class="form-group">
				<label for="email">Name</label>
				<form:input path="name" class="form-control" title="Example:xxxxx"
					pattern="^[a-zA-Z]+$" placeholder="Enter name" required="true" />
			</div>

			<div class="form-group">
				<label for="userid">UserID</label>
				<form:input path="userid" class="form-control"
					title="Example:xxxxx124" pattern="^[a-zA-Z|0-9]+$"
					placeholder="Enter userid" required="true" />
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<form:password path="password" class="form-control" pattern=".{5,}"
					title="Five or more characters" placeholder="Enter password"
					required="true" />
			</div>
			<div class="form-group">
				<label for="address">Address</label>
				<form:input path="address" class="form-control"
					placeholder="Enter address" required="true" />
			</div>
			<div class="form-group">
				<label for="mobilenumber">Mobilenumber</label>
				<form:input path="mobilenumber" class="form-control"
					pattern="[7|8|9][0-9]{9}"
					title="Phone number should start with 7-9 and remaing 9 digit with 0-9"
					placeholder="Enter mobilenumber" required="true" />
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>

		</form:form>
	</div>

	<%-- <table>
			<tr>
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="address">
						<spring:message text="Address" />
					</form:label></td>
				<td><form:input path="address" /></td>
			</tr>
			<tr>
				<td><form:label path="mobilenumber">
						<spring:message text="MobileNumber" />
					</form:label></td>
				<td><form:input path="mobilenumber" /></td>
			</tr>
			<tr>
				<td><form:label path="userid">
						<spring:message text="UserID" />
					</form:label></td>
				<td><form:input path="userid" /></td>
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>
				<td><form:input path="password" /></td>
			</tr>
			 <tr>
				<td><input type="submit" value="<spring:message text="SIGNUP"/>"/></td>
				
		</tr> 
		</table>
		</form:form> --%>
</body>
</html>
