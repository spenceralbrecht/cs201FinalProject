<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="driver.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<% 
		String username = request.getParameter("username");
		System.out.println("inside authenticate");
		System.out.println(username+ " "+request.getParameter("password"));
		if( JDBCDriver.validate(username, request.getParameter("password"))){
			request.getSession().setAttribute("username", username);
			//request.getSession().setAttribute("userID", JDBCDriver.getUserID());
			//request.getSession().setAttribute("numTasks")
			request.getSession().setAttribute("authenticated", "yes");
			response.sendRedirect("profile.jsp");
		}else{
			request.setAttribute("errmsg", "Invalid username and password.");
			response.sendRedirect("login.jsp");
		}
	%>
	</body>
</html>