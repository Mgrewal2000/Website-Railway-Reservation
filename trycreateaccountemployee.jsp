<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
		<meta charset="utf-8">
		<title> New Account form </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
</head>
	<body>
		<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			
		</ul>
		<div class="createaccountbox">
		
			<h2> Please fill out the information: </h2>
			<form action="insertnewaccountemployyee.jsp" method="post"><br>
				<P>SSN: </P>
   				<input type="text" name="ssn" placeholder="Enter ssn" required><br>
   				<P>Username: </P>
   				<input type="text" name="username" placeholder="Enter username" required><br>
   				<P>Password: </P>
    			<input type="password" name="password" placeholder="........" required><br>
    			<P>Name: </P>
    			<input type="text" name="Name" placeholder="Enter Name" required><br>
    			<P>Email: </P>
    			<input type="text" name="Email"  placeholder="Enter Email" required ><br><br>
    			<P>Phone Number: </P>
    			<input type="text" name="Phonenum" placeholder="Enter Phone" required><br>
    			<h2>Address: </h2>
    			<P>State: </P>
    			<input type="text" name="State" placeholder="Enter State" required ><br>
    			<P>City: </P>
   				<input type="text" name="City" placeholder="Enter City" required><br>
    			<P>StreetName: </P>
    			<input type="text" name="StreetName" placeholder="Enter Street" required><br>
    			<P>Zipcode: </P>
    			<input type="text" name="Zipcode" placeholder="Enter Zipcode#" required><br>
    			<input type="submit" value="Submit">
			</form>
			
		
	
		</div>		
	</body>
</html>
