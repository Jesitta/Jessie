
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="UTF-8">
<title>ConfirmDetails</title>

</head>

<body>
	<%@include file="header.jsp"%>
	<div class="container">
	<br>
<div class=col-sm-3></div>
		<div class=col-sm-6>
			<h3>
				<b>CONFIRM YOUR DETAILS</b>
			</h3>
			<form:form   method="post"
				commandName="cakeUser">

				<div class="form-group ">
					<label for="name">Name</label><br>
					<form:input path="name" class="form-control"
						placeholder="Enter name" readonly="true"/>


				</div>

				<div class="form-group">
					<label for="username">Username</label>
					<form:input path="username" class="form-control"
						title="Example:xxxxx124" pattern="^[a-zA-Z|0-9]+$"
						placeholder="Enter userid" readonly="true" />

				</div>
				<div class="form-group">
					<label for="email">Email</label>
					<form:input path="email" class="form-control"
						placeholder="Enter email" readonly="true" />

				</div>
				
				
				<div class="form-group">
					<label for="mobilenumber">Mobilenumber</label>
					<form:input path="mobilenumber" class="form-control"
						pattern="[7|8|9][0-9]{9}"
						title="Phone number should start with 7-9 and remaing 9 digit with 0-9"
						placeholder="Enter mobilenumber" readonly="true" />

				</div> 
				<div class="form-group">
					<input type="submit" name="_eventId_submit" class="btn btn-success"
						value="CONFIRM DETAILS" /> <input type="submit" name="_eventId_edit"
						class="btn btn-danger" value="EDIT" />
				</div>

			</form:form>
		</div>
	</div>
	<br>
	<%@include file="footer.jsp"%>

</body>
</html>
