<%@ page import="java.sql.*" %>
<% 
 	
	String userid = request.getParameter("username");
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	//gets connection to the database
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	//creates a statement object using connection
 	Statement st = con.createStatement();
    
 	ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("delete from reservationMakesHasA where username='" + userid + "'");
    	out.println("The reservation has been successfully deleted!<a href='EnterUserDelete4.jsp'> Delete Another One?</a>");
    	
    }
    else{
    	out.println("This username does not exist! <a href='EnterUserDelete4.jsp'> Try Again</a>");
   	}
   
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>
