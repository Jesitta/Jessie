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
</style>
<body>

	<%@include file="header.jsp"%>
	<br>

	<div class="container">
		<center>
			<h4>
				<b>YOUR ORDER HAS BEEN PLACED SUCCESSFULLY</b>
			</h4>
		</center>
		<br>
		<div align="right">
			<a href="<c:url value= '/continue'/>"><button type="submit"
					class="btn btn-warning">CONTINUE SHOPPING</button></a>
		</div>
		<div align="center">
			<h4>
				<b>${ordersum}</b>
			</h4>
		</div>
		<br>
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
							src="<c:url value='resources/images/${orderr.product.id}.jpg'/>"
							width=60px height=60px></td>

						<td>${orderr.productname}</td>

						<td>${orderr.quantity}</td>
						<td>${orderr.price}</td>
						<td>${orderr.total}</td>
					<tr>
				</c:forEach>

			</tbody>

		</table>
		<div class="row">
			<div class="col-md-9"></div>
			<div class="col-md-3">
				<h4>
					<b> GRAND TOTAL : ${totalAmount }</b>
				</h4>
			</div>
		</div>

		<br>
		<br>
		<div class="row">
			<div class="col-sm-3">
				<h4>
					<b>ADDRESSDETAILS</b>
				</h4>
				<b>NAME:</b>${details.user.username}<br> <b>DOOR NO:</b>${details.doornumber}<br>
				<b>STREETNAME:</b>${details.streetname}<br> <b>LOCALITY:</b>${details.locality}<br>

				<b>CITY:</b>${details.city}<br> <b>PINCODE:</b>${details.pincode}<br>
				<b>MOBILE NUMBER:</b>${details.mobilenumber}<br> <b>STATE:</b>${details.state}<br>
				<b>COUNTRY:</b>${details.country}<br>




			</div>
			<div class="col-sm-6"></div>
			<div class="col-sm-3">
				<div class="item">
					<img src="resources/pictures/delivery.gif" width=300; height=200;
						class="img-responsive">
						<h4><b>CASH ON DELIVERY ONLY*</b></h4>
				</div>
			</div>
		</div>

	</div>
	<br>
	<br>
	<%@include file="footer.jsp"%>



</body>
</html>