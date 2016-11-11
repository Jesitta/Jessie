<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
<div class=col-sm-4>
<form:form action="resetpwd" modelAttribute="cakeUser" method="post">


<br><br><br>

		<div class="form-group">
	<label for="pwd"><h4>NEW PASSWORD</h4></label>
<form:password path="password" class="form-control"/>
</div>
<div>
<button type="submit" class="btn btn-primary">SUBMIT</button>
</div>
</form:form>

</div>
</div>
 <%@include file="footer.jsp"%> 
</body>
</html>