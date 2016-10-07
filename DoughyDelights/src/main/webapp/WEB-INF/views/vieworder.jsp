<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
</head>

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


<body>
	<%@include file="header.jsp"%>

	<%@include file="mainheader.jsp"%>

	<div class="container">

		<br>


		<div>

			<div align="left">
				<h4>
					<b>${OrderList}</b>
				</h4>
			</div>




			<br>
			<div data-ng-app="myApp" data-ng-controller="orderCtrl">
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
							<th style="width:80; color: #C52D2F; text-align: center">ORDER_DATE</th>
							<th style="width:100; color: #C52D2F; text-align: center">USER_NAME</th>
							<th style="width: 200; color: #C52D2F; text-align: center">ADDRESS</th>
							<th style="width: 100; color: #C52D2F; text-align: center">MOBILENUMBER</th>
							<th style="width: 100; color: #C52D2F; text-align: center">PRODUCT NAME</th>
								<th style="width: 40; color: #C52D2F; text-align: center">QUANTITY</th>
							<th style="width: 100; color: #C52D2F; text-align: center">TOTAL</th>
							<th style="width: 100; color: #C52D2F; text-align: center">ORDER_TIME</th>
						</tr>
					</thead>
					<tbody>
						<tr data-ng-repeat="order in list| filter:searchText">
							<td> {{ order.date }}</td>
							
							<td>{{order.user.username}}</td>
							<td> {{ order.address.doornumber}},{{ order.address.streetname}},
							<br>{{ order.address.locality}}.{{ order.address.city}}-{{ order.address.pincode}}</td>
							<td>{{ order.address.mobilenumber}}</td>
							<td>{{order.cart.productname}}</td>
							<td>{{ order.cart.quantity }}</td>
							<td>{{ order.cart.total }}</td>
							
							<td>{{ order.time }}</td>
							
						</tr>
					</tbody>
				</table>

			</div>
			
			<script>
				var temp = ${orders};
				var myapp = angular.module('myApp', []);
				myapp.controller('orderCtrl', function($scope) {
					$scope.list = temp;
				});
			</script>

		</div>
		<br>

	</div>
	<%@include file="footer.jsp"%>
</body>
</html>