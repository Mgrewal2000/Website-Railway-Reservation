<%@ page import="java.sql.*" %>
<% 
 	
	String Transitname = request.getParameter("transitline");
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	try{
		int Trainnum = Integer.parseInt(request.getParameter("trainnum"));
		session.setAttribute("transitname", Transitname); 
		session.setAttribute("trainnum", Trainnum); 
	
 		Class.forName("com.mysql.cj.jdbc.Driver");
 		//gets connection to the database
 		con = DriverManager.getConnection("jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train","admin", "admin336");
 		//creates a statement object using connection
 		st = con.createStatement();
    
 		
 		rs = st.executeQuery("select * from trainSchedule t, trainHas h where t.trainscheduleID = h.trainscheduleID and t.transitLineName = '" + Transitname + "' and h.trainID = '"+ Trainnum +"'");
    	if(rs.next()){
    		response.sendRedirect("reservationfortrain.jsp");
    	
    	}
    	else{
    		response.sendRedirect("enterlineandname2.jsp");
   		}
    	rs.close();
    	st.close();
    	con.close();
	}
    catch (Exception e){
    	response.sendRedirect("enterlineandname2.jsp");
    }
   
%>

]

