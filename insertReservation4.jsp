<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String ticketType = request.getParameter("ticketType");
    String customerRep = request.getParameter("customerRep");
    String date = request.getParameter("date");
    String transitlinename = request.getParameter("transitlinename");
    String trainscheduleid = request.getParameter("trainscheduleid");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + username + "'");
    if(rs.next()){
    	st.executeUpdate("insert into reservationMakesHasA (username, ticketType, customerRep, date, trainScheduleID)  VALUES ('" + username + "','" + ticketType + "','" + customerRep + "','" + date +   "','" + trainscheduleid +"')");
    	out.println("Your reservation has been added. <a href='addResDB4.jsp'> Add another one?</a> OR  ");
   
    	out.println("<a href='RepresentativeSuccess4.jsp'>Return to Customer Representative page</a><br>");
    	
    	
    } else {
      
        response.sendRedirect("addResDB24.jsp");
        
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>