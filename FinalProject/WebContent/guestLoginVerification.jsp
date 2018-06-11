<%@ page import="driver.JDBCDriver" %>
<%--
  Created by IntelliJ IDEA.
  User: lofnheart
  Date: 6/10/18
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int projectID = Integer.parseInt(request.getParameter("projectID"));
    if (JDBCDriver.projectExistence(projectID)) {
        request.getSession().setAttribute("projectID", projectID);
        response.sendRedirect("LoadProjectData&projectID=" + projectID);
    } else {
        request.setAttribute("errmsg", "Project ID does not exist.");
        response.sendRedirect("guestLogin.jsp");
    }
%>
</body>
</html>
