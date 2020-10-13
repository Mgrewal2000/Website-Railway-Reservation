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
			<h3> Enter the Transit line and Train#: </h3>
			<form action="Traincheck.jsp" method="post"><br>
				<p>Transit line: </p>
				<input type="text" name="transitline" required><br>
				<p>Train number: </p>
				<input type="text" name="trainnum" required><br>
			<input type="submit" value="Submit">
			</form>
		</div>
	</body>
</html>