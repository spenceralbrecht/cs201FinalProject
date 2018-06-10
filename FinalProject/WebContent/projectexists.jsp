<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="driver.JDBCDriver" import = "check.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		int projectID = Integer.parseInt(request.getParameter("projectID"));
		if(JDBCDriver.projectExistence(projectID)) {
			request.getSession().setAttribute("projectID", projectID); 
			response.sendRedirect("LoadProjectData"); 
		}else{
			request.setAttribute("errmsg", "Project ID does not exist.");
			response.sendRedirect("guestLogin.jsp"); 
		} 
	%>
	</body>
</html>