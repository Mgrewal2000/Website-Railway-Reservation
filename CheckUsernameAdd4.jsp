<%@ page import="java.sql.*" %>
<%
    String userid = request.getParameter("username");
    Class.forName("com.mysql.cj.jdbc.Driver");
    //session.setAttribute("user", userid); // the username will be stored in the session
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if (rs.next()) {
        response.sendRedirect("insertReservation4.jsp");
    } else {
        out.println("Invalid username<a href='addResDB4.jsp'> try again</a>");
    }

%>

<%
	con.close();
    st.close();  		
	rs.close();
    
%>