<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("username");
	String	newemail = request.getParameter("newemail");
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
 	
 	ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("update personCustomerEmployee set email ='" + newemail +"' where username='"+ userid+"'");
    }
    
    else{
    out.println("This username does not exist! <ahref='EditReservation4.jsp'>Try Again</a>");
    }
    
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>