<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">



<title>Verification</title>
	<%@include file="header.jsp"%>
<form:form action="submit">
<form:input path="password"/>

			<div class="form-group">
					<input type="submit" name="_eventId_submit" class="btn btn-success"
						value="SUBMIT" /> </div>
			

</form:form>
	<%@include file="footer.jsp"%>


</body>
</html>