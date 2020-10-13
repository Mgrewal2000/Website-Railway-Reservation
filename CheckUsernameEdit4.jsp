<%@ page import="java.sql.*" %>
<%
    String userid = request.getParameter("User");
	request.setAttribute("User", userid);
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from personCustomerEmployee p, trainHas h, trainSchedule s,stations t where h.trainScheduleID = s.trainScheduleID and p.username = '" + userid + "'");
    if (rs.next()) {
    	
        response.sendRedirect("EditTrainSchedule4.jsp");
        
        

    } else {
        out.println("Invalid username<a href='EnterUsernameEdit4.jsp'> try again</a>");
        out.println("Username Entered: "+  userid);
    }

%>
<%
	con.close();
    st.close();  		
	rs.close();
    
%>