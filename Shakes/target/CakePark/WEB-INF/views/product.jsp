<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>


<div class="container">

  <h2>Add Product</h2>
  <form:form method="POST" action="file" enctype="multipart/form-data">
     <div class="form-group">
       <form:label path="id"><spring:message text="ID"/></form:label>
      <form:input path="id" class="form-control" required="true" placeholder="Enter id"/>
    </div>
    <div class="form-group">
      <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name" class="form-control" required="true" placeholder="Enter name"/>
    </div> 
     <div class="form-group">
     <form:label path="description"><spring:message text="DESCRIPTION"/></form:label>
      <form:input path="description" class="form-control" required="true" placeholder="Enter description"/>
      
    </div> 
    <div class="form-group">
     <form:label path="price"><spring:message text="PRICE"/></form:label>
      <form:input path="price" class="form-control" required="true" placeholder="Enter price"/>
       </div> 
       <div class="form-group">
     <form:label path="category"><spring:message text="CATEGORY"/></form:label>
      <form:select path="category.name" class="form-control" items="${categoryList}" itemValue="name" itemLabel="name" placeholder="Enter category"/>
      </div> 
    <div class="form-group">
     <form:label path="supplier"><spring:message text="SUPPLIER"/></form:label>
      <form:select path="supplier.name" class="form-control" items="${supplierList}" itemValue="name" itemLabel="name" placeholder="Enter supplier"/>
     </div>
     <div class="form-group">
         <form:label path="image"><spring:message text="IMAGE"/></form:label>
      <form:input type="file" path="image"> </form:input>
     </div>
    	 
    <button type="submit" class="btn btn-primary">Submit</button>
  </form:form>
</div>
</body>
</html>