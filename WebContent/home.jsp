<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Banking - Home</title>
<style>
	table, th, td {
	  border: 1px solid black;
	}
</style>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<!-- check if the user is logged in -->
	<%
		if (session.getAttribute("user") == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="sidenav">
		 <a href="home.jsp">Home</a>
		 <a href="budgetplanner.jsp">Budget Planner</a>
		 <a href="viewtransactions.jsp">View Transactions</a>
		 <a href="fundtransfer.jsp">Fund Transfer</a>
	</div>
	
	<div class="main">
	
		<label>Account Summary:</label><br>
		
		<!-- Table with account data -->
		<table style="width:100%">
			<tr>
			    <th style="text-align:left">Account Number</th>
			    <th style="text-align:left">Account Type</th>
			    <th style="text-align:left">Balance Account</th>
		  	</tr>
	  		<tr>
			    <td><label id="accountNumber"><%= session.getAttribute("accountNo") %></label></td>
	    		<td><label id="accountType"><%= session.getAttribute("accountType") %></label></td>
	    		<td><label id="balance"><%= session.getAttribute("balance") %></label></td>
			</tr>
		</table>
		
	</div>
</body>
</html>