<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<style>

 
table, th , td ,tr {
  border: 2px solid grey;
  border-collapse: collapse;
  padding: 15px;
  
} 

</style>
<body>

 <%@include file="Loginheader.jsp"%>
 <br>
 
 <div class="container">
 <div align="left"><h4><b>${CartList}</b></h4></div>
 <br>
<table class="table">
<thead> 
 <tr>
				<th width="100">CARTID</th>
				<th width="200">PRODUCTNAME</th>
				<th width="200">QUANTITY</th>
			   <th width="100">PRICE</th>
				<th width="100">ACTION</th>
				</tr>
			</thead>

<tbody>
<c:forEach items="${cartList}" var="cart">
								<tr>
									
									<td>${cart.id}</td>
									<td>${cart.productname}</td>
									<td>${cart.quantity}</td>
									<td>${cart.price}</td>
									
									<td><a
										href=" <c:url value="/delcart${cart.id}"/>">DELETE</a></td>
								</tr>
							</c:forEach>




</tbody>
</table>
<br><br>
<h4><b>TOTAL COST : ${totalAmount }</b></h4>
</div>

</body>
</html>