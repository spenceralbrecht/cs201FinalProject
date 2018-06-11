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
    int projectID = Integer.parseInt(request.getParameter("projectID"));
    int userID = (int)request.getSession().getAttribute("userID");
    System.out.println("projectID: " + projectID);
    System.out.println("userID: " + userID);
    if(JDBCDriver.projectExistence(projectID)) {
        if(!JDBCDriver.userInProject(projectID, userID)) {
            request.getSession().setAttribute("projectID", projectID);
            response.sendRedirect("LoadProjectData?projectID=" + projectID);
        }
        else{
            System.out.println("send: " + projectID);
            request.getSession().setAttribute("projectID", projectID);
            System.out.println("get: " + request.getSession().getAttribute("projectID"));

            response.sendRedirect("LoadProjectData?projectID=" + projectID);

          }
    }else{
        request.setAttribute("errmsg", "Project ID does not exist.");
        response.sendRedirect("profile.jsp");
    }
%>
</script>
</body>
</html>
