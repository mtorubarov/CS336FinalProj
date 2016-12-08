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
 <div id="wrapper">
         <div class="chart">
            <h3>Population of endangered species from 2012 to 2016</h3>
            <table id="data-table" border="1" cellpadding="10" cellspacing="0"
            summary="The effects of the zombie outbreak on the populations
            of endangered species from 2012 to 2016">
               <caption>Population in thousands</caption>
               <thead>
                  <tr>
                     <td>&nbsp;</td>
                     <th scope="col">2012</th>
                     <th scope="col">2013</th>
                     <th scope="col">2014</th>
                     <th scope="col">2015</th>
                     <th scope="col">2016</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <th scope="row">Carbon Tiger</th>
                     <td>4080</td>
                     <td>6080</td>
                     <td>6240</td>
                     <td>3520</td>
                     <td>2240</td>
                  </tr>
                  <tr>
                     <th scope="row">Blue Monkey</th>
                     <td>5680</td>
                     <td>6880</td>
                     <td>6240</td>
                     <td>5120</td>
                     <td>2640</td>
                  </tr>
                  <tr>
                     <th scope="row">Tanned Zombie</th>
                     <td>1040</td>
                     <td>1760</td>
                     <td>2880</td>
                     <td>4720</td>
                     <td>7520</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
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

		
		
		

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			
			//Print out current bar or beer name:
			out.print(result.getString("candidateName"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("party"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("percent2016"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("typeOfCandidate"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("committeeName"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(result.getString("individualContributions"));
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