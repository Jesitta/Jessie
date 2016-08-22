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

<div ng-app="myApp" ng-controller="catCtrl">
 <div align="center"><label>Search:<input  ng-model="searchText"></label></div>
 <br>
<table class="table">

 
<tbody>
  <tr ng-repeat="pro in list | filter:searchText">
    
    <td>{{ pro.name }}</td>
    <td>{{ pro.description }}</td>
     <td>{{ pro.price }}</td>

				
	
  </tr>
  </tbody>
</table>

</div>
<script>
var temp=${prodfinal};
var myapp = angular.module('myApp', []);
myapp.controller('catCtrl', function($scope) {
    $scope.list=temp;
});
</script>

  </body>
  </html>
  