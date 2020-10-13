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
			<h3> Enter First day of the Month: </h3>
			<form action="checkmonth.jsp" method="post"><br>
				<p> Month: </p>
				<input type="text" name="month" placeholder = "04" required><br>
				<p> Year: </p>
				<input type="text" name="year" placeholder = "2020" required><br>
				<input type="submit" value="Submit">
			</form>
		</div>
	</body>

</html>