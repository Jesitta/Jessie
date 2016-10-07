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
<form:form action="resetpwd" modelAttribute="cakeUser" method="post">


<br><br><br>
NEW PASSWORD<br>
	<div class=col-sm-4>
<form:input path="password" class="form-control"/>
<br>
</div>
<button type="submit" class="btn btn-primary">SUBMIT</button>
</form:form>

</div>

<%-- <%@include file="footer.jsp"%> --%>
</body>
</html>