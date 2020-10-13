<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("Username");
	String updatetransitlinename = request.getParameter("updatetransitlinename");
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
 	
 	ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("update trainSchedule set transitLineName ='" + updatetransitlinename +"' where username='"+ userid+"'");
    	out.println("The new date has been updated<br>");
    	out.println("<a href='EnterUsername4.jsp'>Return to make more changes</a><br>");
    	
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