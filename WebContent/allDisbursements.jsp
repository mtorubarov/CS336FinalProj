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
		
		String food = request.getParameter("command");
		String cand = request.getParameter("cand").trim();
		
		String str="";
		
		//PUT QUERY HERE. LIST OUT 
		if(food.equals("all")){
			str = "SELECT * FROM Transactions t WHERE t.tra_id IN (SELECT p.tra_id FROM PerformedBy p WHERE p.com_id IN (SELECT com.com_id FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting 		LEFT JOIN Committees com ON supporting.com_id=com.com_id WHERE supporting.can_name=\""+ cand+"\" AND (com.com_designation=\"P\" OR com.com_designation IS NULL))) ORDER BY dis_dat";
		}else if (food.equals("food")){
			str = "SELECT * FROM Transactions t WHERE t.tra_id IN(SELECT p.tra_id FROM PerformedBy p WHERE p.com_id IN (SELECT com.com_id FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting LEFT JOIN Committees com ON supporting.com_id=com.com_id WHERE supporting.can_name=\""+cand+"\" AND (com.com_designation=\"P\" OR com.com_designation IS NULL)) )  AND (dis_pur_des LIKE \"%TRAVEL%\" OR dis_pur_des LIKE \"%TAXI%\" OR dis_pur_des LIKE \"%AIRPLANE%\" OR dis_pur_des LIKE \"%AUTO%\"OR dis_pur_des LIKE \"%FUEL%\" OR dis_pur_des LIKE \"%AIRFARE%\" OR dis_pur_des LIKE \"%HOTEL%\" OR dis_pur_des LIKE \"%LODGING%\") ORDER BY dis_dat";
		}else{
			str = "SELECT * FROM Transactions t WHERE t.tra_id IN(SELECT p.tra_id FROM PerformedBy p WHERE p.com_id IN (SELECT com.com_id FROM (SELECT s.com_id, c.can_id, c.can_name, c.party, c.outcome, c.percent2016, c.can_inc_cha_ope_sea, c.off_state, c.dist_num FROM Candidates c LEFT JOIN Supports s ON c.can_id=s.can_id) supporting LEFT JOIN Committees com ON supporting.com_id=com.com_id WHERE supporting.can_name=\""+cand+"\" AND (com.com_designation=\"P\" OR com.com_designation IS NULL)) )  AND (dis_pur_des LIKE \"%FOOD%\" OR dis_pur_des LIKE \"%CATERING%\" OR dis_pur_des LIKE \"%BEVERAGE%\") ORDER BY dis_dat";
		}
		
		//Run the query against the DB
		ResultSet result = stmt.executeQuery(str);

		
		
		//Make an HTML table to show the results in:
		out.print("<table> Disbursements by date");

		//make a row
		out.print("<tr>");
		//make a column
		
		out.print("<td>");
		//print out column header
		out.print("Date");
		out.print("</td>");
		//make a column
		
		out.print("<td>");
		out.print("Recipient");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Amount");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Recipient State");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Recipient Zip Code");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Reason for Transaction");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			
			
			out.print("<td>");
			out.print(result.getString("dis_dat"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("rec_name"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("dis_amo"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("rec_state"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("rec_zip"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("dis_pur_des"));
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