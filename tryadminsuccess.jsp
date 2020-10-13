<html>
	<head>
		<meta charset="utf-8">
		<title> Admin Page </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
<body>
	<li><a href="trylogout.jsp" class="active"> LogOut</a></li>
	<li><a href="#contact"> Contact </a></li>
	
	<br><br><br><h2 class="title" > Welcome to the Admin Page!</h2>
	<div class="adminBox">
	
		<form action="trycreateaccount.jsp">
			<input type="submit" value="Add a customer">
		</form>
	
		<form action="trycreateaccountemployee.jsp">
			<input type="submit" value="Add a employee">
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
		
		<form action="revenuebyTL.jsp">
			<input type="submit" value="Revenue Per Transit Line">
		</form>
		
		<form action="revenuebyDC.jsp">
			<input type="submit" value="Revenue Per Destination City">
		</form>
		
		<form action="revenuebyC.jsp">
			<input type="submit" value="Revenue Per Customer">
		</form>
		
		<form action="bestcustomer.jsp">
			<input type="submit" value="Best Customer">
		</form>
		
		<form action="besttransitline.jsp">
			<input type="submit" value="Top Five Transitline">
		</form>
		
	</div>

</html>