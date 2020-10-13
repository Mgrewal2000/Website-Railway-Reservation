<html>

<body>

<head>
	<title>Editing Customer</title>
</head>
<%@ page import="java.sql.*" %>

<% 
	
	
	String reservationID = (String)request.getAttribute("reservationid");
	out.println(reservationID);
	
	
%>
<p> Please Enter your new reservation date(YYYY/MM/DD)</p>

		<form action="updatereservationdate4.jsp" method="post"><br>
			New Reservation date: <input type="date" name="updatereservationdate"><br>
				<input type="submit" value="Submit">
		</form>

<p> Please choose your new transit line name:</p>

		<form action="updatetransitlinename4.jsp" method="post"><br> -->
	     <select name= updatetransitlinename id="Type">
 		 <option value="Atlantic City Line">Atlantic City Line</option>
  		 <option value="Gladstone Branch">Gladstone Branch</option>
	     <option value="Raritan Valley Line">Raritan Valley Line</option>
  		 <option value="Morristown Line">Morristown Line</option>
  		 <option value="North Jersey Coast Line">North Jersey Coast Line</option>
  		 <option value="Northeast Corridor">Northeast Corridor</option>
  		 
	</select>
		<input type="submit" value="Submit">
		</form>

<p> Please choose your new ticket type:</p>

		<form action="updatetickettype4.jsp" method="post"><br> -->
	     <select name= updatetickettype id="Type">
 		 <option value="roundtrip">Round-Trip</option>
  		 <option value="weekly">Weekly</option>
	     <option value="oneway">One-Way</option>
  		 <option value="monthly">Monthly</option>
  		 
	</select>
		<input type="submit" value="Submit">
		</form>
		
<p> Please Enter the new Email:</p>

		<form action="updateemail4.jsp" method="post"><br>
			Email: <input type="text" name="newemail"><br>
					  <input type="submit" value="Submit">
		</form>
</body>


</html>