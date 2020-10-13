<head>
	<meta charset="utf-8">
	<title> Best Transitlines </title>
	<link rel = "stylesheet" type="text/css" href="style.css">
</head>

<ul>
	<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			
</ul><br>
	
<%@ page import="java.sql.*" %>
<% 
	
	
	Connection con = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
		
	}
	catch (Exception e){
			e.printStackTrace();
			
	}
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select t.transitLineName, SUM(r.bookingFee) bookingFee from  trainSchedule t, reservationMakesHasA r where r.trainScheduleID = t.trainScheduleID group by t.transitLineName order by bookingFee DESC LIMIT 5");
	rs.next();
%>

		<br><br><h2 align="center"><font><strong> This is the Revenue done by each customer: </strong></font></h2>
 		<table align="center" cellpadding="5" cellspacing="5" border="3">
 			
 			<tr bgcolor = "#0a52ad">
 				<td><b>TransitLine name</b></td>
 				<td><b>Revenue</b></td>
 			</tr>
 <%
 		rs.previous();
 		while(rs.next()){
 %>
 			<tr bgcolor = white>
    			<td><%=rs.getString("transitLineName") %></td>
        		<td><%=rs.getString("bookingFee") %></td>
        	</tr>
       
<%
 		}
 		 
 %>
 		</table>
 		

<%
	rs.close();
	st.close();
	con.close();
%>
 		