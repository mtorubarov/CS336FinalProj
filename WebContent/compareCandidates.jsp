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
		
		String cand1 = request.getParameter("cand1").trim();
		String cand2 = request.getParameter("cand2").trim();
		
		//PUT QUERY HERE. LIST OUT 
		
		//1st Candidate:
		String str = "SELECT can_name AS name, party, outcome, percent2016, can_inc_cha_ope_sea AS type, com_name AS committeeName, off_state AS state, dist_num AS districtNumber FROM (SELECT supporting.can_id, supporting.can_name, supporting.party, supporting.outcome, supporting.percent2016, supporting.can_inc_cha_ope_sea, com.com_id, com.ind_con, supporting.off_state, supporting.dist_num, com.com_designation, com.com_name FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting  LEFT JOIN Committees com ON supporting.com_id=com.com_id) allTheCandidates WHERE (allTheCandidates.can_name=\""+cand1+"\" AND (allTheCandidates.com_designation=\"P\" OR allTheCandidates.com_designation IS NULL))";
		
		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);
		
		
		//Make an HTML table to show the results in:
		out.print("<table> Candidate Basic Information");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Name");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Party");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Outcome");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Percent");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Type");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Committee Name");
		out.print("</td>");
		
		out.print("<td>");
		out.print("State");
		out.print("</td>");
		
		out.print("<td>");
		out.print("District Number");
		out.print("</td>");
		
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(result.getString("name"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("party"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("outcome"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("percent2016"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("type"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("committeeName"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("state"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("districtNumber"));
			out.print("</td>");
			
			out.print("</tr>");

		}
		
		
		//2st Candidate:
				str = "SELECT can_name AS name, party, outcome, percent2016, can_inc_cha_ope_sea AS type, com_name AS committeeName, off_state AS state, dist_num AS districtNumber FROM (SELECT supporting.can_id, supporting.can_name, supporting.party, supporting.outcome, supporting.percent2016, supporting.can_inc_cha_ope_sea, com.com_id, com.ind_con, supporting.off_state, supporting.dist_num, com.com_designation, com.com_name FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting  LEFT JOIN Committees com ON supporting.com_id=com.com_id) allTheCandidates WHERE (allTheCandidates.can_name=\""+cand2+"\" AND (allTheCandidates.com_designation=\"P\" OR allTheCandidates.com_designation IS NULL))";
				
				
				//Run the query against the DB
				result = stmt.executeQuery(str);
				
				
				//Make an HTML table to show the results in:
				

				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					
					//Print out current bar or beer name:
					out.print(result.getString("name"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("party"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("outcome"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("percent2016"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("type"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("committeeName"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("state"));
					out.print("</td>");
					
					out.print("<td>");
					out.print(result.getString("districtNumber"));
					out.print("</td>");
					
					out.print("</tr>");

				}
				out.print("</table>");
				
				
				
				//Other information
				//1st Candidate:
		 str = "SELECT AVG(dis_amo), SUM(dis_amo) FROM Transactions t WHERE t.tra_id IN (SELECT p.tra_id FROM PerformedBy p WHERE p.com_id IN (SELECT com.com_id FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting LEFT JOIN Committees com ON supporting.com_id=com.com_id WHERE supporting.can_name=\""+cand1+"\" AND (com.com_designation=\"P\" OR com.com_designation IS NULL)))";
		
		
		//Run the query against the DB
		 result = stmt.executeQuery(str);
		
		 out.print("<hr></hr>");
		
		//Make an HTML table to show the results in:
		out.print("<table> Candidate Aggregates");

		//make a row
		out.print("<tr>");
		
		out.print("<td>");
		//print out column header
		out.print("Name");
		out.print("</td>");
		
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Average disbursement amount");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Total disbursement");
		out.print("</td>");
		
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(cand1);
			out.print("</td>");
			
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(result.getString("AVG(dis_amo)"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("SUM(dis_amo)"));
			out.print("</td>");
			
			
			out.print("</tr>");

		}
		
		
		//2st Candidate:
				 str = "SELECT AVG(dis_amo), SUM(dis_amo) FROM Transactions t WHERE t.tra_id IN (SELECT p.tra_id FROM PerformedBy p WHERE p.com_id IN (SELECT com.com_id FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting LEFT JOIN Committees com ON supporting.com_id=com.com_id WHERE supporting.can_name=\""+cand2+"\" AND (com.com_designation=\"P\" OR com.com_designation IS NULL)))";
		
		
		//Run the query against the DB
		 result = stmt.executeQuery(str);

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(cand2);
			out.print("</td>");
			
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(result.getString("AVG(dis_amo)"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("SUM(dis_amo)"));
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