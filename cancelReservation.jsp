<%@ page import="java.sql.*" %>
<%
    String userid = (String) session.getAttribute("user");
    String resID = request.getParameter("reservationID");
    Connection con = null;
    Statement st = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
        st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from reservationMakesHasA where reservationID = " + resID + " and username='" + userid + "'");
        if (rs.next()) {
            int trainSchedID = rs.getInt("trainScheduleID");
            st.executeUpdate("delete from reservationMakesHasA where reservationID = " + resID);
            st.executeUpdate("update trainSchedule set numOfSeats = numOfSeats + 1 WHERE trainScheduleID = " + trainSchedID);
            response.sendRedirect("reservation.jsp");
        } else {
            out.println("Invalid ReservationID <a href='reservation.jsp'>try again</a>");
        }
%>

<%
        rs.close();
        st.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>