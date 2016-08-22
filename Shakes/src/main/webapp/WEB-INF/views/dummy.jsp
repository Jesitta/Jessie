<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Category add</title>

</head>

<body>
<div ng-app="myApp" ng-controller="catControllerl">
<div class="container">
 <form action="login" method="post" id="login">
  <div class="form-group">
ID <input type="text" class="form-control" ng-model="id"><br>
NAME<input type="text" class="form-control" ng-model="name"><br>
DESCRIPTION <input type="text" class="form-control" ng-model="description"><br>
 <div>
				<c:if test="${!empty categoryTable.name }">
				<input type="submit" value="EDIT" />
				</c:if>
<c:if test="${empty categoryTable.name }">
     <input type="submit" value="ADD" />
       </c:if>
    </div>
</div>
</form>
</div>
</div>
<script>
var app = angular.module('myApp', []);
app.controller('catController', function($scope) {
    $scope.id= '1';
    $scope.name= 'cake';
    $scope.description= 'cake';
});
$scope.add=function(){
$scope.listCat.push({
	id: $scope.id,name: $scope.name,description: $scope.description
});
$scope.id= '';
$scope.name= '';
$scope.description= '';
};
</script>
	</body>
		</html>
		
<%-- <table cellpadding="2" cellspacing="2" border="1" >
<tr>
<th>ID</th>
<th>NAME</th>
<th>DESCRIPTION</th>
<th>OPTIONS</th>
</tr>
<tr ng-repeat="list">

<td>{{category.id}} </td>
<td>{{category.name}} </td>
<td>{{category.description}} </td>
<td><a href="<c:url value= '/e${category.id}' /> "ng-click="del(id)"> Edit</a>
<a href="<c:url value= '/${category.id}' />" "ng-click="edit(id)"> Delete</a></td>
</tr>

</table--%>
		
<!-- @RequestMapping(value ="/proddesc")
	public ModelAndView viewpage(HttpServletRequest req) {
		String pdid=req.getParameter("pdid");
		
		CakeProduct cakeProduct = productDAO.getById(Integer.parseInt(pdid));
		ModelAndView mv=new ModelAndView("prodfinal");
		Gson gs=new Gson;
		String page=gs.toJson(cakeProduct);
		mv.addObject("finalpage",page);
			
		return mv;
    } -->
	<!-- 	@Transactional
	public CakeProduct getById(int productId)
	{
		String hql="from CakeProduct where id  =" + "'" + productId + "'";
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
				
		List<CakeProduct> listProduct = query.list();
		
		if(listProduct!= null && !listProduct.isEmpty()) {
			return listProduct.get(0);
			
		}
		return null;
	} -->	





	