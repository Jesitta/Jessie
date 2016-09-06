<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>View</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td, tr {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid LightCoral;
}

.button1 {
	border-radius: 50%;
}

.button {
	background-color: floralwhite;
	font-size: 12px;
	border: none;
	color: #C52D2F;
	padding: 10px 14px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 1px 1px;
	cursor: pointer;
}

.blink {
  animation: blink-animation 1s steps(5, start) infinite;
  -webkit-animation: blink-animation 1s steps(5, start) infinite;
}
@keyframes blink-animation {
  to {
    visibility: hidden;
  }
}
@-webkit-keyframes blink-animation {
  to {
    visibility: hidden;
  }
}
</style>

</head>
<body>
	<%@include file="header.jsp"%>

	<div class="container">
		<br>
     <div>
      <div align="left">
				<h4>
					<b>${ViewProduct}</b>
				</h4>
			</div>




			<br>
			<div ng-app="myApp" ng-controller="catCtrl">
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
							<th style="width: 200; color: #C52D2F; text-align: center">CAKE</th>
							
							
							
							<th 
							style="width: 200; color: #C52D2F; text-align: center"
							ng-click="sortType = 'name'; sortReverse = !sortReverse">   
						    NAME
                     <span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
                     <span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span>  
                          </th>
                     
                     
                     
                     
       
							<th style="width: 200; color: #C52D2F; text-align: center">
							DESCRIPTION</th>
							
							
							
							<th style="width: 100; color: #C52D2F; text-align: center"
							ng-click="sortType = 'price'; sortReverse = !sortReverse">
							PRICE
							<span ng-show="sortType == 'price' && !sortReverse" class="fa fa-caret-down"></span>
                            <span ng-show="sortType == 'price' && sortReverse" class="fa fa-caret-up"></span>
                            </th>
                       
                       
							<th style="width: 100; color: #C52D2F; text-align: center">INFO</th>

						</tr>
					<thead>
					<tbody>
						<tr ng-repeat="prodct in list| orderBy:sortType:sortReverse | filter:searchText">
							<td><img src="resources/images/{{prodct.id}}.jpg" width=60px
								height=60px></td>
							<td>{{ prodct.name }}</td>
							<td>{{ prodct.description }}</td>
							<td>Rs.{{ prodct.price }}</td>
							<td><a href="proddesc?pdid={{prodct.id}}">
									<button class="button button1">
										<p class="blink">
											<b> TASTE ME.! </b> <i class="fa fa-smile-o"></i>
										</p>
									</button>
							</a></td>


						</tr>
					</tbody>

				</table>

			</div>
		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="footer.jsp"%>

	<script>
		var temp = ${prodlist};
		var myapp = angular.module('myApp', []);
		myapp.controller('catCtrl', function($scope) {
			$scope.list = temp;
		});
	</script>



</body>
</html>
