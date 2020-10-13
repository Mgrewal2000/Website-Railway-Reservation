<%@ page import="java.sql.*" %>
<%
    String reservationID =(String) request.getParameter("reservationid");



    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from reservationMakesHasA where reservationID='" + reservationID + "'");
    if (rs.next()) {
    	//session.setAttribute("Username", userid);
    	//out.println((reservationID);
    	
        response.sendRedirect("EditReservation4.jsp");
        
        

    } else {
        out.println("Invalid reservationIDe<a href='EnterReservationID4.jsp'> try again</a>");
        out.println("ReservationID Entered: "+  reservationID );
    }

%>

<%
	rs.close();
    st.close();
    con.close();
%>
