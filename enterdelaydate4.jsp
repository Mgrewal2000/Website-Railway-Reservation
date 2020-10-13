
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Input either the departure or arrival time to delay it</title>
</head>
<body>
<div class="adminbox">

		<p>Any Delays?<form action="delaydate4.jsp" method = "post">
		<p>Please enter the Train Schedule ID to update its delay schedule: <input type="text" name="trainscheduleid"required><br>
		Please enter the station ID to delay the train schedule associated with it: <input type="text" name="stationid" required><br>
		Please enter any new arrival date(YYYY/MM/DD): <input type="date" name="delayarrivaldate" required><br>
		Please enter the new departure date(YYYY/MM/DD): <input type="date" name="delaydeparturedate" required><br>
		Please enter current date and time(YYYY/MM/DD): <input type="datetime-local" name="currentdatetime" required><br>
		
		<input type="submit" value="Update Delay">
</form>

<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" value="Return to Customer Representative Page">
</form>
</div>
</body>
</html>
