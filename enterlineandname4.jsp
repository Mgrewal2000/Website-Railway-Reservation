<html>
<head><link rel = "stylesheet" type="text/css" href = "style4.css"></head>
<body>

<div class="adminbox">
<p> Please enter the transit line and train number to produce the list of customers (seats reserved): </p>

	<form action="listofcustomerseats4.jsp" method="post"><br>
			

			<p> <span class="label success">Enter the transitline name :</span>
			 <input type="text" name="transitline"required><br>
			 
			 
			 <p> <span class="label success">Enter the train number:</span>
			<input type="text" name="trainnum"><br>
			<input type="submit" style="width:300px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  " value="Submit">
	</form>
	<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" style="width:300px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  " value="Return to Customer Representative Page">
</form>
</div>
</body>

</html>