<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
.carousel-fade .carousel-inner .active.left,
.carousel-fade .carousel-inner .active.right {
  left: 0;
  opacity: 0;
  z-index: 1;
}
.carousel-fade .carousel-inner .next.left,
.carousel-fade .carousel-inner .prev.right {
  opacity: 1;
}
.carousel-fade .carousel-control {
  z-index: 2;
}
</style> 
 <script type="text/javascript">
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 3000
    })
  });
</script> 

<title>Mainpage</title>
</head>

<body>


<div class="container-fluid">
<div id="Carousel" class="carousel slide carousel-fade " style="padding-left:30%; padding-top: 70px; width:100 %">
        <ol class="carousel-indicators" style="padding-left:60%;  width:100 %">
            <li data-target="Carousel" data-slide-to="0" class="active"></li>
            <li data-target="Carousel" data-slide-to="1"></li>
            <li data-target="Carousel" data-slide-to="2"></li>
            <li data-target="Carousel" data-slide-to="3"></li>
             <li data-target="Carousel" data-slide-to="4"></li>
            <li data-target="Carousel" data-slide-to="5"></li>         
             <li data-target="Carousel" data-slide-to="6"></li>
            <li data-target="Carousel" data-slide-to="7"></li>
            
            <li data-target="Carousel" data-slide-to="8"></li>
        </ol>

        <div class="carousel-inner">
           <div class="item ">
             <img src="resources/images/slide1.png" class="img-responsive">
           </div>
           <div class="item active">
             <img src="resources/images/slide2.png" class="img-responsive">
            </div>
           <div class="item">
             <img src="resources/images/slide3.png" class="img-responsive">
            </div>
              <div class="item">
             <img src="resources/images/slide4.png" class="img-responsive">
            </div> 
           <div class="item">
             <img src="resources/images/slide5.png" class="img-responsive">
            </div>
            <div class="item">
             <img src="resources/images/slide6.png" class="img-responsive">
            </div>
           <div class="item">
             <img src="resources/images/slide7.png" class="img-responsive">
             </div>
           <div class="item">
             <img src="resources/images/slide8.png" class="img-responsive">
            </div>                    
        </div>
</div>
</div>   

</body>
</html>