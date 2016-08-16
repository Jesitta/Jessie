<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View</title>
<style>

table{
border-collapse: collapse;
}
table, tr,th,td {

border: 1px solid black;
}
table
{
padding-left: 40%
}
</style>

</head>
<body>
<%@include file="adminnavbar.jsp"%>
	
<h3>${CategoryList}</h3>
<!-- <c:if test="${!empty categoryList }">
		<table class="tg">
			<tr>
				<th width="120">ID</th>
				<th width="120">NAME</th>
				<th width="120">DESCRIPTION</th>
				<th width="120">EDIT</th>
				<th width="120">DELETE</th>
			</tr>
		<c:forEach items="${categoryList}" var="category">
				<tr>
					<td >${category.id}</td>
			        <td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="<c:url value= '/e${category.id}' />"> Edit</a></td>
				
					<td><a href="<c:url value= '/${category.id}' />"> Delete</a></td>
					</tr>
			</c:forEach> 
		</table>
	</c:if>
	  -->
 <c:if test="${!empty categoryList }">
		<table class="tg">
			<tr>
				<th width="120">ID</th>
				<th width="120">NAME</th>
				<th width="120">DESCRIPTION</th>
				<th width="120">EDIT</th>
				<th width="120">DELETE</th>
			</tr>
		<c:forEach items="${categoryList}" var="category">
				<tr>
					<td >${category.id}</td>
			        <td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="<c:url value= '/e${category.id}' />"> Edit</a></td>
				
					<td><a href="<c:url value= '/${category.id}' />"> Delete</a></td>
					</tr>
			</c:forEach> 
		</table>
	</c:if>
	
	<h3>${SupplierList}</h3>

 <c:if test="${!empty supplierList }">
		<table class="tg">
			<tr>
				<th width="120">ID</th>
				<th width="120">NAME</th>
				<th width="120">ADDRESS</th>
				<th width="120">EDIT</th>
				<th width="120">DELETE</th>
			</tr>
		<c:forEach items="${supplierList}" var="supplier">
				<tr>
					<td >${supplier.id}</td>
			        <td>${supplier.name}</td>
					<td>${supplier.address}</td>
					<td><a href="<c:url value= '/es${supplier.id}' />"> Edit</a></td>
				
					<td><a href="<c:url value= '/s${supplier.id}' />"> Delete</a></td>
					</tr>
			</c:forEach> 
		</table>
	</c:if>
	
<h3>${ProductList}</h3>

 <c:if test="${!empty productList }">
		<table class="tg">
			<tr>
				<th width="120">ID</th>
				<th width="120">NAME</th>
				<th width="120">DESCRIPTION</th>
				<th width="120">PRICE</th>
				<th width="120">EDIT</th>
				<th width="120">DELETE</th>
			</tr>
		<c:forEach items="${productList}" var="product">
				<tr>
					<td >${product.id}</td>
			        <td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.price}</td>
					<td><a href="<c:url value= '/ep${product.id}' />"> Edit</a></td>
				
					<td><a href="<c:url value= '/p${product.id}' />"> Delete</a></td>
					</tr>
			</c:forEach> 
		</table>
	</c:if>

</body>
</html>
<%-- <%@include file="adminnavbar.jsp"%>
	<h3>Category List</h3>

 <c:if test="${!empty categoryList }">
		<table class="tg">
			<tr>
				<th width="120">ID</th>
				<th width="120">NAME</th>
				<th width="120">DESCRIPTION</th>
				<th width="120">EDIT</th>
				<th width="120">DELETE</th>
			</tr>
		<ng-repeat items="${categoryList}" var="category">
				<tr>
					<td >${category.id}</td>
			        <td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="<c:url value= '/e${category.id}' />"> Edit</a></td>
				
					<td><a href="<c:url value= '/${category.id}' />"> Delete</a></td>
					
			</tr>
		</table>
	</c:if>

</body>
</html> --%>