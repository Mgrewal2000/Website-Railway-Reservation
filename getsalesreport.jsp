<%@ page import="java.sql.*" %>
<% 
	Connection con = null;
	Statement st = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
		st = con.createStatement();
	}
	
	catch (Exception e){
		e.printStackTrace();
		
	}
	
 	ResultSet rs = null;
	try{
 	int month = (Integer) session.getAttribute("month");
	int year = (Integer) session.getAttribute("year");
	
 	
 	//gets connection to the database
%>

	<head>
		<meta charset="utf-8">
		<title> Sales Report </title>
		<link rel = "stylesheet" type="text/css" href="style.css">

	</head>
	<ul>
			<li> <a href = "tryadminsuccess.jsp" class = "active"> Admin Home </a></li>
			<li> <a href = "entermonth.jsp"> Enter Again </a></li>
			
	</ul><br>
	
	
	
 <% 	
 	double sum = 0;
 	
 	//creates a statement object using connection
 	
 	
    rs = st.executeQuery("select * from reservationMakesHasA where YEAR(date) = '"+ year + "' and MONTH(date) = '"+ month +"' and DAY(date) >= '"+ 1 +"' and DAY(date) < '"+ 32 + "'");
   	if(rs.next()){
   		rs.previous();
  %>
   	
   		<br><br><h2 align="center"> <font><strong> Sales Report for the month: </strong> </font></h2>
		<table align="center" cellpadding="3" cellspacing="3" border="5">
		<tr bgcolor="#0a52ad">
			<td><b>Reservationid</b></td>
			<td><b>date</b></td>
			<td><b>CustomerRep</b></td>
			<td><b>BookingFee</b></td>
			<td><b>Username</b></td>
			<td><b>TrainScheduleId</b></td>
		</tr>
<% 
   		while(rs.next()){
  
 		sum += rs.getDouble("bookingFee");
  		
%>
 	<tr bgcolor =  white>
  		<td><%=rs.getInt("reservationID") %></td>
        <td><%=rs.getString("date") %></td>
        <td><%=rs.getString("customerRep") %></td>
        <td><%=rs.getString("bookingFee") %></td>
    	<td><%=rs.getString("username") %></td>
    	<td><%=rs.getInt("trainscheduleID") %></td>
    </tr>
     
    	
<% 
  }
%>
   	 <h2 align="center" style="color:blue;"> <p style="color:white;"> This is the Revenue for the month: <%= sum %></p>
<% 
   	}
   	else{
%>
   	<br><br><h2 align="center" style="color:blue;"> <p style="color:white;"> There was no reservation for this month: <%= sum %></p>
<%
   	}
 
 	} catch (Exception e){
 		response.sendRedirect("entermonthagain.jsp");
 		
 	}
%>

 </table>
 <br/>
 
 <%
 	rs.close();
	st.close();
	con.close();
%>
 
 
 
 
 