
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Add information to a train schedule!</title>
</head>
<body>
<div class="adminbox">

<form action="insertTrainSchedule4.jsp" method="post"><br>
    <p>Please enter the Train Schedule ID (Values between 1-12 ONLY): <input type="text" name="trainscheduleid"required><br>
    <p> Please enter the number of seats available on the train: <input type="text" name="numofseats"required><br>
	<p>Please enter the fare for a one way(type 0 if not applied): <input type="text" name="onewayfare"required><br>
	<p>Please enter the fare for a round trip(type 0 if not applied): <input type="text" name="roundtripfare"required><br>
	<p>Please enter the fare for a monthly subscription(type 0 if not applied): <input type="text" name="monthlyfare"required><br>
	<p>Please enter the fare for a weekly subscription(type 0 if not applied): <input type="text" name="weeklyfare"required><br>
	<p>Please enter any child/senior discount((type 0 if not applied)): <input type="text" name="childseniordiscount"required><br>
	<p>Please enter any disabled discount((type 0 if not applied)): <input type="text" name="disableddiscount"required><br>
	
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
