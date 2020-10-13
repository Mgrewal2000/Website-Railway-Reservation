<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Zain
  Date: 3/15/2020
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
    String adminuser = "admin";
    String adminpwd = "admin336";
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
    if(userid.equals(adminuser) && pwd.equals(adminpwd)){
    	response.sendRedirect("adminsuccess.jsp");
    }
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
    	session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("loginSuccess.jsp");
    	}
    else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }

%>

<%
	rs.close();
	st.close();
	con.close();
%>