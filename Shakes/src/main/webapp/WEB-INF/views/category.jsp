<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Category add</title>
<!-- <style>

table{
border-collapse: collapse;
}
table, tr,th,td {

border: 1px solid black;
}
table
{
padding-left: 40%
}
</style> -->
</head>

<body>
<%@include file="adminnavbar.jsp"%>


 
<div class="container"> 
		<h3>${editcategory}</h3>
<h3>${addcategory}</h3>
<h1>${success}</h1>
<form:form action="view" method="post" modelAttribute="categoryTable">

 
      
    <div class="form-group">
      <label for="name">NAME</label>
      <form:input path="name"  class="form-control" />
    </div>
     <div class="form-group">
      <label for="description">DESCRIPTION</label>
      <form:input path="description"  class="form-control" />
      </div>

  
      <button type="submit" class="btn btn-primary">ADD</button>
       <button type="reset" class="btn btn-primary">RESET</button>
        

         </form:form>
    </div>
     
		
		</body>
		</html>
		