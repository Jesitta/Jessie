<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>


<title>View</title>
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

	<div class="container">

		<br>


		<div>

			<div align="left">
				<h4>
					<b>${CategoryList}</b>
				</h4>
			</div>




			<br>
			<div data-ng-app="myApp" data-ng-controller="catCtrl">
				<div class="col-sm-4"></div>
<div class="col-sm-4">
<div class="input-group">
   <input type="text"  ng-model="searchText" placeholder="Search"  class="form-control"/>
    <span class="input-group-addon">
        <i class="fa fa-search"></i>
    </span>
</div>
<br>

</div>
				<table class="table">

					<thead>
						<tr>
							<th style="width: 100; color: #C52D2F; text-align: center">CAT_ID</th>
							<th style="width: 200; color: #C52D2F; text-align: center"
							ng-click="sortType = 'name'; sortReverse = !sortReverse">
							CAT_NAME
							<span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
                          <span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span></th>
							<th style="width: 200; color: #C52D2F; text-align: center">CAT_DESCRIPTION</th>
							<th style="width: 100; color: #C52D2F; text-align: center">EDIT</th>
							<th style="width: 100; color: #C52D2F; text-align: center">DELETE</th>
						</tr>
					</thead>
					<tbody>
						<tr data-ng-repeat="category in list|orderBy:sortType:sortReverse | filter:searchText">
							<td>CAT {{ category.id }}</td>
							<td>{{ category.name }}</td>
							<td>{{ category.description }}</td>
							<td><a href="<c:url value= '/admincatedit{{category.id}}'/>">
									<button type="submit" class="btn btn-success"> <span class="glyphicon glyphicon-pencil"></span></button>
							</a></td>

							<td><a
								href="<c:url value= '/admincatdel{{category.id}}'/>"  onclick="return confirm('Are you sure you want to Remove?')"><button
										type="submit" class="btn btn-danger"> <span class="glyphicon glyphicon-remove"></span></button></a></td>
						</tr>
					</tbody>
				</table>

			</div>
			
			<script>
				var temp = ${value};
				var myapp = angular.module('myApp', []);
				myapp.controller('catCtrl', function($scope) {
					$scope.list = temp;
				});
			</script>

		</div>
		<br>

	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
