<%@ page import="java.sql.*" %>
<%
	String ssn = request.getParameter("ssn");
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
    String name = request.getParameter("Name");
    String state = request.getParameter("State");
    String city = request.getParameter("City");
    String phonenum = request.getParameter("Phonenum");
    String streetName = request.getParameter("StreetName");
    String zipcode = request.getParameter("Zipcode");
    String email = request.getParameter("Email");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "'");
    if(rs.next()){
        response.sendRedirect("usernametakenemployee.jsp");
        return;
    } else {
        st.executeUpdate("insert into personCustomerEmployee (ssn, username, password, name, phonenumber, streetname, zipcode, state, city, email)  VALUES ('" + ssn + "', '" + userid + "','" + pwd + "','" + name + "','" + phonenum + "','" + streetName + "','" + zipcode + "','" + state + "','" + city + "','" + email + "')");
    	response.sendRedirect("confirmaddDBemployyee.jsp");
    }
%>

<%
	rs.close();
	st.close();
	con.close();
%>