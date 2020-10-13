
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Add a new Reservation Form</title>
</head>
<body>
<div class="adminbox">

<form action="insertReservation4.jsp" method="post"><br>
   <p> Please enter your user name: <input type="text" name="username" required><br>
   <p> Please enter the name of your customer representative: <input type="text" name="customerRep" required><br>
   <p> Please enter your reservation date(YYYY/MM/DD): <input type="date" name="date" required><br>
   <p> Please enter the customer's trainschedule id ( 1 - 12 only): <input type="text" name="trainscheduleid" required ><br>
	<p><label for="tickettype">Choose a ticket type:</label>
	<select name= ticketType id="Type">
	
 		 <option value="testrushi">Round-Trip</option>
  		 <option value="weekly">Weekly</option>
	     <option value="oneway">One-Way</option>
  		 <option value="monthly">Monthly</option>
	</select>
	<p><label for="transitlinename">Choose your transitline:</label>
	<select name= transitlinename id="Type">
 		 <option value="Atlantic City Line">Atlantic-City Line</option>
  		 <option value="Gladstone Branch">Gladstone Branch</option>
	     <option value="Raritan Valley Line">Raritan Valley Line</option>
  		 <option value="Morristown Line">Morristown Line</option>
  		 <option value="North Jersey Coast Line">North Jersey Coast Line</option>
  		 <option value="Northeast Corridor">Northeast Corridor</option>
	</select>

    
    <input type="submit" value="Add Reservation">
</form>
<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" value="Return to Customer Representative Page">
</form>
</div>
</body>
</html>
