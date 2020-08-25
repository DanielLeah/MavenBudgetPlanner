<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Banking - Login</title>
</head>
<body>
	<form action="login">
		<label>User Name</label>
		<input type="text" id="userName" name="userName" maxlength="30"><br>
		<label>Password</label>
		<input type="password" id="password" name="password" maxlength="30"><br>
		<input type="submit" value="Submit" id="login">
	</form>
	<br> <br>
	<div id ="errors">
		<% if (session.getAttribute("errorLogin") != null){%>
			<label><%= session.getAttribute("errorLogin") %></label>
		<%}
			session.setAttribute("errorLogin", null);
		%>
	</div>
</body>
</html>