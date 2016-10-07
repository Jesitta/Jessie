<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="UTF-8">
<title>signuppage</title>


</head>
<style type="text/css">
body {
    background-image: url("resources/pictures/bgimage.jpg");
    
}
</style>
<body>
<%@include file="header.jsp"%>
	<div class="container">
	
	<div class=col-sm-6>
	<h3><b>SIGNUP</b></h3> 
		<form:form method="post"
			commandName="cakeUser">


			<div class="form-group ">
				<label for="name">Name</label><br>
				<form:input path="name" class="form-control" 
					 placeholder="Enter name"  />
					
					  <c:forEach
							items="${flowRequestContext.messageContext.getMessagesBySource('name')}"
							var="error">
							<div>
								<span style="color:red">${error.text}</span>
							</div>
						</c:forEach>
			</div>

			<div class="form-group">
				<label for="username">Username</label>
				<form:input path="username" class="form-control"
					title="Example:xxxxx124" pattern="^[a-zA-Z|0-9]+$"
					placeholder="Enter userid"  />
					
					  <c:forEach
							items="${flowRequestContext.messageContext.getMessagesBySource('username')}"
							var="error">
							<div>
								<span style="color:red">${error.text}</span>
							</div>
						</c:forEach>
			</div>
			<div class="form-group">
				<label for="email">Email</label>
				<form:input path="email" class="form-control" 
					title="Enter valid email" placeholder="Enter email"
					 />
					
					<c:forEach
							items="${flowRequestContext.messageContext.getMessagesBySource('email')}"
							var="error">
							<div>
								<span  style="color:red">${error.text}</span>
							</div>
						</c:forEach>
			</div>
			
			<div class="form-group">
				<label for="address">Address</label>
				<form:input path="address" class="form-control"
					placeholder="Enter address"  />
					
						<c:forEach
							items="${flowRequestContext.messageContext.getMessagesBySource('address')}"
							var="error">
							<div>
								<span style="color:red">${error.text}</span>
							</div>
						</c:forEach>
			</div>
			<div class="form-group">
				<label for="mobilenumber">Mobilenumber</label>
				<form:input path="mobilenumber" class="form-control"
					pattern="[7|8|9][0-9]{9}"
					title="Phone number should start with 7-9 and remaing 9 digit with 0-9"
					placeholder="Enter mobilenumber"  />
					
					<c:forEach
							items="${flowRequestContext.messageContext.getMessagesBySource('mobilenumber')}"
							var="error">
							<div>
								<span style="color:red">${error.text}</span>
							</div>
						</c:forEach>
			</div>
		<input type="submit" name="_eventId_submit"
							class="btn btn-success" value="SIGNUP" />

		</form:form>
	</div></div><br>
	<%@include file="footer.jsp"%>
	
</body>
</html>
