<%@ page import="java.sql.*" %>
<%
    String question = (String)request.getParameter("listofquestions"); 
    String answer = (String)request.getParameter("answer");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Questions where Question='" + question + "'");
    if(rs.next()){
    	st.executeUpdate("update Questions set Answer='" + answer +"' where Question='"+ question+"'");
    	out.println("The answer has been added to the database and the customer will see it on their page");
    	out.println("<a href='questionslist4.jsp'> Answer another question??</a>");
    	out.println("<a href='RepresentativeSuccess4.jsp'> Go back to the customer rep page</a>");
    	
    } else {
        out.println("Couldn't reply to the question. <a href='questionslist4.jsp'> Try again??</a>");
        out.println("<a href='RepresentativeSuccess4.jsp'> Go back to the customer rep page</a>");
    }
%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>