<%@ page import="java.sql.*" %>

<%
    String userid = request.getParameter("username");
    String pwd = request.getParameter("password");
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
    
	if(userid.equals("admin") && pwd.equals("admin336")){
    	response.sendRedirect("tryadminsuccess.jsp");
    	return;
    } else if(userid.equals("Manveer") && pwd.equals("password")){
		response.sendRedirect("RepresentativeSuccess4.jsp");
		return;
	}
    rs = st.executeQuery("select * from personCustomerEmployee where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
    	session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("tryloginsuccess.jsp");
    }
    else {
        response.sendRedirect("tryerror.jsp");
    }

%>

<%
	rs.close();
	st.close();
	con.close();
%>
