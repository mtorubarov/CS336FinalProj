<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script type="text/javascript">
window.onload = function () {
var chart = new
CanvasJS.Chart("chartContainer", {
title:{
text: "Disbursement amounts. x axis: Month. y axis: Amount in dollars"
},
data: [//array of dataSeries 
{ //dataSeries object
type: "column",
dataPoints: [ 
	<%   
	try {

		//Create a connection string
		//String url = "jdbc:mysql://cs336-2.crujdr9emkb3.us-east-1.rds.amazonaws.com:3306/BarBeerDrinkerSample";
		String url = "jdbc:mysql://vishesh.c5hj5a2rue6k.us-east-1.rds.amazonaws.com:3306/Committees";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver");

		//Create a connection to your DB
		//Connection con = DriverManager.getConnection(url, "student", "student");
		Connection con = DriverManager.getConnection(url, "vishesh", "bathroom1");
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//System.out.println("con:"+con.getClientInfo().list());
		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		
		String year = request.getParameter("year");
		
		//PUT QUERY HERE. LIST OUT 
		String str = "SELECT MONTH(dis_dat), AVG(dis_amo) FROM Transactions WHERE YEAR(dis_dat)="+year+" GROUP BY MONTH(dis_dat) ORDER BY MONTH(dis_dat)";

		
		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);

		result.next();
		out.print("{label: \""+result.getString("MONTH(dis_dat)")+"\", y: "+result.getString("AVG(dis_amo)")+"}");

		//out.print("{ label: \"grape\",  y: 28  }");
		
		//parse out the results
		while (result.next()) {
			out.print(",{label: \""+result.getString("MONTH(dis_dat)")+"\", y: "+result.getString("AVG(dis_amo)")+"}");

		}

		//close the connection.
		con.close();

	} catch (Exception ex) {

	}
	%>
			]
		}
		]
	});
	chart.render();
}
</script>









</head>






<body>
	<div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
</body>

</html>