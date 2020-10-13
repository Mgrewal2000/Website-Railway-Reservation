<html>
	<head>
		<meta charset="utf-8">
		<title> Make Changes </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
		<body>

			<li><a href="tryadminsuccess.jsp" class="active"> Admin Page </a></li>
	
			<%@ page import="java.sql.*" %>
<% 
	String userid = (String)session.getAttribute("Username");
%>
	<div class="editaccountbox">
		<p> The Address has been changed! </p>
		<h3>Enter the new Username:</h3>

				<form action="updateusername.jsp" method="post"><br>
				<p>New Username: </p>
				<input type="text" name="NewUsername" required><br>
				<input type="submit" value="Submit">
			</form>
	
		<h3>Enter the new Password:</h3>

			<form action="updatepassword.jsp" method="post"><br>
				<p>Password: </p>
				<input type="text" name="NewPassword" required><br>
				<input type="submit" value="Submit">
			</form>

		<h3>Enter the new Name:</h3>

			<form action="updatename.jsp" method="post"><br>
				<p>Name: </p>
				<input type="text" name="Name" required><br>
				<input type="submit" value="Submit">
		</form>
		
		<h3>Enter the new Email: </h3>

		<form action="updateemail.jsp" method="post"><br>
			<p>Email: </p>
			<input type="text" name="Email" required><br>
			<input type="submit" value="Submit">
		</form>
		
		<h3>Enter the new Phone Number: </h3>
		<form action="updatephonenumber.jsp" method="post"><br>
			<p>PhoneNumber: </p>
			<input type="text" name="phone" required><br>
			<input type="submit" value="Submit">
		</form>

		<h3>Enter the new Address:</h3>

		<form action="updateaddress.jsp" method="post"><br>
			<p>StreetName:</p> 
			<input type="text" name="StreetName required"><br>
			<p>City:</p>
			<input type="text" name="City" required><br>
			<p>State:</p> 
			<input type="text" name="State" required><br>
			<p>ZipCode: </p>
			<input type="text" name="ZipCode" required><br>
			<input type="submit" value="Submit">
		</form>
	</div>
	</body>
</html>