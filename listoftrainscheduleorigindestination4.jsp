<%@ page import="java.sql.*" %>
<% 
 	
	String origin = request.getParameter("origin");
	String destination = request.getParameter("destination");
	Class.forName("com.mysql.cj.jdbc.Driver");
 	%>
 	
 
 <% 
 	Connection con=null;
 	Statement st=null;
 	ResultSet rs;
 	
 	try
 	{
 		
 	con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	
 	st = con.createStatement();
 	}
 	 catch (Exception e){
 		e.printStackTrace();
 	}
 
   
 		//rs = st.executeQuery("select s.stationName, a.arrivalTime, a.departureTime from stations s, stopsAt a where a.stationID IN '"+ ("'select s.stationID from stations s where s.stationName='" + origin + "' OR s.stationName='" + destination + "'"));
    	rs = st.executeQuery("Select * from stopsAt a, stations b where b.stationID = a.stationID and a.trainScheduleID IN (SELECT k.trainScheduleID from stations sp, stopsAt k where sp.stationName='" + origin + "' and sp.stationID = k.stationID)order by trainScheduleID");
   		if(!rs.next()){
			out.println("This customer has no reservation<br>");
			out.println("<a href='usernasmeforres4.jsp'>Return to enter the username again</a><br>");
			out.println("<a href='adminsuccess4.jsp'>Return to the Admin page</a><br>");
		}
    	else{
 %>
 		<h2 align="center"><font><strong>List of train schedules based on the entered origin and destination: </strong></font></h2>
 		<table align="center" cellpadding="3" cellspacing="3" border="3">
 		<tr>

 		</tr>
 		<tr bgcolor="#00e0f7">
 		<td><b>Arrival Time</b></td>
 		<td><b>Departure Time</b></td>
 		<td><b>Stationame</b></td>
 		<td><b>TrainScheduleID</b></td>
 		
 		
 		</tr>
<% 		rs.previous();
            
    		while(rs.next()){
    	
%>
  			<tr bgcolor = "#bd3300">
  			<td><%=rs.getString("arrivalTime") %></td>
  			<td><%=rs.getString("departureTime") %></td>
    		<td><%=rs.getString("stationName") %></td>
    		<td><%=rs.getInt("trainScheduleID") %></td>
        	
       		
    	</tr>
 <%  	
    		}
 	
   		}
  
 

%>
</table>
<%
	con.close();
    st.close();  		
	rs.close();
    
%>
    
