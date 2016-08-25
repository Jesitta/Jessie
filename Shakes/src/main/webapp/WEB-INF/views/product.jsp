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

<%@include file="Loginheader.jsp"%>
<%@include file="mainheader.jsp"%>
<div class="container">
 <div class=col-sm-6>
	<h4><b>${editproduct}</b></h4>
<h4><b>${addproduct}</b></h4>

 <br>
   <c:url var="addproduct" value="viewproductt"></c:url>
  <form:form action="${addproduct}" method="post"
			modelAttribute="cakeProduct" enctype="multipart/form-data"> 
			
			<c:if test="${cakeProduct.id > 0 }"> 
			
			
   <div class="form-group">
				<form:label path="id">
			<spring:message text="ID" />
				</form:label>
				<form:input path="id" readonly="true" class="form-control"/>
				</div> 
			
			</c:if>
 
     
    <div class="form-group">
      <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name" class="form-control"  placeholder="Enter name"/>
   <form:errors style="color:red" path="name" />
    </div> 
     <div class="form-group">
     
     <form:label path="description"><spring:message text="DESCRIPTION"/></form:label>
      <form:input path="description" class="form-control" placeholder="Enter description"/>
      <form:errors style="color:red" path="description" />
    </div> 
    <div class="form-group">
     <form:label path="price"><spring:message text="PRICE"/></form:label>
      <form:input path="price" class="form-control"  placeholder="Enter price"/>
       <form:errors style="color:red" path="price" />
       </div> 
     <div class="form-group">
     <form:label path="cat"><spring:message text="CATEGORY"/></form:label>
      <form:select path="cat.name"  class="form-control" items="${categoryList}" itemLabel="name" itemValue="name"  placeholder="Enter category"/>
      <form:errors style="color:red" path="cat.name"/>
     </div>  
       <%-- <div class="form-group">
     <form:label path="supplier"><spring:message text="SuPPLIER"/></form:label>
      <form:select path="supplier" items="${supplierList}" class="form-control"  placeholder="Enter supplier"/>
     
    <form:option value="{{supplier.name}}"></form:option>
     </div> --%>
     <div class="form-group">
				<form:label path="image" class="control-label">
					<spring:message text="IMAGE" />
				</form:label>
				<form:input type="file"  path="image" class="form-control"/>
				 <form:errors style="color:red" path="image"/>
    	 </div>
    <div class="form-group">

				 <c:if test="${cakeProduct.id > 0}">
					<td><button type="submit" class="btn btn-success">EDIT</button>
<button type="reset" class="btn btn-danger">RESET</button></td>
				</c:if>
				<c:if test="${cakeProduct.id eq 0 }">
					<td><button type="submit" class="btn btn-success">ADD</button>
<button type="reset" class="btn btn-danger">RESET</button></td>
				</c:if> 
			</div>
  </form:form>
</div></div>
</body>
</html>