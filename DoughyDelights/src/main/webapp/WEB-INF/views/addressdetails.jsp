<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddressDetails</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container">
<div class=col-sm-6>
 <c:url var="addres" value="checkout"></c:url>
<form:form  action="${addres}" modelAttribute="addressDetails" method="post">
				<h4 style="color: black;">SHIPPING ADDRESS</h4>
				<div class="form-group">
					<label for="doornumber">Door Number</label>
					<form:input path="doornumber" placeholder="Enter doornumber" 
						 class="form-control" />
						  <form:errors style="color:red" path="doornumber"/>
				</div>
				
        <div class="form-group">
            <label for="streetname">Street Name</label>
            <form:input path="streetname"  placeholder="Enter streetname" class="form-control" />
             <form:errors style="color:red" path="streetname"/>
        </div>

        <div class="form-group">
            <label for="locality">Locality</label>
            <form:input path="locality" placeholder="Enter locality" class="form-control" />
             <form:errors style="color:red" path="locality"/>
        </div>

        <div class="form-group">
            <label for="city">City</label>
            <form:input path="city" placeholder="Enter city" class="form-control" />
             <form:errors style="color:red" path="city"/>
        </div>
 <div class="form-group">
            <label for="pincode">Pincode</label>
            <form:input path="pincode"  class="form-control" pattern="[[0-9]{6}"
					title="Enter valid numbers"
					placeholder="Enter pincode" />
					 <form:errors style="color:red" path="pincode"/>
        </div>
         <div class="form-group">
            <label for="mobilenumber">Mobile number</label>
            <form:input path="mobilenumber"  class="form-control" pattern="[7|8|9][0-9]{9}"
					title="Phone number should start with 7-9 and remaing 9 digit with 0-9"
					placeholder="Enter mobilenumber" />
					 <form:errors style="color:red" path="mobilenumber"/>
        </div>
        <div class="form-group">
            <label for="state">State</label>
            <form:input path="state"  class="form-control" placeholder="Enter state"  />
             <form:errors style="color:red" path="state"/>
        </div>

        <div class="form-group">
            <label for="country">Country</label>
            <form:input path="country"  class="form-control" placeholder="Enter country"  />
             <form:errors style="color:red" path="country"/>
        </div>

       			
				
				<div class="form-group">
					<button type="submit" class="btn btn-success">SUBMIT</button>
				</div>

			</form:form>
			</div>
			</div>
			<%@include file="footer.jsp"%>
</body>
</html>