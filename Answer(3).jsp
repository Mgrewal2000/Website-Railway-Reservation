<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: Zain
  Date: 3/15/2020
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String question = request.getParameter("question");
   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Questions where Question='" + question + "'");
    if (rs.next()) {
        //session.setAttribute("user", userid); // the username will be stored in the session
        System.out.println("");
        String answer = rs.getString("Answer");
        if(answer == null)
        {
        	out.println("<b>There is no answer to this question yet</b>");
        	out.println("<br/>");
        	out.println("<a href='Question(3).jsp'>Return to questions</a>");
        }
        else
        {
        out.println("Customer Rep's Answer: " + answer);
        out.println("<br/>");
        out.println("<a href='Question(3).jsp'>Return to questions</a>");
        }
       // response.sendRedirect("loginSuccess.jsp");
    } else {
    	
    	out.println("<b>Here are the list of questions that are related to your question</b>");
    	out.println("<br/>");
    	
    	%>
    	       
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
        
        
        rs = st.executeQuery("select * from Questions");
        while(rs.next())
        {
        	String quest = rs.getString("Question");
        	String lowerquest = quest.toLowerCase();
        	String lowerorigquest = question.toLowerCase();
        	String answer = rs.getString("Answer");
        	
        	if(answer == null) answer = "No answer yet";
        	if(lowerquest.contains(lowerorigquest))
        	{
        	out.println("<tr>");
        	out.println("<td>" + quest + "</td>");
        	out.println("<td>" + answer + "</td>");
        	out.println("</tr>");
        	}
        	  	
        }
   // }
   
    
    rs.close();
    st.close();
    con.close();
%>
</table>

 </div>
 <% 
    out.println("<a href='Question(3).jsp'>Return to questions</a>");
 }
 %>
