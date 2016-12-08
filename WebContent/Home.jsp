<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>2016 House of Representatives Elections</title>
</head>
<body>


<h1>2016 House of Representatives Elections. How should you run your own campaign?</h1>

<br>

<img src="http://www.outsidethebeltway.com/wp-content/uploads/2014/11/House-of-Representatives-113th-Congress.jpg" alt="Mountain View" style="width:533px;height:300px;">

<br>
<br>

<h3>First step is to look up your district and see who the candidates are</h3>

Find your disctrict's election campaign results!
<br>
ex: State=NJ  District=11
<form method="get" action="districtElections.jsp" enctype=text/plain>
	
	<table>
		<tr>
		<td>State:</td><td><input type="text" name="state"></td>
		</tr>
		<tr>
		<td>District:</td><td><input type="text" name="district"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="submit">
</form>

<br>

<hr>

<h3>Compare 2 candidates, their disbursement statistics, and other information</h3>

<br>
Compare two candidates side by side.
<br>
ex: MOULTON, SETH and PALLONE, FRANK JR
<form method="get" action="compareCandidates.jsp" enctype=text/plain>

	<table>
		<tr>
		<td>Candidate 1:</td><td><input type="text" name="cand1"></td>
		</tr>
		<tr>
		<td>Candidate 2:</td><td><input type="text" name="cand2"></td>
	</table>
	<br>
	<input type="submit" value="submit">
</form>

<br>

<hr>

<h3>Look at biggest disbursments, disbursements by day, etc.</h3>

<br>

Enter a candidate's name to see his/her committee's disbursements.
<br>
ex: DERICKSON, TIMOTHY
<br>
<form method="get" action="allDisbursements.jsp" enctype=text/plain>
	<input type="text" name="cand">
	<br>
	<input type="radio" name="command" value="all" checked>All Disbursements
	<br>
	<input type="radio" name="command" value="travel">Food Expenses Only
	<br>
	<input type="radio" name="command" value="food">Travel Expenses Only
	<br>
	<input type="submit" value="submit">
</form>

<br>
<br>
Find the committees with the most individual contributions.
<form method="get" action="commByDisbursement.jsp" enctype=text/plain>
	<select name="lim" size=1>
		<option value="5000000">more than $5,000,000</option>
		<option value="3000000">more than $3,000,000</option>
		<option value="1000000">more than $1,000,000</option>
	</select>&nbsp;
	<br>
	<input type="submit" value="submit">

</form>

<br>
<br>
Take a look at the 10 largest disbursements made to see where the biggest transactions are going.
<br>
<form method="get" action="largestDis.jsp" enctype =text/plain>
	<input type="submit" value="Show me!">
</form>

<br>
<br>

Enter a year to find the average amount spent per month to gauge how much you should be spending in the months leading up to the election
<br>
<form method="get" action="monthChart.jsp" enctype =text/plain>
	<input type="text" name="year">
	<br>
	<input type="submit" value="submit">
</form>


</body>
</html>