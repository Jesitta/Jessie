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
<div class="container">
<br>


 <div>	
		
<div align="left"><h4><b>${CategoryList}</b></h4></div>
	



 <br>
		<div ng-app="myApp" ng-controller="catCtrl">
 <div align="center"><label>Search:<input  ng-model="searchText"></label></div>
 <br>
<table class="table">

 <thead> 
 <tr>
				<th width="100">ID</th>
				<th width="200">NAME</th>
				<th width="200">DESCRIPTION</th>
			   <th width="100">EDIT</th>
				<th width="100">DELETE</th>
				</tr>
			</thead>
<tbody>
  <tr ng-repeat="category in list | filter:searchText">
    <td>{{ category.id }}</td>
    <td>{{ category.name }}</td>
    <td>{{ category.description }}</td>
    <td><a href="<c:url value= '/e{{category.id}}'/>"> <button type="submit" class="btn btn-success">EDIT</button></a></td>
				
	<td><a onclick="myFunction()" href="<c:url value= '/{{category.id}}'/>"><button type="submit" class="btn btn-danger">DELETE</button></a></td>
  </tr>
  </tbody>
</table>

</div>
<script>
function myFunction() {
	

	    var x;
	    if (confirm("Press a button!") == true) {
	        x = "You pressed OK!";
	    } else {
	        x = "You pressed Cancel!";
	    }
	    document.getElementById("demo").innerHTML = x;
	}
</script>
<script>
var temp=${value};
var myapp = angular.module('myApp', []);
myapp.controller('catCtrl', function($scope) {
    $scope.list=temp;
});
</script>
	
</div> 
<br>
</div>


</body>
</html>
