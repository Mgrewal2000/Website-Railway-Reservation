<%@ page import="java.sql.*" %>
<% 
	int trainname = 0;
	String transitlinename = request.getParameter("transitline");
	try{
	trainname = Integer.parseInt(request.getParameter("trainnum"));
	Class.forName("com.mysql.cj.jdbc.Driver");
 %>
 
 
 <% 
 		try{
 		Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 		Statement st = con.createStatement();
 	
 		ResultSet rs;
 		
 		rs = st.executeQuery("select * from reservationMakesHasA r, trainSchedule t where r.trainScheduleID = t.trainScheduleID and t.transitLineName = '" + transitlinename  +"'");
    	if (rs.next()){
 			rs = st.executeQuery("select * from reservationMakesHasA r, trainSchedule t where r.trainscheduleID = t.trainscheduleID and t.transitLineName = '" + transitlinename  +"'");
 			
  			out.println("<a href='enterlineandname4.jsp'>Get another list based on another transit line name and train#?</a><br>");
  			out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
  			
    		if(!rs.next()){
    		out.println("Transitlinename or trainId does not have any customer(s)<br>");
    		out.println("<a href='enterlineandname4.jsp'>Return to enter again</a><br>");
    		out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
   		 	}
   
    		else{
    	
%>
  			<h2 align="center"><font><strong>List of all customers who have seats reserved on a given transit line name and train #: </strong></font></h2>
  			
 			<table align="center" cellpadding="3" cellspacing="3" border="10">
 			<tr>
 			</tr>
 				<tr bgcolor="#00e0f7">
 				<td><b>Reservationid</b></td>
 				<td><b>Date</b></td>
 				<td><b>Customer Representative</b></td>
 				<td><b>BookingFee</b></td>
 				<td><b>Username</b></td>
 				<td><b>TrainScheduleId</b></td>
 				<td><b>Tickettype</b></td>
 				<td><b>Number of Seats</b></td>
 			</tr>
 <%     
 				rs.previous();
 				while(rs.next()){
	 	
	 %>	
 				<tr bgcolor = "#bd3300">
    			<td><%=rs.getInt("reservationID") %></td>
        		<td><%=rs.getString("date") %></td>
        		<td><%=rs.getString("customerRep") %></td>
        		<td><%=rs.getString("bookingFee") %></td>
    			<td><%=rs.getString("username") %></td>
    			<td><%=rs.getInt("trainscheduleID") %></td>
    			<td><%=rs.getString("ticketType") %></td>
    			<td><%=rs.getString("numOfSeats") %></td>
    			</tr>
<%  	
    			}
   			}	
 	
 
		}
   	 	else{
    		out.println("The transitline or the trainnumber is not correct. (or this transitline does not have this train))");
    		out.println("<br><a href='enterlineandname4.jsp'>Return to enter again</a><br>");
    		out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
    	}
	}
    catch (Exception e){
		e.printStackTrace();
		
	}
%>
</table>

<% 
	}
	
	catch (Exception e)
	{
		out.println("Invalid input for train number<br>");
		out.println("<a href='enterlineandname4.jsp'>Return to enter again</a><br>");
    	out.println("<a href='adminsuccess4.jsp'>Return to the Admin page</a><br>");		
				
	}
%>	
<%
	con.close();
    st.close();  		
	rs.close();
    
%>
