
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Edit a reservation form</title>
</head>
<body>
<div class="adminbox">

<form action="DeleteReservation4.jsp" method="post"><br>
   <p> Please enter the reservation ID number to delete the corresponding reservation: <input type="text" name="reservationid"required><br>
    <input type="submit" value="Delete Reservation">
</form>
<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" value="Return to Customer Representative Page">
</form>
</div>
</body>
</html>
