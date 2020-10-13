<%@ page import="java.sql.*" %>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
<head>
    <link rel="stylesheet" href="reservation.css">
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        li{
            float: right;
        }

        li a {
            display: inline-block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: skyblue ;

        }

        .active{
            background-color: red;

        }
    </style>
    <title>Reservations</title>
</head>
<ul>
    <li><a href="tryloginsuccess.jsp" class="active">Home</a></li>
</ul>
<form method="post">
    <table id="tableReservation">
        <tr>
            <th rowspan="2">Reservation ID</th>
            <th rowspan="2">Date</th>
            <th rowspan="2">Total Fare</th>
            <th rowspan="2">Ticket Type</th>
            <th rowspan="2">Route</th>
            <th colspan="2">Origin Station</th>
            <th colspan="2">Destination Station</th>
        </tr>
        <tr>
            <th>Arrival</th>
            <th>Departure</th>
            <th>Arrival</th>
            <th>Departure</th>
        </tr>

        <%
            String userID = (String) session.getAttribute("user");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("" +
                    "select reservationID, date, bookingFee, ticketType, r.transitLineName, " +
                    "       s1.stationName, s2.stationName, st1.arrivalTime, st1.departureTime, st2.arrivalTime, st2.departureTime " +
                    "from reservationMakesHasA as res, trainSchedule as t, routes as r, " +
                    "     stations as s1, stations as s2, stopsAt as st1, stopsAt st2 " +
                    "where username='" + userID + "' " +
                    "  and res.trainScheduleID = t.trainScheduleID " +
                    "  and st1.trainScheduleID = res.trainScheduleID and st2.trainScheduleID = res.trainScheduleID " +
                    "  and t.transitLineName = r.transitLineName " +
                    "  and s1.stationID = stationIDOrigin and s2.stationID = stationIDDestination " +
                    "  and st1.stationID = stationIDOrigin and st2.stationID = stationIDDestination " +
                    "order by date desc;");
            while(rs.next()){
        %>
        <tr>
            <td rowspan="2"><%= rs.getInt("reservationID") %></td>
            <td rowspan="2"><%= rs.getDate("date") %></td>
            <td rowspan="2"><%= String.format("%.2f", rs.getDouble("bookingFee")) %></td>
            <td rowspan="2"><%= rs.getString("ticketType") %></td>
            <td rowspan="2"><%= rs.getString("r.transitLineName") %></td>
            <td colspan="2"><%= rs.getString("s1.stationName") %></td>
            <td colspan="2"><%= rs.getString("s2.stationName") %></td>
        </tr>
        <tr>
            <td><%= rs.getString("st1.arrivalTime") %></td>
            <td><%= rs.getString("st1.departureTime") %></td>
            <td><%= rs.getString("st2.arrivalTime") %></td>
            <td><%= rs.getString("st2.departureTime") %></td>
        </tr>
        <%
            }
        %>
    </table>
</form><br><br>

Cancel Reservation<br>
<form action="cancelReservation.jsp" method="post">
    Reservation ID: <input type="number" name="reservationID" required>
    <input type="submit" name="Cancel">
</form><br><br>

Make Reservation
<form action="insertReservation.jsp">
    <label for="transitLineName">Choose a Transit Line:</label>
    <select id="transitLineName" name="transitLineName">
        <%
            rs = st.executeQuery("select distinct transitLineName from trainSchedule");
            while(rs.next()){
        %>
        <option value="<%= rs.getString("transitLineName") %>"><%= rs.getString("transitLineName") %></option>
        <%
            }
        %>
    </select><br><br>

    <label for="ticketType">Choose Ticket Type:</label>
    <select id="ticketType" name="ticketType">
        <option value="oneWayFare">One-Way</option>
        <option value="roundTripFare">Round-Trip</option>
        <option value="weeklyFare">Weekly</option>
        <option value="monthlyFare">Monthly</option>
    </select><br><br>

    Choose those that apply:<br>
    <label for="childSeniorDiscount"></label>
    <input type="radio" name="discount" id="childSeniorDiscount" value="childSeniorDiscount">Child or Senior<br>
    <label for="Disabled"></label>
    <input type="radio" name="discount" id="Disabled" value="disabled">Disabled<br>
    <label for="None"></label>
    <input type="radio" name="discount" id="None" value="none">None<br><br>
    <input type="submit" name="Submit"><br>
    <small>(Note: $3.25 booking fee will be added to ticket price)</small>
</form>

<%
    rs.close();
    st.close();
    con.close();
%>
<%
    }
%>