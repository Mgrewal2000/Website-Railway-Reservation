
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
	
		
		rs = st.executeQuery("select t.transitLineName, SUM(r.bookingFee) bookingFee from trainSchedule t, reservationMakesHasA r where t.trainScheduleID=r.trainScheduleID group by t.transitLineName order by bookingFee DESC");
		
	
%>
	<br><br><h2 align="center"><font><strong> Revenue For Transit Lines: </strong></font></h2>
 			<table align="center" cellpadding="5" cellspacing="5" border="3">

 			<tr bgcolor="#0a52ad">
 				<td><b>TransitLine</b></td>
 				<td><b>Revenue</b></td>
 				
 			</tr>
 <%
 		while(rs.next()){
 %>
 			<tr bgcolor = white>
    			<td><%=rs.getString("transitLineName") %></td>
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
 
 
 