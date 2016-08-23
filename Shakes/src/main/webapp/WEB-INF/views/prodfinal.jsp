<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>View</title>
</head>
<body>
<%@include file="Loginheader.jsp"%>

<%--<div ng-app="myApp" ng-controller=proCtrl">
 <table>
<thead>
<tr>
<th>ID</th>
<th>NAME</th>
<th>DESCRIPTION</th>
<th>PRODUCT</th>
</tr>
</thead>
<tbody>
         
 <c:forEach items="${prodfinal}" var="product" >
 <tr >
			<td>${product.id}</td>
			<td>${product.name}</td>
			<td>${product.description}</td>
			<td>${product.price}</td>
			</tr>
			</c:forEach>
 
</tbody>
</table> --%>


<br><br><br>
<div class="container">

<c:forEach items="${prodfinal}" var="product" >
<div class="col-sm-4"> 
<div class="item">
             <img src="resources/images/${product.id}.jpg" width=300; heigt=300; class="img-responsive">
            </div>
            </div>
<div class="col-sm-6"> 
<br><br>
<b>PROID:</b>  ${product.id}<br><br>
<b>NAME:</b> ${product.name}<br><br>
<b>DESCRIPTION:</b>  ${product.description}<br><br>
<b>PRICE:  Rs.</b>${product.price}<br><br>
<button type="#" class="btn btn-primary">BUY NOW</button>
<button type="#" class="btn btn-primary">ADD TO CART</button>
</div>

</c:forEach>

</div>


  
 
<!-- </div>
<script>
var temp=${prodfinal};
var myapp = angular.module('myApp', []);
myapp.controller('proCtrl', function($scope) {
    $scope.list=temp;
   
});
</script> -->

  </body>
  </html>
  