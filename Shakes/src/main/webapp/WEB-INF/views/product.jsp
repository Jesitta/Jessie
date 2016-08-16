<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Product</title>
</head>
<body>


<div class="container">

	<h3>${editproduct}</h3>
<h3>${addproduct}</h3>

 
   <c:url var="addproduct" value="viewproductt"></c:url>
  <form:form action="${addproduct}" method="post"
			modelAttribute="productTable" enctype="multipart/form-data">
  
			<div class="form-group">
				<form:label path="id">
			<spring:message text="ID" />
				</form:label>
				<form:input path="id" readonly="true" class="form-control"/>
				</div>
				<%--  <c:choose>
					<c:when test="${!empty productTable.id }">
						<td><form:input path="id" disabled="true" readonly="true" /></td>
					</c:when>
					<c:otherwise>
						<td><form:input path="id" /></td>
					</c:otherwise>
				</c:choose> 
 --%>
			
 
     
    <div class="form-group">
      <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name" class="form-control"  placeholder="Enter name"/>
   <form:errors path="name" />
    </div> 
     <div class="form-group">
     <form:label path="description"><spring:message text="DESCRIPTION"/></form:label>
      <form:input path="description" class="form-control" placeholder="Enter description"/>
      <form:errors path="description" />
    </div> 
    <div class="form-group">
     <form:label path="price"><spring:message text="PRICE"/></form:label>
      <form:input path="price" class="form-control"  placeholder="Enter price"/>
       <form:errors path="price" />
       </div> 
     <%--   <div class="form-group">
     <form:label path="category"><spring:message text="CATEGORY"/></form:label>
      <form:select path="categoryTable.name" class="form-control" items="${categoryList}" itemValue="name" itemLabel="name" placeholder="Enter category"/>
    
      </div>  --%>
    <%-- <div class="form-group">
     <form:label path="supplier"><spring:message text="SUPPLIER"/></form:label>
      <form:select path="supplier.name" class="form-control" items="${supplierList}" itemValue="name" itemLabel="name" placeholder="Enter supplier"/>
    
     </div> --%>
     <div class="form-group">
				<form:label path="image" class="control-label">
					<spring:message text="IMAGE" />
				</form:label>
				<form:input type="file" path="image" class="form-control"/>
    	 </div>
    <div class="form-group">

				 <c:if test="${productTable.id > 0}">
					<td><input type="submit" value="EDIT" />
					 <input type="reset" value="RESET" /></td>
				</c:if>
				<c:if test="${productTable.id eq 0 }">
					<td><input type="submit" value="ADD" />
					 <input type="reset" value="RESET" /></td>
				</c:if> 
			</div>
  </form:form>
</div>
</body>
</html>