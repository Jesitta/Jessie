<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Checkout</title>
</head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td, tr {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid LightCoral;
	border-collapse: collapse;
}

b {
	text-transform: uppercase;
}
.blink {
font-weight:bold;
color:maroon;
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
.address{
text-transform: uppercase;

}
/* hr{
border:none;
  border-top:1px dotted red;
  color:red;
  background-color:red;
  } */
</style>
<body>

	<%@include file="header.jsp"%>
	

	<div class="container">
	<div class="row">
	<div class="col-sm-4"></div>
		<div class="col-sm-6">
			<h4>
				<b>YOUR ORDER HAS BEEN PLACED SUCCESSFULLY</b>
			</h4>
		</div>
		<div class="col-sm-2"><a href="<c:url value= '/continue'/>"><button type="submit"
					class="btn btn-warning">CONTINUE SHOPPING <span
										class="glyphicon glyphicon-chevron-right"></span></button></a></div></div>
		<hr style="border-top: 1px dotted maroon"/>
				<div class="row">
				<center><h4>
					<b> CUSTOMER DETAILS</b>
					
				</h4></center>
		
			<div class="col-sm-2">
				
				<br><br>
				<b>YOUR ORDER ID:</b> <br>
				<b>NAME:</b>
				<br> 
				<b>MOBILE NUMBER:</b>
				<br>
				<b>SHIPPING DETAILS:</b>
				
				
				</div>
				<div class="col-sm-2 address"><br><br>
				#000${id}<br>
				${details.user.username}<br>${details.mobilenumber}<br>${details.doornumber},<br>${details.streetname},${details.locality}<br>${details.city}-${details.pincode}<br>
				${details.state}<br>${details.country}



			</div>
			
			<div class="col-sm-5"></div>
	
			<div class="col-sm-3">
				<div class="item">
					<img src="resources/pictures/delivery.gif" width=300; height=200;
						class="img-responsive">
						
				</div>
			</div>
		</div>
		<hr style="border-top: 1px dotted maroon">
		<div class="row">
<center><h4>
				<b>ORDER SUMMARY</b>
			</h4></center>

</div>
		<table class="table">
			<thead>
				<tr>
					<!-- <th width="40">IMAGE</th> -->
					<th style="width: 100; color: #C52D2F; text-align: center">CAKE</th>
					<th style="width: 100; color: #C52D2F; text-align: center">PRODUCTNAME</th>
					<th style="width: 100; color: #C52D2F; text-align: center">QUANTITY</th>
					<th style="width: 100; color: #C52D2F; text-align: center">PRICE</th>
					<th style="width: 100; color: #C52D2F; text-align: center">TOTAL</th>

				</tr>
			</thead>



			<tbody>
				<c:forEach items="${order}" var="orderr">

					<tr>
						<td><img
							src="<c:url value='resources/images/${orderr.products.id}.jpg'/>"
							width=60px height=60px></td>

						<td>${orderr.products.name}</td>

						<td>${orderr.quantity}</td>
						<td>${orderr.price}</td>
						<td>${orderr.totalPrice}</td>
					<tr>
				</c:forEach>

			</tbody>

		</table>
	<div class="row">
 <div class="col-md-9 blink"><h4><b>CASH ON DELIVERY ONLY*</b></h4></div>
  <div class="col-md-3"><h4><b> GRAND TOTAL : ${totalAmount }</b></h4></div>
</div>



	</div>
	
	<%@include file="footer.jsp"%>



</body>
</html>