<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="signUp.css"><link>
<title>Sign Up</title>
</head>
<body>
	<div id="header">
		<h1 id="logo"><a style='text-decoration: "none"' href="search.jsp">LibraMate</a></h1>	
	</div>
	<div id="form">
		<form method="GET" action="signUpValidation">
			<h1>Sign Up</h1><br>
			
			Username <br>
			<input type="text" name="username" value=<%= request.getParameter("username")!=null ? request.getParameter("username").toString().trim() : "" %>>
 			<%
 				if (request.getAttribute("username_blank")!=null) {
 			%>
 				<span style="color: red;font-weight:bold">Username cannot be blank</span>
 			<%
 				}
 			
 				else {
 			%>
 				<span style="color: red;font-weight:bold"></span>	
 			<%		
 				}
 			
 				if (request.getAttribute("username_taken")!=null) {
 			%>
 				<span style="color: red;font-weight:bold">Username is already taken</span><br>
 			<%
 				}
 			
 				else {
 			%>
 				<span style="color: red;font-weight:bold"></span><br>	
 			<%	
 				}
 			%>
 			
 			Password <br>	
 			<input type="password" name="password" value=<%= request.getParameter("password")!=null ? request.getParameter("password").toString().trim() : "" %>>
 			<%	
 				if (request.getAttribute("password_blank")!=null) {
 			%>
 				<span style="color: red;font-weight:bold">Password cannot be blank</span><br>
 			<%
 				}
 				else {
 			%>
 				<span style="color: red;font-weight:bold"></span><br>	
 			<%	
 				}
 			%>
 			
 			Image URL <br>
			<input type="url" name="url" value=<%= request.getParameter("url")!=null ? request.getParameter("url").toString().trim() : "" %>>
 			<%
 				if (request.getAttribute("img_blank")!=null) {
 			%> 			
 				<span style="color: red;font-weight:bold">URL cannot be blank</span><br>
 			<%
 				}
 				else {
 			%>
 				<span style="color: red;font-weight:bold"></span><br>	
 			<%	
 				}
 			%>
			
			
			<button type="submit">Sign Up</button>
		</form>
	</div>
</body>
</html>