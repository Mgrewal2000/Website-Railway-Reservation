<html>
	<head>
		<meta charset="utf-8">
		<title> Delete Account </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
		<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			
		</ul>

	<body>
		<div class="loginBox">
			<p> The entered username does not exist! </p> 
			<h3> Enter Username to see the Customer Reservations: </h3>

			<form action="usernamecheck.jsp" method="post"><br>
				<p> Username: </p> 
				<input type="text" name="Username"><br>
				<input type="submit" value="Submit">
			</form>
		</div>
	</body>
</html>