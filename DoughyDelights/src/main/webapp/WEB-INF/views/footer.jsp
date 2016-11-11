<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

  
   <br><br>
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
						<span>Tweet</span> <a href="#">@doughydelights</a><br />
          Service is good </p>
        <p>
						<span>Tweet</span> <a href="#">@doughydelights</a><br />
          I have ordered a cake for my wedding. Loved it..!</p>
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
         Chennai,PC 600100<br />
          India<br />
          <br />
          Phone: 9840 703 652<br />
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
<p class="text-center copyright">&copy; Copyright Doughy Delights. All Rights Reserved.</p>
<script type="text/javascript">
		var data = ${items};
		var app = angular.module('displayApp', [])
		app.controller('displayController', function($scope, $http) {
			$scope.cakeList = data;

			
		});

		
	</script>
</body>
</html>