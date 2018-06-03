<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="login.css"><link>
<title>Login</title>
</head>
<body>
	<div id="header">
		<h1 id="logo"><a style='text-decoration: "none"' href="search.jsp">LibraMate</a></h1>	
	</div>
	<div id="form">
		<form method="GET" action="loginValidation">
			<h1>Log In</h1><br>
			Username<br>
			<input type="text" name="username"><br>
			Password<br>
			<input type="password" name="password"><br>
			<span style="color: red;font-weight:bold"><%= request.getAttribute("error")==null ? "" : request.getAttribute("error") %></span><br>
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>