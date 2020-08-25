<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Banking - Budget Planner</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script src="jquery.min.js"></script>
<script src="myJS.js"></script>
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
		<form action="budgetPlanner">
			<input type="radio" id="register" name="register" value="Register" checked>
			<label for="register">Register</label>
		 	<input type="radio" id="deregister" name="register" value="Deregister">
		 	<label for="deregister">Deregister</label> <br><br>
		 	
		 	<div id="dailyLimit">
			 	<label>Maximum limit per day</label>
			 	<% 
			 		int dailyLimit = (int)session.getAttribute("dailylimit");
			 		if (dailyLimit == -1 ){%>
			 			<input type="text" id="dailylimit" name="dailylimit" maxlength="30"> <br>
			 		<% } else {
			 			%>
			 			<input type="text" id="dailylimit" name="dailylimit" maxlength="30" value=<%= dailyLimit %>> <br>
			 			<%
			 		}
			 	%>
		 	</div>
		 	<input type="submit" value="Update" id="update">
		</form>
		<br><br>
		<div id ="message">
			<% if (session.getAttribute("messageBudget") != null){%>
				<label><%= session.getAttribute("messageBudget") %></label>
			<%}
			 session.setAttribute("messageBudget", null);
			%>
		</div>
		
		<div id ="errors">
			<% if (session.getAttribute("errorBudget") != null){%>
				<label><%= session.getAttribute("errorBudget") %></label>
			<%}
			 session.setAttribute("errorBudget", null);
			%>
		</div>
	</div>
	
</body>
</html>