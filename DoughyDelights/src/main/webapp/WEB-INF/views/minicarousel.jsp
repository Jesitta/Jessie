<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.caro .active.left { left: -25%; }
.caro .next        { left:  25%; }

.caro .prev        { left: -25%; }
.carousel-control.left,.carousel-control.right {background-image:none;}
.item:not(.prev) {visibility: visible;}
.item.right:not(.prev) {visibility: hidden;}
.rightest{ visibility: visible;}

</style>
</head>
<body>


<div class="container">
    <div class="col-md-12">
        <div class="carousel slide" id="myCarousel">
          <div class="carousel-inner caro">
                <div class="item active">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/3.jpg"  class="img-responsive">1</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/4.jpg" class="img-responsive">2</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/5.jpg" class="img-responsive">3</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/27.jpg" class="img-responsive">4</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/28.jpg" class="img-responsive">5</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/29.jpg" class="img-responsive">6</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/29.jpg" class="img-responsive">7</a></div>
                </div>
                <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/30.jpg" class="img-responsive">8</a></div>
                </div>
                 <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/30.jpg" class="img-responsive">9</a></div>
                </div>
                 <div class="item">
                  <div class="col-lg-3 col-xs-3 col-md-3 col-sm-3">
                  <a href="#"><img src="resources/images/30.jpg" class="img-responsive">10</a></div>
                </div>
          </div>
          <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
          <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
        </div>
    </div>
</div>
<script type="text/javascript">
$('#myCarousel').carousel({
	  interval: 30000
	});

	$('.caro .item').each(function(){
	  var next = $(this).next();
	  if (!next.length) {
	    next = $(this).siblings(':first');
	  }
	  next.children(':first-child').clone().appendTo($(this));
	  

	  if (next.next().length>0) {
	 
	      next.next().children(':first-child').clone().appendTo($(this)).addClass('rightest');
	      
	     
	      
	  }
	  else {
		  
	      $(this).siblings(':first').children(':first-child').clone().appendTo($(this));
	     
	  }
	});

</script>




</body>
</html>