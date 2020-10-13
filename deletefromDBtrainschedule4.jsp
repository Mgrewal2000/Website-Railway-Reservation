<%@ page import="java.sql.*" %>
<%
    String deletetrainscheduleid = request.getParameter("trainscheduleid");

   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from trainSchedule where trainScheduleID='" + deletetrainscheduleid + "'");
    if(rs.next()){
    	
    	st.executeUpdate("delete from trainSchedule where trainScheduleID='" + deletetrainscheduleid + "'");
  
    	out.println("The train schedule has been deleted. <a href='deleteTrainScheduleDB4.jsp'> Delete another one?</a> OR  ");
   
    	out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
    	
    	
    } else {
      
    	out.println("Invalid ReservationID <a href='deleteTrainScheduleDB4.jsp'> Try Again</a>");
        
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>