<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("username");
	String	tickettype = request.getParameter("tickettype");
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
 	
 	ResultSet rs;
    rs = st.executeQuery("select * from reservationMakesHasA where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("update reservationMakesHasA set ticketType='" + tickettype +"' where username='"+ userid+"'");
    }
    
    else{
    	 out.println("This username does not exist! <a href='EnterUsername4.jsp'> Try Again</a>");
    }
    
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>