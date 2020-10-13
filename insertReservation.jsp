<%@ page import="java.sql.*" %>
<%
    double bookingFee = 3.25;
    String transitLineName = request.getParameter("transitLineName");
    String ticketType = request.getParameter("ticketType");
    String discount = request.getParameter("discount");
    String userID = (String) session.getAttribute("user");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery(
                    "select t.trainScheduleID, t.oneWayFare, t.roundTripFare, t.weeklyFare, t.monthlyFare, t.childSeniorDiscount, t.disabledDiscount " +
                    "from trainSchedule as t, routes as r, " +
                    "     stations as s1, stations as s2, stopsAt as st1, stopsAt st2 " +
                    "where numOfSeats > 0 and t.transitLineName ='" + transitLineName + "'" +
                    "  and t.transitLineName = r.transitLineName " +
                    "  and s1.stationID = stationIDOrigin and s2.stationID = stationIDDestination " +
                    "  and st1.stationID = stationIDOrigin and st2.stationID = stationIDDestination " +
                    "  and st1.trainScheduleID = t.trainScheduleID and st2.trainScheduleID = t.trainScheduleID " +
                    "order by numOfSeats " +
                    "desc limit 1;");
    if(rs.next()){
        int trainScheduleID = rs.getInt("trainScheduleID");
        double totalFee;
        if(discount == null || discount.equals("none")){
            totalFee = rs.getDouble(ticketType);
        } else if(discount.equals("childSeniorDiscount")){
            totalFee = ((100 - rs.getDouble("childSeniorDiscount")) / 100) * rs.getDouble(ticketType);
        } else {
            totalFee = ((100 - rs.getDouble("disabledDiscount")) / 100) * rs.getDouble(ticketType);
        }

        totalFee += bookingFee;

        totalFee *= 100;
        totalFee = (int) totalFee;
        totalFee /= 100;

        String ticketTypef1;

        if ("oneWayFare".equals(ticketType)) {
            ticketTypef1 = "One-Way";
        } else if ("roundTripFare".equals(ticketType)) {
            ticketTypef1 = "Round-Trip";
        } else if ("weeklyFare".equals(ticketType)) {
            ticketTypef1 = "Weekly";
        } else {
            ticketTypef1 = "Monthly";
        }

        st.executeUpdate(
                "insert into reservationMakesHasA (date, bookingFee, username, trainScheduleID, ticketType) " +
                "values ("+ "'" + new java.sql.Timestamp(System.currentTimeMillis()) + "'" + ", " + totalFee + ", " + "'" + userID + "'" + ", " + trainScheduleID + ", " + "'" + ticketTypef1 + "'" + ")");
        st.executeUpdate("update trainSchedule set numOfSeats = numOfSeats - 1 where trainScheduleID = " + trainScheduleID);
        response.sendRedirect("reservation.jsp");
    } else {
        out.println("All Trains going along " + transitLineName + " are full. Check back with us later. <a href='reservation.jsp'>Back</a>");
    }
%>
<%
    rs.close();
    st.close();
    con.close();
%>