
<%@ page import="java.sql.*" %>
<head><link rel = "stylesheet" type="text/css" href = "style4.css">
    <title>Display All Questions</title>
</head>
<% 
 	
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 	Statement st = con.createStatement();
 	

 	ResultSet rs;
    rs = st.executeQuery("select Question from Questions");
%> 
	<div class="menuBox">
	<form action="insertanswer4.jsp" method="post"><br>
	<span class="label success">Please choose the question you want to answer from the drop-down list:</span>
   <p> <label for="listofquestions"> </label>
    
    <select name= listofquestions style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  "id="Type">
<% 
    while(rs.next()){
%>
 		 <option value="<%=rs.getString("Question")%>"><%=rs.getString("Question")%></option>	
<%
   }
%>	
	</select>	<br>
		<p> <span class="label success">Type in the answer:</span>
		
		<p><input type="text" style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  " name="answer"required><br>
	 	 <input type="submit" style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  "value="Submit Answer">
	 	</form>
	 	<form action="RepresentativeSuccess4.jsp" method = "post">
		<input type="submit" style="width:500px;font-size:8pt;padding:10px 20px; border:3px solid #ffffff  " value="Return to Customer Representative Page">
</form>
</div>


<%
	con.close();
    st.close();  		
	rs.close();
    
%>
