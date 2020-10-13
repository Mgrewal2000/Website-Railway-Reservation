<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("Username");
	String updatereservationdate = request.getParameter("updatereservationdate");
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
 	
 	ResultSet rs;
 	rs = st.executeQuery("select * from reservationMakesHasA where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("update reservationMakesHasA set date='" + updatereservationdate +"' where username='"+ userid+"'");
    	out.println("The new date has been updated<br>");
    	out.println("<a href='EnterUsername4.jsp'>Return to make more changes</a><br>");
    	
    }
    else{
    out.println("Invalid Entry! <a href='EditReservation4.jsp'> Try Again</a>");
    }
    
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>