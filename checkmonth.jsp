<%@ page import="java.sql.*" %>
<% 
try{
 	int month = Integer.parseInt(request.getParameter("month"));
	int year = Integer.parseInt(request.getParameter("year"));
	session.setAttribute("month", month); 
	session.setAttribute("year", year); 
	if(month < 13 && year <= 2020){
		response.sendRedirect("getsalesreport.jsp");
	}
	else{
		response.sendRedirect("entermonthagain.jsp");
	}
	
} catch (Exception e){
 		response.sendRedirect("entermonthagain.jsp");
 		
 	}
%>

