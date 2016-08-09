<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="UTF-8">
<title>signuppage</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
<%@include file="newmain.jsp" %>

<form:form action="signup" method="post" commandName="userTable">
	<table>
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
		</form:form>
</body>
</html>                                		