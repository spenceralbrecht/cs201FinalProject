<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="driver.*" import ="check.Project" import ="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 			String username = request.getParameter("username");
			System.out.println("inside authenticate sign up");
			System.out.println(username+ " "+request.getParameter("password") + request.getParameter("password2"));
			if (!(request.getParameter("password").equals(request.getParameter("password2")))){
				request.setAttribute("errmsg", "Passwords must match.");
				response.sendRedirect("signup.jsp");
			}
			else if( ! JDBCDriver.validateSignup(username, request.getParameter("password"))){
				request.getSession().setAttribute("username", username);
				//request.getSession().setAttribute("userID", JDBCDriver.getUserID());
				request.getSession().setAttribute("numTasks",(int) 0);
				request.getSession().setAttribute("authenticated", "yes");
				ArrayList<Project> userP = new ArrayList<Project>();
				request.getSession().setAttribute("userProjects", userP);
				response.sendRedirect("profile.jsp");
			}else{
				request.setAttribute("errmsg", "Username Exists.");
				response.sendRedirect("signup.jsp");
			}
	%>
</body>
</html>