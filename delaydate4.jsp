<%@ page import="java.sql.*" %>
<%
    String trainscheduleid = request.getParameter("trainscheduleid");
	String notification = " " + trainscheduleid + " has been delayed ";
	String stationid = request.getParameter("stationid");
	String delayarrivaldate = request.getParameter("delayarrivaldate");
	String delaydeparturedate = request.getParameter("delaydeparturedate");
	String currentdatetime = request.getParameter("currentdatetime");
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from stopsAt where trainScheduleID='" + trainscheduleid + "'");
    if(rs.next()){
    	
    	st.executeUpdate("update stopsAt set departureTime ='" + delaydeparturedate +"' where trainScheduleID='"+ trainscheduleid + "' and stationID='" + stationid + "'");
    	
    	st.executeUpdate("update stopsAt set arrivalTime ='" + delayarrivaldate +"' where trainScheduleID='"+ trainscheduleid + "' and stationID='" + stationid + "'");
    	
    	st.executeUpdate("insert into Notifications (trainScheduleID, Notification, TimeAdded)  VALUES ('" + trainscheduleid + "','" + notification + "','" + currentdatetime + "')");
    	
   		out.println("The arrival/date has been delayed. <a href='enterdelaydate4.jsp'> Delay another one??</a> OR  ");
    	out.println("<a href='RepresentativeSuccess4.jsp'>Return to customer representative page</a><br>");
    	
    	
    
    
    
    }
    
    	
    	
    	
    else {
      
    	out.println("Invalid trainscheduleID or transtationID<a href='enterdelaydate4.jsp'> Try again</a>");
        
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>