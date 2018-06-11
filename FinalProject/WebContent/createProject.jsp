<%@ page import="driver.JDBCDriver" %>
<%@ page import="check.Project" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: lofnheart
  Date: 6/10/18
  Time: 2:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="javascript/database.js"></script>
    <script src="javascript/jquery-1.12.4.min.js"></script>
</head>
<body src="javascript/database.js">
<script>
    <%
        int userID = (int)request.getSession().getAttribute("userID");
        String projectName = (request.getParameter("projectName"));
        JDBCDriver.createProject(projectName, userID);
        int pID = JDBCDriver.getPID(projectName, userID);
        JDBCDriver.createUserProject(pID,userID);
        request.getSession().setAttribute("projectID",pID);
        response.sendRedirect("LoadProjectData?projectID=" + pID);
    %>
</script>
</body>
</html>
