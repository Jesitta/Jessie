<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<title>View</title>
<style>



table {
	border-collapse: collapse;
	width: 100%;
}

th, td, tr {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid LightCoral;
}

.button1 {
	border-radius: 50%;
}

.button {
	background-color: grey;
	font-size: 12px;
	border: none;
	color: white;
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
}
</style>

</head>
<body>
	<%@include file="header.jsp"%>

	
	<%@include file="proview.jsp"%>
	
	<%@include file="footer.jsp"%>



</body>
</html>
