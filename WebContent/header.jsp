<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<!-- check if the user is logged in -->
	<%
		if (session.getAttribute("user") == null){
			response.sendRedirect("login.jsp");
		}
	%>
	<div class="header">
		<label id="welcomeMsg">Welcome <%= session.getAttribute("user") %></label>
	</div>
</body>
</html>