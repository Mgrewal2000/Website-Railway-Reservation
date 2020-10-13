<%@ page import="java.sql.*" %>
<% 
 	
	String userid = (String)session.getAttribute("Username");
	String newuserid = request.getParameter("NewUsername");
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
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + newuserid + "'");
    if(rs.next()){
    	response.sendRedirect("editunametaken.jsp");
    }
    else{
    	st.executeUpdate("update personCustomerEmployee set username='" + newuserid +"' where username='"+ userid+"'");
    	response.sendRedirect("editunamechanged.jsp");
    }
%>

<%
	rs.close();
	st.close();
	con.close();
%>
