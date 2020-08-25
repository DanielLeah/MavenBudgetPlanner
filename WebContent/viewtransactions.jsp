<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Banking - View Transactions</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
	table, th, td {
	  border: 1px solid black;
	}
</style>
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
		
				<label> From Account:</label>
		<label id="fromAccount"> <%= session.getAttribute("accountNo") %> </label><br>
		
		<label> Account Balance: </label>
		<label id="accountBalance"><%= session.getAttribute("balance") %></label><br>
		
		<label> Budget Planner kitty balance: </label>
		<%
			int daily = (int)session.getAttribute("dailylimit");
			String dailyLimit = daily +"";
			if ( daily == -1){
				dailyLimit = "Not set";
			}
		%>
		<label id="kittyBalance"><%= dailyLimit %></label><br><br>
		<%
			int[] transactionNumber = (int[]) session.getAttribute("transactionNumber");
			int[] transactionAmount = (int[]) session.getAttribute("transactionAmount");
			String[] transationAccount = (String[]) session.getAttribute("transationAccount");
			String[] transationDate = (String[]) session.getAttribute("transationDate");
			int[] transactionBalance = (int[]) session.getAttribute("transactionBalance");
		%>
		
		<table style="width:100%">
		  <tr>
		    <th>Transaction Number</th>
		    <th>Amount Transferred</th>
		    <th>To Account</th>
		    <th>Transfer Date</th>
		    <th>Balance</th>
		  </tr>
		  
		  <%  for (int i = 0; i < transactionNumber.length; i++) { %>
		  <tr>
		  	<td style="text-align:center"><%= transactionNumber[i]%></td>
		  	<td style="text-align:center"><%= transactionAmount[i]%></td>
		  	<td style="text-align:center"><%= transationAccount[i]%></td>
		  	<td style="text-align:center"><%= transationDate[i]%></td>
		  	<td style="text-align:center"><%= transactionBalance[i]%></td>
		  </tr>
		  <% } %>
		</table>
	</div>
</body>
</html>