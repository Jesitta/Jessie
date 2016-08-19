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
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Category add</title>

</head>

<body>
 <%-- <%@include file="adminnavbar.jsp"%>
<div ng-app="myApp" ng-controller="catController">
<div class="container">
 <form action="vieww" method="post" >
  <div class="form-group">
ID <input type="text" readonly="true" class="form-control" ng-model="id"><br>
NAME<input type="text" class="form-control" ng-model="name"><br>
DESCRIPTION <input type="text" class="form-control" ng-model="description"><br>
 <div>
				<c:if test="${!empty cakeCategory.name }">
				<input type="submit" value="EDIT" />
				</c:if>
<c:if test="${empty cakeCategory.name }">
     <input type="submit" value="ADD" />
       </c:if>
    </div>
</div>
</form>
</div>
</div>
<script>
var app = angular.module('myApp', []);
app.controller('catController', function($scope) {
    $scope.id='' ;
    $scope.name='' ;
    $scope.description= '';
});

</script>
	</body>
		</html>
		 --%>
 
 

<%@include file="Loginheader.jsp"%>

 <%@include file="mainheader.jsp"%>
 <div class="container">
		<h3>${editcategory}</h3>
<h3>${addcategory}</h3>


<c:url var="actionadd" value="vieww"></c:url>




	<form:form action="${actionadd}" method="post"
		modelAttribute="cakeCategory">
 
 <div class="form-group">
				 <form:label path="id">
				<spring:message text="ID" />
					</form:label>
					<form:input path="id"  readonly="true" class="form-control" /> 
				
			</div> 
      
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
				<input type="submit" value="EDIT" />
				<input type="reset" value="RESET" />
				</c:if>
<c:if test="${cakeCategory.id eq 0 }">
     <input type="submit" value="ADD" />
     <input type="reset" value="RESET" />
     
       </c:if>
    </div> 
         </form:form>
    </div>
     
		
		</body>
		</html>
		 