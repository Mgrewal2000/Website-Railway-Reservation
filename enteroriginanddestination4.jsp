<html>
<head><link rel = "stylesheet" type="text/css" href = "style4.css"></head>
<body>

<div class="menuBox">
<span class="label success">Please enter the origin and the destination to produce a list of train schedules:</span>

	<form action="listoftrainscheduleorigindestination4.jsp" method="post"><br>
	<span class="label success">Enter the origin:</span>
			<p> <input type="text"style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff name="origin"required><br>
			<p> <span class="label success">Enter the destination:</span>
			<p><input type="text" style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff name="destination"required><br>
			<p><input type="submit" style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  " value="Submit">
	</form>
	<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  " value="Return to Customer Representative Page" >
</form>
</div>
</body>

</html>