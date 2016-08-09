<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
  <title>Categoryadd</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<c:url var="actionadd" value="/add"></c:url>

<form:form action="${actionadd}" method="post" commandName="categoryTable">

<div class="container">
  <h3>Add Categories...</h3>
  <form role="form">
    <div class="form-group">
    
      <label for="id">Category ID</label>
      <input type="text" class="form-control" class="col-sm-5" name="categoryid" >
    </div>
    <div class="form-group">
      <label for="name">Category Name</label>
      <input type="text" class="form-control" class="col-sm-5" name="categoryname" >
    </div>
     <div class="form-group">
      <label for="description">Category Description</label>
      <input type="text" class="form-control" class="col-sm-5" name="categorydescription" >
    </div>
   
   
    <button type="submit" class="btn btn-primary">Add</button>
     <button type="reset" class="btn btn-primary">Reset</button>
  </form>
  <tr>
		<td colspan="2">
		<c:if test="${! empty category.name}">
		<input type="submit" value="<spring:message text="EditCategory"/>" />
		</c:if>
		<c:if test="${empty category.name}">
		<input type="reset" value="<spring:message text="AddCategory"/>" />
		</c:if></td>
		</tr>
</div>
</form:form>
</body>
</html>
