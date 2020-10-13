
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
</style>
<div id = "div1">
<table id = "table1">
<tr>
<th>Question</th>
<th>Answer</th>
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
    rs = st.executeQuery("select * from Questions");
    while(rs.next())
    {
    	String question = rs.getString("Question");
    	String answer = rs.getString("Answer");
    	if(answer == null) answer = "No answer yet";
    	out.println("<tr>");
    	out.println("<td>" + question + "</td>");
    	out.println("<td>" + answer + "</td>");
    	out.println("</tr>");
    	  	
    }
    rs.close();
    st.close();
    con.close();
 %>
 </table>
 </div>
 <a href='Question(3).jsp'>Return to questions</a>
