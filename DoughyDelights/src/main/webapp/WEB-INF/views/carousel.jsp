<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.carousel-fade .carousel-inner .item {
	opacity: 0;
	-webkit-transition-property: opacity;
	-moz-transition-property: opacity;
	-o-transition-property: opacity;
	transition-property: opacity;
}

.carousel-fade .carousel-inner .active {
	opacity: 1;
}

.carousel-fade .carousel-inner .next.left, .carousel-fade .carousel-inner .prev.right
	{
	opacity: 1;
}

.list-group-item-action {
	background-color: Beige;
	text-align: left;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel({
			interval : 3000
		})
	});
</script>

<title>Mainpage</title>
</head>

<body>

	<div class="container">

		<div class="row" style="padding-top: 30px">

			<div class="col-sm-3">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-danger"
						style="text-align: left; padding: 5px">
						<b><h4>CATEGORIES</h4></b>
					</button>
					<c:forEach items="${categoryList}" var="category">
						<a href="productlist?catname=${category.name }"
							class="list-group-item list-group-item-action"
							style="padding: 16px; color: brown">${category.name }</a>
					</c:forEach>
					<!-- <a href="productlist?catname=Birthday Cakes" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">Birthday Cakes</a>
<a href="productlist?catname=Wedding Cakes" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">Wedding Cakes</a>
<a href="productlist?catname=Cup Cakes" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">Cup Cakes</a>
<a href="productlist?catname=BlackForest / WhiteForest" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">BlackForest / WhiteForest</a>
<a href="productlist?catname=Christmas Specials" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">Christmas Specials</a>
<a href="productlist?catname=Fresh Fruit Cakes" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">Fresh Fruit Cakes</a>
<a href="productlist?catname=Premium ChocolateCakes" class="list-group-item list-group-item-action" style="padding: 16px;color:brown">Premium ChocolateCakes</a>
 -->
				</div>
			</div>
			<div class="col-sm-9">

				<div id="Carousel" class="carousel slide carousel-fade"
					style="padding-left: 0%; padding-top: 0%; width: 100%">
					<ol class="carousel-indicators" style="padding-left: 0%">
						<li data-target="Carousel" data-slide-to="0" class="active"></li>
						<li data-target="Carousel" data-slide-to="1"></li>
						<li data-target="Carousel" data-slide-to="2"></li>
						<li data-target="Carousel" data-slide-to="3"></li>
						<li data-target="Carousel" data-slide-to="4"></li>



					</ol>


					<div class="carousel-inner">
						<div class="item active ">
							<img src="resources/pictures/image1.jpg"
								style="width: 100%; height: 420px" class="img-responsive">
						</div>
						<div class="item">
							<img src="resources/pictures/image2.jpg"
								style="width: 100%; height: 420px" class="img-responsive">
						</div>
						<div class="item">
							<img src="resources/pictures/image3.jpg"
								style="width: 100%; height: 420px" class="img-responsive">
						</div>
						<div class="item">
							<img src="resources/pictures/image4.jpg"
								style="width: 100%; height: 420px" class="img-responsive">
						</div>
						<div class="item">
							<img src="resources/pictures/image5.jpg"
								style="width: 100%; height: 420px" class="img-responsive">
						</div>
					</div>
				</div>
			</div>

		</div>
		<br>
	</div>
</body>
</html>