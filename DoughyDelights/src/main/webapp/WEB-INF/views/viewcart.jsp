<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

</style>
<body>

 <%@include file="header.jsp"%>

 <div class="container">
 <c:if test="${empty cartList}"><br><br>
 <div align="center" class="blink" style="color: red"><h4><b>Cart is Empty</b></h4></div>
 
  </c:if>
  
  <c:if test="${not empty cartList }">
  <div class="row">
 <div class="col-md-2"><a href="<c:url value= '/continue'/>"><button type="submit"
					class="btn btn-warning"><span
										class="glyphicon glyphicon-chevron-left"></span> CONTINUE SHOPPING</button></a></div>
 <div class="col-md-8"><center><h4><b>CART LIST</b></h4></center></div>
 <div class="col-md-1"></div>
 <div class="col-md-1"><a href="<c:url value= '/address'/>" ><button type="submit" class="btn btn-success">CHECKOUT <span
										class="glyphicon glyphicon-chevron-right"></span></button></a></div>
</div>
 
<table class="table">
<thead> 
 <tr>
 
 <!-- <th width="40">IMAGE</th> -->  
 <th  style="width: 100; color: #C52D2F; text-align: center">ACTION</th>
				<th style="width: 200; color: #C52D2F; text-align: center">CAKE</th>
				<th style="width: 100; color: #C52D2F; text-align: center">PRODUCTNAME</th>
				<th  style="width: 100; color: #C52D2F; text-align: center">QUANTITY</th>
			   <th  style="width: 100; color: #C52D2F; text-align: center">PRICE</th>
			   <th  style="width: 100; color: #C52D2F; text-align: center">TOTAL</th>
				
				</tr>
			</thead>

<tbody>
<c:forEach items="${cartList}" var="cart">
								<tr>
								
								 	<td><a
										href=" <c:url value="/delcart${cart.cartItemId}"/>"><button class="button button1" type="submit" onclick="return confirm('Are you sure you want to Remove?')" class="btn btn-danger">DELETE <span class="glyphicon glyphicon-remove"></span></button></a></td>
									 
									 <td> <img src="resources/images/${cart.products.id}.jpg"  width=60; height=60; ></td> 
									<td>${cart.products.name}</td>
									
								
<td><a href="minus${cart.cartItemId}"> <button type="submit">-</button></a>  <input type="text" size="1" value=" ${cart.quantity}"> <a href="plus${cart.cartItemId}"> <button type="submit">+</button></a></td>
									<td>${cart.price}</td>
									<td>${cart.totalPrice}</td>
							
									
												
								</tr>
							</c:forEach>




</tbody>
</table>


<div class="row">
 <div class="col-md-9"></div>
  <div class="col-md-3"><h4><b> GRAND TOTAL : ${totalAmount }</b></h4></div>
</div>


</c:if>

</div><br><br>
	<%@include file="footer.jsp"%>


</body>
</html>