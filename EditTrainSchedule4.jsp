<html>

<body>

<head>
	<title>Editing Customer</title>
</head>
<%@ page import="java.sql.*" %>
<% 
	
	
	String user = (String)request.getAttribute("User");
	out.println("Username Entered: " + user);
	
%>
<p> Please choose your new transit line name:</p>

		<form action="updatetransitlinenameedit4.jsp" method="post"><br> 
	     <select name= updatetransitlinename id="Type">
 		 <option value="Atlantic City Line">Atlantic City Line</option>
  		 <option value="Gladstone Branch">Gladstone Branch</option>
	     <option value="Raritan Valley Line">Raritan Valley Line</option>
  		 <option value="Morristown Line">Morristown Line</option>
  		 <option value="North Jersey Coast Line">North Jersey Coast Line</option>
  		 <option value="Northeast Corridor">Northeast Corridor</option>
  		 
	</select>
		<input type="submit" value="Submit">
		</form>

<p> Please Enter the new Email:</p>

		<form action="updateemailedit4.jsp" method="post"><br>
			Email: <input type="text" name="newemail"><br>
					  <input type="submit" value="Submit">
		</form>
		
<p> </p>

		
	<%    
	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
	ResultSet rs;
    rs = st.executeQuery("select stationName from stations");
%>	<form action="updatestationnameedit4.jsp" method="post"><br>
    <label for="updatestationedit">Choose your new station:</label>
    
    <select name= listofstations id="Type">
<% 
    while(rs.next()){
%>
 		 <option value="<%=rs.getString("stationName")%>"><%=rs.getString("stationName")%></option>	
<%
   }
%>
		</select>
		<input type="submit" value="Submit">
		</form>

<p> Please choose your station's new state:</p>

		<form action="updatestationstateedit4.jsp" method="post"><br> 
	     <select name= updatestationstateedit id="Type">
 		 <option value="NJ">NJ</option>
  		 <option value="NY">NY</option>
	     <option value="PA">PA</option>
	</select>
		<input type="submit" value="Submit">
		</form>
		
<p> Please enter in the new phone number:</p>

		<form action="updatephoneedit4.jsp" method="post"><br>
			<input type="text" name="newphone"><br>
					  <input type="submit" value="Submit">
		</form>
		
<p> </p>

</body>


</html>