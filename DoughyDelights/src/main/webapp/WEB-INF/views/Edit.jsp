<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>EditCategory</title>
</head>
<body>
<%@include file="adminnavbar.jsp"%>
<div class=container>
<h3>${editcategory}</h3>
<form:form action="error" method="post" modelAttribute="categoryTable">

 <br>
 <div class="form-group">
   <form:label path="id"><spring:message text="ID"/></form:label>
   
  <form:input path="id" disabled="true" readonly="true" class="form-control" />

 </div>
      
    <div class="form-group">
       <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name"  class="form-control" />
    </div>
     <div class="form-group">
     <form:label path="description"><spring:message text="DESCRIPTION"/></form:label>
      <form:input path="description"  class="form-control" />
      </div>

 <div>
 <c:if test="${!empty categoryTable.name }">
     <button type="submit" class="btn btn-primary">EDIT</button>
     <button type="reset" class="btn btn-primary">RESET</button></c:if>
     </div>
     </form:form>
</div>
</body>
</html>