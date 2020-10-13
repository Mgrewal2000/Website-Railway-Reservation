<head>
	<meta charset="utf-8">
	<title> Best Customer </title>
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
	rs.next();
	String bestcust = rs.getString("username");
%>

		<br><br><h2 align="center"><font><strong> This is the Revenue done by each customer: </strong></font></h2>
 		<table align="center" cellpadding="5" cellspacing="5" border="3">
 			
 			<tr bgcolor = "#0a52ad">
 				<td><b>Customer name</b></td>
 				<td><b>Revenue</b></td>
 			</tr>
 <%
 		rs.previous();
 		while(rs.next()){
 %>
 			<tr bgcolor = white>
    			<td><%=rs.getString("username") %></td>
        		<td><%=rs.getString("bookingFee") %></td>
        	</tr>
       
<%
 		}
 		 
 %>
 		</table>
 		
<h2 align="center" style="color:blue;"> <p style="color:white; background-color: blue;"> <%= bestcust %> is the Best Customer! </p>
 
 <%
	rs.close();
	st.close();
	con.close();
%>
 			
 			