<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title> Login Page </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
	<body>
		<div class="loginBox">
			
			<h2> Login </h2>
			<form action="trylogincheck.jsp" method="post">
				<P>Username</P>
        		<input type="text" name="username" placeholder="Enter username" required>
        		<P>Password</P>
        		<input type="password" name="password" placeholder="........." required><br>
        		<br><input type="submit" value="Sign in">
    		</form>
    		<h3> Incorrect Username or Password! </h3>
		</div>
	</body>

</html>