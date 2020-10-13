
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Edit a reservation form</title>
</head>
<body>
<div class="adminbox">

<form action="insertEditReservation4.jsp" method="post"><br>
   <p> Please enter your ReservationID: <input type="text" name="reservationid"required><br>
   <p> Please enter the name of your customer representative: <input type="text" name="newcustomerRep"required><br>
   <p> Please enter your new reservation date(YYYY/MM/DD): <input type="datetime-local" name="newdate"required><br>
	<p><label for="tickettype">Please choose a new ticket type:</label>
	<select name= newticketType id="Type">
 		 <option value="testrushi">Round-Trip</option>
  		 <option value="weekly">Weekly</option>
	     <option value="oneway">One-Way</option>
  		 <option value="monthly">Monthly</option>
	</select>
    <input type="submit" value="Edit Reservation">
</form>
<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" value="Return to Customer Representative Page">
</form>
</div>
</body>
</html>
