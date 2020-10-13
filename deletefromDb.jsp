<%@ page import="java.sql.*" %>
<% 
 	
	String userid = request.getParameter("username");
	Connection con = null;
	try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
	
	}
	catch (Exception e){
		e.printStackTrace();
		
	}
	Statement st = con.createStatement();
	ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if(rs.next()){
    	st.executeUpdate("delete from personCustomerEmployee where username='" + userid + "'");
    	response.sendRedirect("confirmdeleteDB.jsp");
    	
    }
    else{
    	response.sendRedirect("wrongusername.jsp");
   	}
    
    
   
%>

<%
	rs.close();
	st.close();
	con.close();
%>


