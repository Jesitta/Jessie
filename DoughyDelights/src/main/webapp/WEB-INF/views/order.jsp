<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">

<br>
<c:forEach items="${prodfinal}" var="product" >
<div class="col-sm-4"> 
<div class="item">
             <img src="resources/images/${product.id}.jpg" width=300; height=200; class="img-responsive">
            </div>
            </div>
<div class="col-sm-6"> 
<br><br>

<b>NAME:</b>    ${product.name}<br><br>
<b>DESCRIPTION: </b>  ${product.description}<br><br>
<b>SELLER: </b>${product.sup.name}<br><br>
<b>PRICE:       Rs.</b>${product.price}<br><br>
<a href=final><button type="submit" class="btn btn-info">ORDER NOW</button></a>
<a href="<c:url value= '/cart${product.id}'/>"><button type="submit" class="btn btn-warning">ADD TO CART</button></a>

</div>

</c:forEach>

</div>
</body>
</html>