<%@ page import="java.sql.*" %>
<%
    String reservationID = request.getParameter("reservationid");
    String newticketType = request.getParameter("newticketType");
    String newcustomerRep = request.getParameter("newcustomerRep");
    String newdate = request.getParameter("newdate");
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from reservationMakesHasA where reservationID='" + reservationID + "'");
    if(rs.next()){
    	st.executeUpdate("update reservationMakesHasA set ticketType='" + newticketType +"' where reservationID='"+ reservationID+"'");
    	st.executeUpdate("update reservationMakesHasA set customerRep='" + newcustomerRep +"' where reservationID='"+ reservationID+"'");
    	st.executeUpdate("update reservationMakesHasA set date='" + newdate +"' where reservationID='"+ reservationID+"'");
    	
    	
    	out.println("Your reservation has been edited. <a href='editResDB4.jsp'> Edit another one?</a> OR  ");
   
    	out.println("<a href='RepresentativeSuccess4.jsp'>Return to the Admin page</a><br>");
    	
    	
    } else {
      
    	out.println("Invalid ReservationID! <a href='editResDB4.jsp'> Try Again</a>");
        
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>