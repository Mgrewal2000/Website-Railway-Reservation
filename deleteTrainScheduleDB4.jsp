
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Delete a train schedule!</title>
</head>
<body>
<div class="adminbox">

<form action="deletefromDBtrainschedule4.jsp" method="post"><br>
   <p> Please enter the Train Schedule ID to delete from the database: <input type="text" name="trainscheduleid"required><br>
   
    
    <input type="submit" value="Delete the reservation">
</form>
<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" value="Return to Customer Representative Page">
</form>
</div>
</body>
</html>
