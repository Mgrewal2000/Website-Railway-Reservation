<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>


    
    <head>
		<meta charset="utf-8">
		<title> Delete Account </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>

	<body>
		<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			
		</ul>
		<div class="loginBox">
			<h3> Account has been deleted! </h3>
			<h3> Enter Username to delete Account:</h3>

			<form action="deletefromDb.jsp" method="post"><br>
						<p>Username:</p> 
						<input type="text" name="username" placeholder="Enter username" required><br>
					  <input type="submit" value="Submit">
				
			</form>
			
		</div>
	</body>
</html>