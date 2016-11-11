<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

  
 
    
     <!-- grid for product display -->
 

	<div class="container"  data-ng-app="displayApp"
		data-ng-controller="displayController">
		<div class="row">


 
			
			<div class="col-sm-3">
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
		
<div class="col-sm-6">
<div class="input-group">
   <input type="text"  ng-model="searchItem.name" placeholder="Search"  class="form-control"/>
    <div class="input-group-addon input-sm">
      <span class="glyphicon glyphicon-search"></span>
    </div>
</div>
</div>
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
													
														<a href="<c:url value= '/cart{{cake.id}}'/>"><button type="submit"
																		value="Add to Cart" 
																		class="addtocart">
																		<span>Add to Cart</span>
																	</button>	</a>
																		
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

<script type="text/javascript">
		var data = ${items};
		var app = angular.module('displayApp', [])
		app.controller('displayController', function($scope, $http) {
			$scope.cakeList = data;

			
		});

		
		
	</script>
</body>
</html>