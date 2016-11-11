<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/resource/css/bootstrap.min.css">

<link rel="stylesheet"
	href="resources/resource/css/font-awesome.min.css">
<script src="resources/resource/js/jquery.min.js"></script>
<link rel="stylesheet" href="resources/resource/css/style1.css">
<script src="resources/resource/js/bootstrap.min.js"></script>
<script src="resources/resource/js/angular.min.js"></script>
<script src="resources/resource/js/common.js"></script>
<script src="resources/resource/js/jquery.magnific-popup.min.js"></script>
<link rel="stylesheet"
	href="resources/resource/css/magnific-popup.css">
<link rel="stylesheet"
	href="resources/resource/css/stylesheet.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<header class="main__header">
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<!-- Brand and toggle get grouped for better mobile display -->
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="navbar-header">
					<h1 class="navbar-brand">
						<a href="index.html"> <img src="resources/pictures/logzz.png"
							alt=""></a>
					</h1>
					<a href="#" onClick="javascript.void()" class="submenu">Menus</a>
				</div>
				<div class="menuBar">
					<ul class="menu">
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<!-- <ul class="nav navbar-nav">
 -->
							<li><a class="dropdown-toggle" data-toggle="dropdown"
								style="color: white"> <span class="glyphicon glyphicon-user"></span>
									${pageContext.request.userPrincipal.name} <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="reset">Reset Password</a></li>
								</ul> <li class="active"><a href="home"><span
									class="glyphicon glyphicon-home"></span>Home</a></li>
					</c:if>
					<!-- 			 <li class="active"><a href="gomainpage"><span
							class="glyphicon glyphicon-home"></span>Home</a></li>  -->


					

					<c:if test="${pageContext.request.userPrincipal.name == null}">

						<li class="active"><a href="./"> Home</a></li>
						<li class="dropdown"><a href="#">CATEGORY <i class="fa fa-angle-down"></i></a>
          
  <ul>
              
              <c:forEach items="${categoryList}" var="category">
						<li><a href="productlist?catname=${category.name }"><b>${category.name }</b></a></li>
					</c:forEach></ul>
						<li><a href="about">AboutUs</a></li>
						<li><a href="goologin"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a href="registration.obj"><span
									class="glyphicon glyphicon-user"></span> SignUp</a></li>
	
            
 
					</c:if>



			<c:if test="${pageContext.request.userPrincipal.name != null}">


						<security:authorize access="hasRole('ROLE_USER')">
<li><a href="about">AboutUs</a></li>
							<li><a href="viewcartt" style="color:white"><span
										class="glyphicon glyphicon-shopping-cart"></span>Cart(${cartSize})</a></li>
						</security:authorize>
								<security:authorize access="hasRole('ROLE_ADMIN')">
						<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown">Category <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="admincategory">AddCategory</a></li>
					<li><a href="adminviewcat">ViewCategory</a></li>

				</ul>
			
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown">Supplier <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminsupplier">AddSupplier</a></li>
					<li><a href="adminviewsupl">ViewSupplier</a></li>

				</ul>
			
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" style="color:white">Product <span
										class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminproduct">AddProduct</a></li>
					<li><a href="adminviewprod">ViewProduct</a></li>

				</ul>
					
								<li class="dropdown"><a class="dropdown-toggle"
									data-toggle="dropdown" style="color:white">Orders <span
										class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="adminvieworder">Order</a></li>
						</ul></li>
							</security:authorize>

						<li><a href="goologin?logout" style="color:white"><span
									class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</c:if>
        </ul>
      </div>
      <!-- /.navbar-collapse --> 
    </nav>
  </div>
</header>
<section class="slider">
  <div id="myCarousel" class="carousel slide carousel-fade"
			data-ride="carousel">
    <div class="carousel-inner">
      <div class="item"> <img alt="first slide"
						src="resources/pictures/image1.jpg">
        
      </div>
      <div class="item"> <img alt="second slide"
						src="resources/pictures/image2.jpg">
        
        
      </div>
      <div class="item active"> <img alt="third slide"
						src="resources/pictures/image3.jpg">
       
      </div>
    </div>
    <a class="left carousel-control" href="#myCarousel"
				data-slide="prev"><span class="glyphicon carousel-control-left"></span></a> <a
				class="right carousel-control" href="#myCarousel" data-slide="next"><span
				class="glyphicon carousel-control-right"></span></a> </div>
</section>
<!--end of slider section-->


<section class="main__middle__container homepage">
  
 <br><br>
    <div class="container" data-ng-app="displayApp"
		data-ng-controller="displayController">
     <!-- grid for product display -->
     
    <div class="col-sm-4"></div>
<div class="col-sm-4">
<div class="input-group">
   <input type="text"  ng-model="searchItem.name" placeholder="Search"  class="form-control"/>
    <div class="input-group-addon input-sm">
      <span class="glyphicon glyphicon-search"></span>
    </div>
</div>
</div>
 <div class="col-sm-2"></div>
			
			<div class="col-sm-2">
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <b>Sort
						By </b><i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#"
							data-ng-click="sortType = 'price'; sortReverse = !sortReverse">Price
								<span data-ng-show="sortType == 'price' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								data-ng-show="sortType == 'price' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></li>
						<li><a href="#"
							data-ng-click="sortType = 'name'; sortReverse = !sortReverse">Name
								<span data-ng-show="sortType == 'name' && !sortReverse"
								class="fa fa-caret-down"></span> <span
								data-ng-show="sortType == 'name' && sortReverse"
								class="fa fa-caret-up"></span>
						</a></li>
					</ul>
				</div>
			</div>
		

	<div class="container">
		<div class="row">


			<section id="sidebar-main" class="col-md-12">
				<div id="content">
					<div class="content-top">
						<div class="box products-featured featured">						 
							<div class="box-content">		
								<div class="row product-items">
								<div
				data-ng-repeat="cake in cakeList | orderBy:sortType:sortReverse | filter:searchItem">
		
                                   <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
                                               <div class="product-block item-default">
				
                                                    <div class="image">
												 <a class="img"
																href="resources/images/{{cake.id}}.jpg"><img
																src="resources/images/{{cake.id}}.jpg"
																 ></a> 
												<!-- zoom image-->
												<a
																href="resources/images/{{cake.id}}.jpg"
																class="product-zoom" title="{{cake.name}}">
													<i class="fa fa-search-plus"></i>
												</a>

												<div class="product_quickview">
													<a href="proddesc?pdid={{cake.id}}">
																	
																	
														<i class="fa fa-eye"></i>
														<span> View</span>
													</a>
												</div>
											</div>

											<div class="product-meta clearfix">
												<h3 class="name">
																<a
																	href="proddesc?pdid={{cake.id}}">{{cake.name}}</a>
															</h3>	


												

												<div class="rating">
													<span class="fa fa-stack"><i
																	class="fa fa-star fa-stack-2x"></i><i
																	class="fa fa-star-o fa-stack-2x"></i>
													</span>
													<span class="fa fa-stack"><i
																	class="fa fa-star fa-stack-2x"></i><i
																	class="fa fa-star-o fa-stack-2x"></i>
													</span>
													<span class="fa fa-stack"><i
																	class="fa fa-star fa-stack-2x"></i><i
																	class="fa fa-star-o fa-stack-2x"></i>
													</span>
													<span class="fa fa-stack"><i
																	class="fa fa-star fa-stack-2x"></i><i
																	class="fa fa-star-o fa-stack-2x"></i>
													</span>
													<span class="fa fa-stack"><i
																	class="fa fa-star fa-stack-2x"></i><i
																	class="fa fa-star-o fa-stack-2x"></i>
													</span>
												</div>

												<div class="price" itemtype="http://schema.org/Offer"
																itemscope="" itemprop="offers">
													<span class="special-price">Rs.{{cake.price}}</span>

								
												</div>


												<div class="product-hover"> 				     

													<div class="cart">
														<button data-loading-text="Loading..." type="button"
																		value="Add to Cart" onclick="cart.addcart('40');"
																		class="addtocart">
																		<span>Add to Cart</span>
																	</button>		
													</div>

													
												</div>


											</div>

										</div>



									</div>	

								</div>

								
							</div>

						</div>
					</div>
				</div>

				</div>

			</section> 


		
	</div>
</div>
     
   
     
  </div>
  <div class="row three__blocks  text-left no_padding no-margin">
    <div class="container">
      <div class="col-md-4">
      <br><br>
        <img src="resources/pictures/baker.jpg" alt="image">
      
				</div>
      <div class="col-md-1"></div>
      <div class="col-md-7">
      <br><br><br>
		<h2 class="page__title"style="color:#ffffff">We Bake Cakes</h2>
        <p style="color:#ffffff">Cakes are special. Every birthday, every celebration ends with something sweet, a cake, and people remember. It's all about the memories. 
 If you look over the years, the styles have changed - the clothes, the hair, the production, the approach to the songs. The icing to the cake has changed flavors. But if you really look at the cake itself, it's really the same. 
When autumn darkness falls, what we will remember are the small acts of kindness: a cake, a hug, an invitation to talk, and every single rose. These are all expressions of a nation coming together and caring about its people. 
</p>
        					
      
				</div>
    </div>
  </div>
<!-- about us -->
<br><br>
 
<div class="container">
<h2 class="page__title">about us</h2>
<p style="color:black ;font-family:verdana">
<br><br>
Doughy Delights is a premium cake shop in Chennai. 
We opened in 2016, when Chennai was grappling with a lack of choice for quality cakes. 
After months of meticulous baking, Doughy Delights headed every must visit list of cafes in Chennai. 
The Hindu called Doughy Delights as the "Hip new cafe on a roll".
 Doughy Delights currently serves happiness from two swanky cafes in prime locales of Chennai.</p>
<br>
<p style="color:black;font-family:verdana">
During a visit to Coimbatore in 2016, we faced a lot of challenges to order a premium cake online. 
Problems like non-functional website, lack of response and long delivery wait times.
 That's when we decided to go online and solve this predicament to the best of our abilities. 
</p>
<br><br>
  <div class="item" align="center">
             <img src="resources/pictures/about.jpg"
					class="img-responsive">
            </div> 
</div>
<br>
    <!--  end of about us  -->
</section>
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <h3>About</h3>
        <p>We strive to deliver a level of service that exceeds the expectations of our customers. <br />
          <br />
          If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.</p>
      </div>
      <div class="col-md-3">
        <h3>Tweets</h3>
        <p>
						<span>Tweet</span> <a href="#">@You</a><br />
          Etiam egestas, ipsum posuere accumsan sollicitudin, nulla mauris volutpat sem, sit amet rutrum risus. </p>
        <p>
						<span>Tweet</span> <a href="#">@You</a><br />
          Quisque porta tellus vitae adipiscing molestie. Mauris et lacus blandit, malesuada.</p>
      </div>
      <div class="col-md-3">
        <h3>Mailing list</h3>
        <p>Subscribe to our mailing list for offers, news updates and more!</p>
        <br />
        <form action="#" method="post" class="form-inline" role="form">
          <div class="form-group">
            <label class="sr-only" for="exampleInputEmail2">your email</label>
            <input type="email" class="form-control form-control-lg"
								id="exampleInputEmail2" placeholder="your email">
          </div>
          <button type="submit" class="btn btn-primary btn-md">subscribe</button>
        </form>
      </div>
      <div class="col-md-3">
        <h3>Social</h3>
        <p>123 Business Way<br />
          San Francisco, CA 94108<br />
          USA<br />
          <br />
          Phone: (888) 123-4567<br />
          Fax: (887) 123-4567<br />
          <br />
        </p>
        <div class="social__icons"> <a href="#"
							class="socialicon socialicon-twitter"></a> <a href="#"
							class="socialicon socialicon-facebook"></a> <a href="#"
							class="socialicon socialicon-google"></a> <a href="#"
							class="socialicon socialicon-mail"></a> </div>
      </div>
    </div>
  </div>
</footer>
<p class="text-center copyright">&copy; Copyright ABC Company. All Rights Reserved.</p>

<script type="text/javascript">

$('.carousel').carousel({
  interval: 3500, // in milliseconds
  pause: 'none' // set to 'true' to pause slider on mouse hover
})

</script>
<script type="text/javascript">
$( "a.submenu" ).click(function() {
$( ".menuBar" ).slideToggle( "normal", function() {
// Animation complete.
});
});
$( "ul li.dropdown a" ).click(function() {
$( "ul li.dropdown ul" ).slideToggle( "normal", function() {
// Animation complete.
});
$('ul li.dropdown').toggleClass('current');
});

</script>
<script type="text/javascript">
		var data = ${items};
		var app = angular.module('displayApp', [])
		app.controller('displayController', function($scope, $http) {
			$scope.cakeList = data;

			
		});

		
		
	</script>
</body>
</html>