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
			<p>The username does not exist!</p>
			<h3> Enter Username to make changes:</h3>

			<form action="checkusername.jsp" method="post"><br>
				<p>Username: </p>
				<input type="text" name="Username" required><br>
				<input type="submit" value="Submit">
			</form>
		</div>
			
	</body>

</html>