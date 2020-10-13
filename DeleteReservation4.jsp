<%@ page import="java.sql.*" %>
<%
    String deletereservationID = request.getParameter("reservationid");

   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from reservationMakesHasA where reservationID='" + deletereservationID + "'");
    if(rs.next()){
    	
    	st.executeUpdate("delete from reservationMakesHasA where reservationID='" + deletereservationID+ "'");
  
    	out.println("Your reservation has been deleted. <a href='deleteResDB4.jsp'> Delete another one?</a> OR  ");
   
    	out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
    	
    	
    } else {
      
    	out.println("Invalid ReservationID <a href='deleteResDB4.jsp'> Try Again</a>");
        
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>