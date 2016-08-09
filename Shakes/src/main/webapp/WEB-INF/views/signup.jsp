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
<div class="container">
  <h2>SIGNUP</h2>
<form:form action="signup" id="signup" method="post" commandName="userTable" autocomplete="on">

  
    <div class="form-group">
      <label for="email">Name</label>
      <form:input path="name" class="form-control" id="name" placeholder="Enter name"/>
    </div>
    
    <div class="form-group">
      <label for="email">UserID</label>
      <form:input path="userid" class="form-control" id="userid" placeholder="Enter userid"/>
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <form:password path="password" class="form-control" id="password" placeholder="Enter password"/>
    </div>
     <div class="form-group">
      <label for="email">Address</label>
      <form:input path="address" class="form-control" id="address" placeholder="Enter address"/>
    </div>
    <div class="form-group">
      <label for="email">Mobilenumber</label>
      <form:input path="mobilenumber" class="form-control" id="mobilenumber" placeholder="Enter mobilenumber"/>
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