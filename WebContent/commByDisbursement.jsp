<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
		
		String entity = request.getParameter("lim");
		
		//PUT QUERY HERE. LIST OUT 
		String str = "SELECT com_name, zip, city, com_state, ind_con FROM Committees WHERE ind_con>"+entity+" AND com_type=\"H\" AND com_designation = \"P\" ORDER BY  ind_con DESC LIMIT 100;";

		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);

		
		
		//Make an HTML table to show the results in:
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Committee");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("State");
		out.print("</td>");
		
		out.print("<td>");
		out.print("City");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Zip Code");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Contribution");
		out.print("</td>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(result.getString("com_name"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("com_state"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("city"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("zip"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("ind_con"));
			out.print("</td>");
			
			
			out.print("</tr>");

		}
		out.print("</table>");

		//close the connection.
		con.close();

	} catch (Exception ex) {

	}
%>
</body>
</html>