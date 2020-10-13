<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Zain
  Date: 3/15/2020
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String question = request.getParameter("question");
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Questions where Question='" + question + "'");
    if (rs.next()) {
        //session.setAttribute("user", userid); // the username will be stored in the session
        out.println("<b>This question has been asked</b>");
        out.println("<br/>");
        out.println("<a href='Question(3).jsp'>Return to questions</a>");
       // response.sendRedirect("loginSuccess.jsp");
    } else {
       String query = "insert into Questions(Question) values ('" + question + "')";
       try
       {   
    	   st.executeUpdate(query);
    	   out.println("<b>A customer representative will answer your question as soon as possible.</b>");
    	   out.println("<br/>");
    	   out.println("<a href='Question(3).jsp'>Return to questions</a>");
       }
       catch(Exception e)
       {
    	   
       }
    }

%>
