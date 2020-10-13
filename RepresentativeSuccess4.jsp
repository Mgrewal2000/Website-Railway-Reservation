<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel = "stylesheet" type="text/css" href = "style4.css">
<meta charset="UTF-8">
<title>Customer Representative - Help?</title>
<style>
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }

    li{
        float: right;
    }

    li a {
        display: inline-block;
        color: black;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    li a:hover {
        background-color: skyblue ;

    }

    .active{
        background-color: red;

    }
</style>
</head>
<body>

<body>
    <ul>
        <li><a href="trylogout.jsp" class="active">LogOut</a></li>
    </ul>
<div class="menuBox">
<h2 class="title" style = "text-align:absolute; font-size:30pt">Welcome Back, Manveer Singh </h2>
<p><form action="addResDB4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff  " value="Add a reservation"> 
</form>

<p><form action="editResDB4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff  "  value="Edit a reservation"> 
</form>

<p><form action="deleteResDB4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff  " value="Delete a reservation"> 
</form>

<p><form action="addTrainScheduleDB4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff  "  value="Add information for train schedules"> 
</form>

<p><form action="editTrainScheduleDB4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff "  value="Edit information for train schedules"> 
</form>

<p><form action="deleteTrainScheduleDB4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff "  value="Delete information for train schedules"> 
</form>

<p><form action="questionslist4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff "  value="Reply to customer questions"> 
</form>

<p><form action="enteroriginanddestination4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff "  value="Produce a list of train schedules for a specific origin and destination"> 
</form>

<p><form action="entertrainstation4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff "   value="Produce a list of train schedules for a given station (as origin/destination)"> 
</form>

<p><form action="enterlineandname4.jsp" method="post"> 
<input type = "submit" style="width:500px;font-size:11pt;padding:10px 20px; border:3px solid #ffffff "  value="Produce a list of all customers who have seats reserved on a given transit line and train "> 
</form>

</div>

</body>
</html>