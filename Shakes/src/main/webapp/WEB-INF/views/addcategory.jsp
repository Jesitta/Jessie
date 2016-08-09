<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category add</title>
</head>
<body>

<form:form action="category" method="post" commandName="categoryTable">
<h1>${success}</h1>
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>
				<td><form:input path="id" /></td>
			</tr>
			<tr>
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="description">
						<spring:message text="Description" />
					</form:label></td>
				<td><form:input path="description" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="<spring:message text="Add"/>"/></td>
				<td><input type="reset" value="<spring:message text="Reset"/>"/></td>
		</tr>
		<!--   <tr>
		<td colspan="2">
		<c:if test="${! empty category.name}">
		<input type="submit" value="<spring:message text="EditCategory"/>" />
		</c:if>
		<c:if test="${empty category.name}">
		<input type="reset" value="<spring:message text="AddCategory"/>" />
		</c:if></td>
		</tr> -->
		
		</table>
		</form:form>
		
		
		
		</table>
		
		
		
		
		
		
		
		
		
		
		</body>
		</html>
		