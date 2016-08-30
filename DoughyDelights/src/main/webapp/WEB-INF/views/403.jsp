<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>404-Access Denied</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
h1 {
	color: #b30000;
}

img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 100%;
	width: 100%
}
</style>
</head>
<body>

	<div class="container" style="vertical-align: middle; margin-top: 5%">
		<div class="row ">
			<div class="col-md-6">
				<div style="padding-top: 10%">
					<p>
					<h1>Sorry ! Access denied :(</h1>
					</p>
					<p>
					<h3>You are not authorized to access this page</h3>
					</p>
				</div>
				<div style="padding-top: 8%;">

					<p>
						<a href="home"><h5>
								<i><u>Return to homepage</u></i>
							</h5> </a>
					</p>
				</div>

			</div>
			<div class="col-md-4">
				<img src="<c:url value='/resources/pictures/403.png'/>" class="img-responsive"
					alt="403" />
			</div>
		</div>


	</div>
</body>
</html>