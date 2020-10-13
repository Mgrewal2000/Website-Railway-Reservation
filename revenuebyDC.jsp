	<head>
		<meta charset="utf-8">
		<title> Admin Page </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
	<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			
	</ul><br>
	
<%@ page import="java.sql.*" %>
<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try{
		con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
		st = con.createStatement();
		
		rs = st.executeQuery("select s.stationCity, SUM(m.bookingFee) bookingFee from routes r, trainSchedule t, reservationMakesHasA m, stations s where r.transitLineName = t.transitLineName and t.trainScheduleID = m.trainScheduleID and r.stationIDDestination = s.stationID group by s.stationCity order by bookingFee DESC");
		
	
%>
	<br><br><h2 align="center"><font><strong> Revenue For Destination City: </strong></font></h2>
 			<table align="center" cellpadding="5" cellspacing="5" border="3">

 			<tr bgcolor="#0a52ad">
 				<td><b>DestinationCity</b></td>
 				<td><b>Revenue</b></td>
 				
 			</tr>
<%
 		while(rs.next()){
%>
 			<tr bgcolor = white>
    			<td><%=rs.getString("stationCity") %></td>
        		<td><%=rs.getString("bookingFee") %></td>
        	</tr>
<% 	
 		}
	}
	catch (Exception e){
			e.printStackTrace();
			
	}

%>
 
<%
	rs.close();
	st.close();
	con.close();
	
%>

 