<%@ page import="java.sql.*" %>
<%
    String trainscheduleid = request.getParameter("trainscheduleid");
	String numofseats = request.getParameter("numofseats");
	String onewayfare = request.getParameter("onewayfare");
	String roundtripfare = request.getParameter("roundtripfare");
	String monthlyfare = request.getParameter("monthlyfare");
	String childseniordiscount = request.getParameter("childseniordiscount");
	String disableddiscount = request.getParameter("disableddiscount");
	String transitlinename = request.getParameter("transitlinename");
	String weeklyfare = request.getParameter("weeklyfare");
    
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from trainSchedule where trainScheduleID='" + trainscheduleid + "'");
    if(rs.next()){
    	st.executeUpdate("update trainSchedule set oneWayFare='" + onewayfare +"' where trainScheduleID ='" + trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set roundTripFare='" + roundtripfare +"' where trainScheduleID ='" + trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set monthlyFare='" + monthlyfare +"' where trainScheduleID='"+ trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set weeklyFare='" + weeklyfare +"' where trainScheduleID='"+ trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set childSeniorDiscount='" + childseniordiscount +"' where trainScheduleID='"+ trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set disabledDiscount='" + disableddiscount +"' where trainScheduleID='"+ trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set numOfSeats='" + numofseats +"' where trainScheduleID='"+ trainscheduleid + "'");
    	st.executeUpdate("update trainSchedule set transitLineName='" + transitlinename +"' where trainScheduleID='"+ trainscheduleid + "'");
    	
    	
    	out.println("The train schedule information has been added. <a href='editTrainScheduleDB4.jsp'> Add another one?</a> OR  ");
    	out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
    	
    	
    } else {
      
    	out.println("Invalid Reservation ID!! <a href='editTrainScheduleDB4.jsp'> Try again</a>");
        
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>