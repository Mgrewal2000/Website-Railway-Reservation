<%@ page import="java.sql.*" %>


<style>
#div1
{
  height:30px;
  width:600px;
  padding:0;
  margin:0;
  background-color:gray;

}
#table1
{
   text-align:center;
   font-family:Arail;
   font-size:15pt;
   width: 600px;
   color:white;
   cellspacing:0px;
   cellpadding:0px;
}
#div2
{
   height:100px;
   width:600px;
   overflow-y:auto;
   overflow-x:hidden;

}
#table2
{
   text-align:center;
   font-family:Arail;
   font-size:10pt;
   width: 600px;
   color:black;
   cellspacing:0px;
   cellpadding:10px;
   height:100%;

}
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
<ul>
    <li><a href="tryloginsuccess.jsp" class="active">Home</a></li>
</ul>
<div id = "div1">
<table id = "table1">
<tr>
<th>Notification</th>

</tr>
</table>
</div>
<div id = "div2">
<table id = "table2">
<% 
    
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    String username = (String)session.getAttribute("user");
    //out.println(username);
    //System.out.println("Hello"); 		             
	
  
    
    rs = st.executeQuery("select n.Notification, n.TimeAdded from personCustomerEmployee p,"
    		            + " reservationMakesHasA r, Notifications n"
    		            +  " where p.username = r.username"
    		            +  " and   r.trainScheduleID = n.trainScheduleID"
    		            +  " and p.username = '" + username + "'"
    		            +  " ORDER BY n.TimeAdded");
               
    		            
    		//DESC LIMIT 2             
   
    		                     
    
    
    while(rs.next())
    {
    	
    	String notif = rs.getString("Notification");
    	
    	if(notif == null) notif = "No notifications yet";
    	
    	out.println("<tr>");
    	out.println("<td>" + notif + "</td>");	
    	out.println("</tr>");
    	  	
    }
    rs.close();
    st.close();
    con.close();
   
 %>
 </table>
 </div>
