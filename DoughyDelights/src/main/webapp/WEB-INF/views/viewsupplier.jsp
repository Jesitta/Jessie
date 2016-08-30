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

<title>ViewSupplier</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td,tr {
    padding: 8px;
    text-align:center;
    border-bottom: 1px solid LightCoral;
    border-collapse: collapse;
}


</style>

</head>

<body>
<%@include file="header.jsp"%>
<%@include file="mainheader.jsp"%>
<br>

 <div class="container">	
	
 <div align="left"><h4><b>${SupplierList}</b></h4></div>
	



 <br>
 
 		<div ng-app="myApp1" ng-controller="supCtrl">
 


<div align="center"><label>Search: <input ng-model="searchText"></label></div>
<br>
<table class="table">

 <thead> 
 <tr>
				<th style="width: 100; color: #C52D2F; text-align: center">SUP_ID</th>
				<th style="width: 200; color: #C52D2F; text-align: center">SUP_NAME</th>
				<th style="width: 200; color: #C52D2F; text-align: center">SUP_ADDRESS</th>
				<th style="width: 100; color: #C52D2F; text-align: center">EDIT</th>
				<th style="width: 100; color: #C52D2F; text-align: center">DELETE</th>
				</tr>
			</thead>
<tbody>
  <tr ng-repeat="supplier in list1 | filter:searchText">
    <td>SUP {{ supplier.id }}</td>
    <td>{{ supplier.name }}</td>
    <td>{{ supplier.address }}</td>
    <td><a href="<c:url value= '/admineditsupl{{supplier.id}}' />"> <button type="submit" class="btn btn-success">EDIT</button></a></td>
				

					<td><a  href="<c:url value= '/admindelsupl{{supplier.id}}' />" onclick="return confirm('Are you sure you want to Remove?')"> <button type="submit" class="btn btn-danger">DELETE</button></a></td>
 
  
  </tr>
  </tbody>
</table>

</div>

<script>
var temp1=${value1};
var myapp1 = angular.module('myApp1', []);
myapp1.controller('supCtrl', function($scope) {
    $scope.list1=temp1;
});
</script>

</div> 
</body>
</html>