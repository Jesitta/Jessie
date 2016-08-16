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
<title>Supplier</title>
</head>
<body>
 <%@include file="adminnavbar.jsp"%>
<div class="container"> 
		<h3>${editsupplier}</h3>
<h3>${addsupplier}</h3>


<c:url var="actionadd" value="supplierview" ></c:url>
<form:form action="${actionadd}" method="post"
		modelAttribute="supplierTable">
 
<div class="form-group">
				 <form:label path="id">
				<spring:message text="ID" />
					</form:label>
					<form:input path="id" readonly="true" class="form-control" /> 
				
			</div>
      
    <div class="form-group">
      <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name"  class="form-control" />
      <form:errors path="name"/>
    </div>
     <div class="form-group">
      <form:label path="address"><spring:message text="ADDRESS"/></form:label>
      <form:input path="address"  class="form-control" />
      <form:errors path="address"/>
      </div>
     
     
      <div>
				<c:if test="${supplierTable.id > 0 }">
				<input type="submit" value="EDIT" />
				 <input type="reset" value="RESET" />
				</c:if>
<c:if test="${ supplierTable.id eq 0 }">
     <input type="submit" value="ADD" />
      <input type="reset" value="RESET" />
       </c:if>
    </div>
         </form:form>
    </div>
     
</body>
</html>