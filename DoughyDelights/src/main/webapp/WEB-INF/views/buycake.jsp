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

<br>
<c:forEach items="${prodfinal}" var="product" >
<div class="col-sm-4"> 
<div class="item">
             <img src="resources/images/${product.id}.jpg" width=300; height=300; class="img-responsive">
            </div>
            </div>
<div class="col-sm-6"> 
<br><br>
<b>PROID:</b>   ${product.id}<br><br>
<b>NAME:</b>    ${product.name}<br><br>
<b>DESCRIPTION: </b>  ${product.description}<br><br>
<b>PRICE:       Rs.</b>${product.price}<br><br>
<button type="buy${product.id}" class="btn btn-info">BUY NOW</button>
<a href="<c:url value= '/cart${product.id}'/>"><button type="submit" class="btn btn-warning">ADD TO CART</button></a>

</div>

</c:forEach>

</div>

<br><br>
<h4><b>TOTAL COST : ${totalAmount }</b></h4>


</body>