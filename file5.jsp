
<!-- 	Sasanth Tammareddi -->



<!DOCTYPE html>


<html lang="en">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<head>
<meta charset="UTF-8">
<title>Train Schedule</title>
<link rel="stylesheet" href="./file5.css">
	<style>
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
</head>

	<ul>
		<li><a href="tryloginsuccess.jsp" class="active"> Home</a></li>
	</ul>

<body id="body">




	<%
		// connecting to the DataBase
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager
				.getConnection(
						"jdbc:mysql://cs336db.cjjakxikp6k6.us-east-2.rds.amazonaws.com:3306/Train",
						"admin", "admin336");

		Statement st = con.createStatement();

		// getting Origins from DataBase will be the same route for another train at further time
		ResultSet origins;
		
		
		
		origins = st
				.executeQuery("SELECT	stations.stationName FROM Train.routes JOIN Train.stations ON routes.stationIDOrigin = stations.stationID");

		String oriArr[] = new String[6];
		int i = 0;
		
		while (origins.next()) {
			oriArr[i] =  origins.getString("stationName");
			i++;

		};
		
		
		// getting Destinations from DataBase
		i = 0;
		ResultSet destinations;
		destinations = st
				.executeQuery("SELECT stations.stationName FROM Train.routes JOIN Train.stations ON routes.stationIDDestination = stations.stationID");

		String destArr[] = new String[6];
	

		while (destinations.next()) {
			destArr[i]  =  destinations.getString("stationName");
			i++;

		};

		
		// getting one Way Fare price from DataBase
		i = 0;
		ResultSet fare;
		fare = st
				.executeQuery(
						"SELECT oneWayFare,trainScheduleID FROM Train.trainSchedule LIMIT 12");

		 int fareArr[];
		    fareArr = new int [12];
			int ki = 0;
			
		    while(fare.next()){
		    	int oneWayFare = fare.getInt("oneWayFare");
		    	
		    	fareArr[ki] = oneWayFare;
		    	ki++;
		    }
		    
		
		    
		    
		    
		    // Dep time 
		    i = 0;
		    ResultSet depTime;
		depTime = st
				.executeQuery(
						"SELECT stopsAt.departureTime, stopsAt.stationID FROM Train.stopsAt JOIN Train.routes WHERE routes.stationIDOrigin = stopsAt.stationID ;");

		 String depArr[];
		 
		    depArr = new String [12];
		    while(depTime.next()){
		    	String depTimee = depTime.getString("departureTime");
		    	String depT [] = depTimee.split(" ");
		    			
		    	depArr[i]= depT[1];
		    	i++;
		    	
		    }
		    
		    
		    // Arrival Time 
		    i = 0;
		    ResultSet arrTime;
		arrTime = st
				.executeQuery(
						"SELECT stopsAt.arrivalTime, stopsAt.stationID FROM Train.stopsAt JOIN Train.routes WHERE routes.stationIDOrigin = stopsAt.stationID ;");

		 String arrArr[];
		 
		 
		
		 String dot[];
		 	dot = new String[12];
		 	
		    arrArr = new String [12];
		    while(arrTime.next()){
		    	String arrTimee = arrTime.getString("arrivalTime");
		    	String arrT [] = arrTimee.split(" ");
		    	dot[i] = arrT[0];	// storing other part in date of travel array
		    	arrArr[i]= arrT[1];
		    	i++;
		    	
		    }
		    
		    
		    
		  
		    
	

		    
		    
		    
		// train Array slots 
		String arrstop1[] =  new String[6];
		
		String arrstop2[]  = new String[6];
		
		String arrstop3[]=  new String[6];
		
		String arrstop4[] = new String[6];
		
		String arrstop5[] = new String[6];

		String arrstop6[] = new String[6];
		

		
		//get Train 1 stops from Database 
		i = 0;
		ResultSet stops1;
		stops1 = st
				.executeQuery(" SELECT stations.stationName FROM Train.stopsAt JOIN Train.stations ON stopsAt.stationID = stations.stationID WHERE  trainScheduleID = 1 LIMIT 6");
		
		while (stops1.next()) {
			arrstop1[i] = stops1.getString("stationName");
			i++;

		}

		//get Train 2 stops from Database
		i = 0;
		ResultSet stops2;
		stops2 = st
				.executeQuery(" SELECT stations.stationName FROM Train.stopsAt JOIN Train.stations ON stopsAt.stationID = stations.stationID WHERE  trainScheduleID = 2 LIMIT 6");

		

		while (stops2.next()) {
			arrstop2[i]  = stops2.getString("stationName");
			i++;

		}

		//get Train 3 stops from Database
		i = 0;
		ResultSet stops3;
		stops3 = st
				.executeQuery(" SELECT stations.stationName FROM Train.stopsAt JOIN Train.stations ON stopsAt.stationID = stations.stationID WHERE  trainScheduleID = 3 LIMIT 6");

	

		while (stops3.next()) {
			arrstop3[i]  = stops3.getString("stationName");
			i++;
		}

		//get Train 4 stops from Database
		i = 0;
		ResultSet stops4;
		stops4 = st
				.executeQuery(" SELECT stations.stationName FROM Train.stopsAt JOIN Train.stations ON stopsAt.stationID = stations.stationID WHERE  trainScheduleID = 4 LIMIT 6");

		while (stops4.next()) {
			arrstop4[i]  = stops4.getString("stationName");
			i++;
		}

		//get Train 5 stops from Database
		i = 0;
		ResultSet stops5;
		stops5 = st
				.executeQuery(" SELECT stations.stationName FROM Train.stopsAt JOIN Train.stations ON stopsAt.stationID = stations.stationID WHERE  trainScheduleID = 5 LIMIT 6");

	

		while (stops5.next()) {
			arrstop5[i] = stops5.getString("stationName");
			i++;
		}

		//get Train 6 stops from Database
		i = 0;
		ResultSet stops6;
		stops6 = st
				.executeQuery("SELECT stations.stationName FROM Train.stopsAt JOIN Train.stations ON stopsAt.stationID = stations.stationID WHERE  trainScheduleID = 6 LIMIT 6");

		while (stops6.next()) {
			arrstop6[i] = stops6.getString("stationName"); 
			i++;
		}
		
		
		
	
		
		
	%>




<h1 id= "header"> Train Schedule for today</h1>

	<TABLE id="Table" class="table">
			
	
		<thead>
			<tr id= "tablec">
				<th onclick="sort(0)">Origin</th>
				<th onclick="sort(1)">Destination</th>
				<th onclick="sort(2)">Fare</th>
				<th onclick="sort(3)">Arrival Time</th>
				<th onclick="sort(4)">Departure Time</th>
				<th onclick="sort(5)">Date of Travel</th>
				<th>Stops</th>
			</tr>
		</thead>
		
		<tbody>
			<!-- Row 1 -->
			<TR>
				<TD><%=oriArr[0]%></TD>
				<TD><%=destArr[0]%></TD>
				<TD><%=fareArr[0]%></TD>
				<TD><%=arrArr[0]%></TD>
				<TD><%=depArr[0]%></TD>
				<TD><%=dot[0]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop1.length; q++) {
					%> <%=arrstop1[q]%>,
				   <%} %>
				</TD>

			</TR>
			
				<!-- Row 1 pt 2  -->
			<TR>
				<TD><%=oriArr[0]%></TD>
				<TD><%=destArr[0]%></TD>
				<TD><%=fareArr[1]%></TD>
				<TD><%=arrArr[1]%></TD>
				<TD><%=depArr[1]%></TD>
				<TD><%=dot[1]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop1.length; q++) {
					%> <%=arrstop1[q]%>,
				   <%} %>
				</TD>

			</TR>
			
			<!-- Row 2  pt 1-->
			<TR>
				<TD><%=oriArr[1]%></TD>
				<TD><%=destArr[1]%></TD>
				<TD><%=fareArr[2]%></TD>
				<TD><%=arrArr[2]%></TD>
				<TD><%=depArr[2]%></TD>
				<TD><%=dot[2]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop2.length; q++) {
					%> <%=arrstop2[q]%>,
					 <%} %>
				</TD>
				
			</TR>



<!-- Row 2  pt 2-->
			<TR>
				<TD><%=oriArr[1]%></TD>
				<TD><%=destArr[1]%></TD>
				<TD><%=fareArr[3]%></TD>
				<TD><%=arrArr[3]%></TD>
				<TD><%=depArr[3]%></TD>
				<TD><%=dot[3]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop2.length; q++) {
					%> <%=arrstop2[q]%>,
					 <%} %>
				</TD>
				
			</TR>


			<!-- Row 3  pt 1 -->
			<TR>
				<TD><%=oriArr[2]%></TD>
				<TD><%=destArr[2]%></TD>
				<TD><%=fareArr[4]%></TD>
				<TD><%=arrArr[4]%></TD>
				<TD><%=depArr[4]%></TD>
				<TD><%=dot[4]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop3.length; q++) {
					%> <%=arrstop3[q]%>,
					 <%} %>
				</TD>
				
			</TR>


	<!-- Row 3  pt 2 -->
			<TR>
				<TD><%=oriArr[2]%></TD>
				<TD><%=destArr[2]%></TD>
				<TD><%=fareArr[5]%></TD>
				<TD><%=arrArr[5]%></TD>
				<TD><%=depArr[5]%></TD>
				<TD><%=dot[5]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop3.length; q++) {
					%> <%=arrstop3[q]%>,
					 <%} %>
				</TD>
				
			</TR>

			<!-- Row 4  pt 1-->
			<TR>
				<TD><%=oriArr[3]%></TD>
				<TD><%=destArr[3]%></TD>
				<TD><%=fareArr[6]%></TD>
					<TD><%=arrArr[6]%></TD>
				<TD><%=depArr[6]%></TD>
				<TD><%=dot[6]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop4.length; q++) {
					%> <%=arrstop4[q]%>, 
					<% }  %>
				</TD>

			</TR>
			
			
			<!-- Row 4  pt 2-->
			<TR>
				<TD><%=oriArr[3]%></TD>
				<TD><%=destArr[3]%></TD>
				<TD><%=fareArr[7]%></TD>
				<TD><%=arrArr[7]%></TD>
				<TD><%=depArr[7]%></TD>
				<TD><%=dot[7]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop4.length; q++) {
					%> <%=arrstop4[q]%>, 
					<% }  %>
				</TD>

			</TR>
			
	
			
			
			
			
			

			<!-- Row 5 pt 1  -->

			<TR>
				<TD><%=oriArr[4]%></TD>
				<TD><%=destArr[4]%></TD>	
				<TD><%=fareArr[8]%></TD>
				<TD><%=arrArr[8]%></TD>
				<TD><%=depArr[8]%></TD>
				<TD><%=dot[8]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop5.length; q++) {
					%> <%=arrstop5[q]%>, 
					<% } %>

				</TD>

			</TR>




			<!-- Row 5 pt 2  -->

			<TR>
				<TD><%=oriArr[4]%></TD>
				<TD><%=destArr[4]%></TD>	
				<TD><%=fareArr[9]%></TD>
				<TD><%=arrArr[9]%></TD>
				<TD><%=depArr[9]%></TD>
				<TD><%=dot[9]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop5.length; q++) {
					%> <%=arrstop5[q]%>, 
					<% } %>

				</TD>

			</TR>



			<!-- Row 6  pt 1 -->
			<TR>
				<TD><%=oriArr[5]%></TD>
				<TD><%=destArr[5]%></TD>
					<TD><%=fareArr[10]%></TD>
				<TD><%=arrArr[10]%></TD>
				<TD><%=depArr[10]%></TD>
				<TD><%=dot[10]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop6.length; q++) {
					%> <%=arrstop6[q]%>,
					 <% }  %>

				</TD>

			</TR>


<!-- Row 6  pt 2 -->
			<TR>
				<TD><%=oriArr[5]%></TD>
				<TD><%=destArr[5]%></TD>
					<TD><%=fareArr[11]%></TD>
				<TD><%=arrArr[11]%></TD>
				<TD><%=depArr[11]%></TD>
				<TD><%=dot[11]%></TD>
				<TD>
					<%
						for (int q = 0; q < arrstop6.length; q++) {
					%> <%=arrstop6[q]%>,
					 <% }  %>

				</TD>

			</TR>


	
			
		
	
	
		</tbody>
	</TABLE>



	<script>
	
		function sort(c) {
			var t;
			var r;
			var switching;
			var i, x, y;
			var shouldSwitch;
			table = document.getElementById("Table");
			switching = true;
			
			while (switching) {
				
				switching = false; 
				
				rows = table.rows; 
				for (i = 1; i < rows.length - 1; i++) {
					
					 // reterving first two data values 
					x = rows[i].getElementsByTagName("TD")[c];
					y = rows[i + 1].getElementsByTagName("TD")[c];
					
					
					// there should be no switching:
					shouldSwitch = false;
					
					// comparing data values after being converted to lowerCase
					// if number will check based on ASCII values 
					if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
						shouldSwitch = true; // if switch needs to happen
						break;
					}
				}
				if (shouldSwitch) {
					// if switch has happened change values and then set switch back to true
					rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
					switching = true;
				}
			}
		}
	</script>

</body>

</html>

<%
origins.close();
destinations.close();
fare.close();
arrTime.close();
depTime.close();
stops1.close();
stops2.close();
stops3.close();
stops4.close();
stops5.close();
stops6.close();
st.close();
con.close();

%>