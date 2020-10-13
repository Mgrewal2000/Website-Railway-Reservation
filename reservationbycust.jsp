<%@ page import="java.sql.*" %>
<html>
	<head>
		<meta charset="utf-8">
		<title> Reservation by customer </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
	<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			<li> <a href = "usernameforres.jsp"> Enter Again </a></li>
			
	</ul><br>
	


<% 
	Connection con = null;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
	}
	catch (Exception e){
	e.printStackTrace();
	
	}
	
	String userid = String.valueOf(session.getAttribute("username"));
%>
 	
<% 
 	Statement st = con.createStatement();
 	
 	ResultSet rs;
 
    	rs = st.executeQuery("select * from reservationMakesHasA where username='" + userid + "'");
   		if(rs.next()){
 %>
 		<br><br><h2 align="center"><font><strong>Reservations for a Customer <%= userid %>: </strong></font></h2>
 	<table align="center" cellpadding="3" cellspacing="3" border="3">
 			
 		<tr bgcolor="#0a52ad">
 			<td><b>Reservationid</b></td>
 			<td><b>date</b></td>
 			<td><b>CustomerRep</b></td>
 			<td><b>BookingFee</b></td>
 			<td><b>Username</b></td>
 			<td><b>TrainScheduleId</b></td>
 			<td><b>Tickettype</b></td>
 		</tr>
<% 		rs.previous();
    		while(rs.next()){
    	
%>
  		<tr bgcolor = white>
    		<td><%=rs.getInt("reservationID") %></td>
        	<td><%=rs.getString("date") %></td>
        	<td><%=rs.getString("customerRep") %></td>
       		<td><%=rs.getString("bookingFee") %></td>
    		<td><%=rs.getString("username") %></td>
    		<td><%=rs.getInt("trainscheduleID") %></td>
    		<td><%=rs.getString("ticketType") %></td>
    	</tr>
 <%  	
    		}
 		
   		}
    	else{
%>
    		<br><br><h2 align="center"><font><strong>  <%= userid %>: This customer has no Reservations </strong></font></h2>
<%
    	}
%>
	</table>

</html>

<%
	rs.close();
	st.close();
	con.close();
%>

