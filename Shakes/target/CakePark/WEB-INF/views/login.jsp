<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>loginpage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myModal").modal('show');
	});
</script>
</head>
<body>
	<%@include file="newmain.jsp"%>
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title">LOGIN</h3>
				</div>
				<div class="modal-body">
					 
    <div class="form-group">
    
      <label for="username">Username</label>
      <input type="text" class="form-control" class="col-sm-5" id="username" placeholder="Your name">
    </div>
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" class="col-sm-5" id="pwd" placeholder="Enter password">
    </div>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
					<br>
					<button type="submit" class="btn btn-primary">LOGIN</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
