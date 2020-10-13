<html>
	<head>
		<meta charset="utf-8">
		<title> Admin Page </title>
		<link rel = "stylesheet" href="style.css">

	</head>
<body>

<h2 class="title">Welcome to the Admin Page!</h2>
	<div class="adminBox">
	
		<form action="createaccountadmin.jsp">
			<input type="submit" value="Add a customer/employee">
		</form>
	
		<form action="deleteAccount.jsp">
			<input type="submit" value="Delete a customer/employee">
		</form>
	
		<form action="enterusername.jsp">
			<input type="submit" value="Edit customer/employee">
		</form>
	
		<form action="entermonth.jsp">
			<input type="submit" value="Obtain sales report for a month">
		</form>
	
		<form action="usernameforres.jsp">
			<input type="submit" value="Obtain Reservation done by a Customer">
		</form>
	
		<form action="enterlineandname.jsp">
			<input type="submit" value="Obtain Reservation by transit line and train name">
		</form>
		
		<form action="">
			<input type="submit" value="">
		</form>
		
	</div>

</html>