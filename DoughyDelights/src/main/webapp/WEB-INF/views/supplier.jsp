<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Supplier</title>
</head>
<body>
 <%@include file="header.jsp"%>
<%@include file="mainheader.jsp"%>
<div class="container"> 
 <div class=col-sm-6>
	<h4><b>${editsupplier}</b></h4> 
		
<h4><b>${addsupplier}</b></h4>
	
<br>

<c:url var="actionadd" value="adminaddsupl" ></c:url>
<form:form action="${actionadd}" method="post"
		modelAttribute="cakeSupplier">
 <c:if test="${cakeSupplier.id > 0 }">
<div class="form-group">
				 <form:label path="id">
				<spring:message text="ID" />
					</form:label>
					<form:input path="id" readonly="true" class="form-control" /> 
				
			</div> 
      </c:if>
    <div class="form-group">
      <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name"  class="form-control" />
      <form:errors style="color:red" path="name"/>
    </div>
     <div class="form-group">
      <form:label path="address"><spring:message text="ADDRESS"/></form:label>
      <form:input path="address"  class="form-control" />
      <form:errors style="color:red" path="address"/>
      </div>
     
     
      <div>
				<c:if test="${cakeSupplier.id > 0 }">
			<button type="submit" class="btn btn-success">EDIT</button>
<button type="reset" class="btn btn-danger">RESET</button>
				</c:if>
<c:if test="${ cakeSupplier.id eq 0 }">
    <button type="submit" class="btn btn-success">ADD</button>
<button type="reset" class="btn btn-danger">RESET</button>
       </c:if>
    </div>
         </form:form>
    </div></div>
    <br><br><br><br><br><br><br><br>
	<%@include file="footer.jsp"%>
     
</body>
</html>