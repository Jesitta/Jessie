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

 
table, th , td ,tr {
  border: 2px solid grey;
  border-collapse: collapse;
  padding: 15px;
  
} 

</style>

</head>

<body>
<%@include file="Loginheader.jsp"%>
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
				<th width="100">ID</th>
				<th width="200">NAME</th>
				<th width="200">ADDRESS</th>
				<th width="100">EDIT</th>
				<th width="100">DELETE</th>
				</tr>
			</thead>
<tbody>
  <tr ng-repeat="supplier in list1 | filter:searchText">
    <td>{{ supplier.id }}</td>
    <td>{{ supplier.name }}</td>
    <td>{{ supplier.address }}</td>
    <td><a href="<c:url value= '/es{{supplier.id}}' />"> <button type="submit" class="btn btn-success">EDIT</button></a></td>
				

					<td><a  href="<c:url value= '/s{{supplier.id}}' />"> <button onclick="myFunction()" class="btn btn-danger">DELETE</button></a></td>
  </tr>
  </tbody>
</table>




<script>
function myFunction() {
	
 var x;
    if (confirm("Press a button!") == true) {
        x = "Item Deleted!";
    } else {
        x = "You pressed Cancel!";
    }
    document.getElementById("demo").innerHTML = x;
}
</script>
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