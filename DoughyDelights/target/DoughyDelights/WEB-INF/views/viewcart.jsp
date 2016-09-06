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
.button1
{border-radius: 50%;
}

.button {
 background-color:#C52D2F ;
    font-size: 12px;
    border: none;
    color:  floralwhite;
    padding: 10px 14px;
    text-align: center;
    text-decoration: none;
    display: inline-block;  
    margin: 1px 1px;
    cursor: pointer;
     }

</style>
<body>

 <%@include file="header.jsp"%>
 <br>
 
 <div class="container">
 <div align="left"><h4><b>${CartList}</b></h4></div>
 <br>
<table class="table">
<thead> 
 <tr>
 <!-- <th width="40">IMAGE</th> -->
				<th style="width: 40; color: #C52D2F; text-align: center">CARTID</th>
				<th style="width: 200; color: #C52D2F; text-align: center">PRODUCTNAME</th>
				<th  style="width: 200; color: #C52D2F; text-align: center">QUANTITY</th>
			   <th  style="width: 100; color: #C52D2F; text-align: center">PRICE</th>
				<th  style="width: 100; color: #C52D2F; text-align: center">ACTION</th>
				</tr>
			</thead>

<tbody>
<c:forEach items="${cartList}" var="cart">
								<tr>
									 <%-- <td> <img src="/resources/images/${cart.pdid.id}.jpg"  width=60; height=60; class="img-responsive"></td> --%>
									<td>${cart.id}</td>
									<td>${cart.productname}</td>
									<td>${cart.quantity}</td>
									<td>${cart.price}</td>
							
									<td><a
										href=" <c:url value="/delcart${cart.id}"/>"><button class="button button1" type="submit" onclick="return confirm('Are you sure you want to Remove?')" class="btn btn-danger">DELETE <span class="glyphicon glyphicon-remove"></span></button></a></td>
												
								</tr>
							</c:forEach>




</tbody>
</table>
<br><br>
<h4 align="center"><b>TOTAL COST : ${totalAmount }</b></h4><br><br>
<a href=final><button type="submit" class="btn btn-success">ORDER NOW</button></a>

</div>

</body>
</html>