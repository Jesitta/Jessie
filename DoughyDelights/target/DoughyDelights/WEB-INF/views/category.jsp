<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
  
 
<title>Category add</title>

</head>

<body>
 
 
  <%@include file="header.jsp"%>
  
  



 <div class="container">
 <br><br>
 <div class=col-sm-6>
	<h4><b>${editcategory}</b></h4> 
		
<h4><b>${addcategory}</b></h4>


<c:url var="actionadd" value="/adminaddcat"></c:url>

<form:form action="${actionadd}" method="post"
		modelAttribute="cakeCategory">
		
		
		
  <c:if test="${cakeCategory.id > 0 }"> <div class="form-group">
				 <form:label path="id">
				<spring:message text="ID" />
					</form:label>
					<form:input path="id"  readonly="true" class="form-control" /> 
				
			</div> </c:if>
     
    <div class="form-group">
      <form:label path="name"><spring:message text="NAME"/></form:label>
      <form:input path="name"  class="form-control" />
 <form:errors style="color:red" path="name"/>
    </div>
     <div class="form-group">
      <form:label path="description"><spring:message text="DESCRIPTION"/></form:label>
      <form:input path="description"  class="form-control" />
         <form:errors style="color:red" path="description"/>
      </div>
       <div>
				<c:if test="${cakeCategory.id > 0 }">
			<button type="submit" class="btn btn-success">EDIT</button>
<button type="reset" class="btn btn-danger">RESET</button>
				</c:if>
<c:if test="${cakeCategory.id eq 0 }">
<button type="submit" class="btn btn-success">ADD</button>
<button type="reset" class="btn btn-danger">RESET</button>
   <!--   <input type="submit" value="ADD" />
     <input type="reset" value="RESET" /> -->
     
       </c:if>
    </div> 
         </form:form>
    </div>
     
		</div>
		<br><br><br><br><br><br><br><br><br>
	<%@include file="footer.jsp"%>
		</body>
		</html>
		 