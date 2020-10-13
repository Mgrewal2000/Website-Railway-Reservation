	<head>
		<meta charset="utf-8">
		<title> Admin Page </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
	<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			
	</ul><br>
	
<%@ page import="java.sql.*" %>
<% 
	
	
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
		rs = st.executeQuery("select p.username, SUM(r.bookingFee) bookingFee from personCustomerEmployee p, reservationMakesHasA r where r.username = p.username group by p.username order by bookingFee DESC");
		
	
%>
	<br><br><h2 align="center"><font><strong> Revenue Done by each Customer: </strong></font></h2>
 			<table align="center" cellpadding="5" cellspacing="5" border="3">
 	
 			<tr bgcolor = "#0a52ad">
 				<td><b>Customer name</b></td>
 				<td><b>Revenue</b></td>
 				
 			</tr>
 <%
 		while(rs.next()){
 %>
 			<tr bgcolor = white>
    			<td><%=rs.getString("username") %></td>
        		<td><%=rs.getString("bookingFee") %></td>
        	</tr>
<% 	
 		}
%>

<%
	rs.close();
	st.close();
	con.close();
%>

 