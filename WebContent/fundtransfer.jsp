<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Banking - Fund Transfer</title>
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
		<div id="errorMessageForValidation">
			<% if (session.getAttribute("errorTransfer") != null){%>
				<label><%= session.getAttribute("errorTransfer") %></label>
			<%}
			 session.setAttribute("errorTransfer", null);
			%>
		<br><br>
		</div>
		
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
		<form action="transferFunds">
			<label> To Account: </label>
			<input type="text" id="toAccount" name="toAccount" minlength="10" maxlength="10"><br>
			
			<label> Amount transfer: </label>
			<input type="text" id="txnAmount" name="txnAmount"><br>
			
			<input type="submit" value="Transfer" id="transfer">
		</form>
	</div>

</body>
</html>