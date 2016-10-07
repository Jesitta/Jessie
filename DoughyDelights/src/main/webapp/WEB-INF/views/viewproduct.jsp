<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<html>
<head>


<title>ViewProduct</title>
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
<body><%@include file="header.jsp"%>
<%@include file="mainheader.jsp"%>


<br>
 <div class="container">

<div align="left"><h4><b>${ProductList}</b></h4></div>
	



 <br>
		<div ng-app="myApp" ng-controller="proCtrl">
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
						<th style="width: 40; color: #C52D2F; text-align: center ">PRO_ID</th>
						
						
						
						<th style="width: 160; color: #C52D2F; text-align: center"
						 ng-click="sortType = 'name'; sortReverse = !sortReverse">
						 PRO_NAME
						  <span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
                          <span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span>
                       </th>
                       
						<th style="width: 200; color: #C52D2F; text-align: center">PRO_DESCRIPTION</th>
						<th style="width: 100; color: #C52D2F; text-align: center"
						ng-click="sortType = 'price'; sortReverse = !sortReverse">
						PRO_PRICE
						<span ng-show="sortType == 'price' && !sortReverse" class="fa fa-caret-down"></span>
                          <span ng-show="sortType == 'price' && sortReverse" class="fa fa-caret-up"></span>
                          </th>
                          <th style="width: 40; color: #C52D2F; text-align: center">STOCK</th>
						<th style="width: 40; color: #C52D2F; text-align: center">CAT_ID</th>
						<th style="width: 100; color: #C52D2F; text-align: center">SUP_NAME</th>
						<th style="width: 60; color: #C52D2F; text-align: center">EDIT</th>
						<th style="width: 60; color: #C52D2F; text-align: center">DELETE</th>
					</tr>
				</thead>
<tbody>
  <tr ng-repeat="product in list |orderBy:sortType:sortReverse  | filter:searchText">
    <td>PRO {{ product.id }}</td>
    <td>{{ product.name }}</td>
    <td>{{ product.description }}</td>
    <td>Rs.{{ product.price }}</td>
    <td>{{ product.stock }}</td>
    <td>{{ product.cat.id}}</td>
    <td>{{ product.sup.name}}</td>
    <td><a href="<c:url value= '/admineditprod{{product.id}}' />"><button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></button></a></td>
				
    <td><a  href="<c:url value= '/admindelprod{{product.id}}' />"  onclick="return confirm('Are you sure you want to Remove?')"> <button type="submit" class="btn btn-danger"> <span class="glyphicon glyphicon-remove"></span></button></a></td>
  </tr>
  </tbody>
</table>

</div>

<script>
var temp=${value};
var myapp = angular.module('myApp', []);
myapp.controller('proCtrl', function($scope) {
    $scope.list=temp;
});

</script>

</div>  
	<%@include file="footer.jsp"%>





</body>
</html>