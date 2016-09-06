<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
 
 <form:form modelAttribute="cart">
        <table>
            <tr>
                <th style="width:10%">Name</th>
                <th style="width:10%">Price Rs.</th>
                <td></td>
            </tr>    

            <c:set var="total_cost" value="0" scope="page" />
            <c:forEach items="${cart}" var="cart_item">
                <tr>
                    <c:choose> 
                      <c:when test="${fn:length(cart) gt 0}">
                        <td style="width:10%">${cart_item.getMenuName()}</td>
                        <td style="width:10%">${cart_item.getMenuPrice()}</td>
                        <c:set var="total_cost" value="${total_cost + cart_item.getMenuPrice()}" scope="page"/>
                      </c:when>
                      <c:otherwise>
                        <b><i>EMPTY LIST</i></b>
                      </c:otherwise>
                    </c:choose>                    
                </tr>
            </c:forEach>
            <tr>
                <td style="width:10%">Total Cost:</td>
                <td style="width:10%"><c:out value="${total_cost}"/></td>
            </tr>                
        </table>
    </form:form>

</body>
 --%>