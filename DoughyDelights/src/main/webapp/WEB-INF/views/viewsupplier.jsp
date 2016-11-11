<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<html>
<head>

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


 <div class="container">	
	
 <div align="left"><h4><b>${SupplierList}</b></h4></div>
	



 <br>
 
 		<div ng-app="myApp1" ng-controller="supCtrl">
 


<!-- <label>Search: <input ng-model="searchText"></label></div> -->
<div class="col-sm-4"></div>
<div class="col-sm-4">
<div class="input-group">
   <input type="text"  ng-model="searchText" placeholder="Search"  class="form-control"/>
    <div class="input-group-addon input-sm">
      <span class="glyphicon glyphicon-search"></span>
    </div>
</div>
<br>

</div>
<table class="table">

 <thead> 
 <tr>
				<th style="width: 100; color: #C52D2F; text-align: center">SUP_ID</th>
				<th style="width: 200; color: #C52D2F; text-align: center"
				ng-click="sortType = 'name'; sortReverse = !sortReverse">
				 SUP_NAME
				<span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
                          <span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span>
                         </th>
				<th style="width: 200; color: #C52D2F; text-align: center">SUP_ADDRESS</th>
				<th style="width: 100; color: #C52D2F; text-align: center">EDIT</th>
				<th style="width: 100; color: #C52D2F; text-align: center">DELETE</th>
				</tr>
			</thead>
<tbody>
  <tr ng-repeat="supplier in list1 |orderBy:sortType:sortReverse  | filter:searchText">
    <td>SUP {{ supplier.id }}</td>
    <td>{{ supplier.name }}</td>
    <td>{{ supplier.address }}</td>
    <td><a href="<c:url value= '/admineditsupl{{supplier.id}}' />"> <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></button></a></td>
				

					<td><a  href="<c:url value= '/admindelsupl{{supplier.id}}' />" onclick="return confirm('Are you sure you want to Remove?')"> <button type="submit" class="btn btn-danger"> <span class="glyphicon glyphicon-remove"></span></button></a></td>
 
  
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

</div> <br><br><br><br>
	<%@include file="footer.jsp"%>
	
	
</body>
</html>