<%--
  Created by IntelliJ IDEA.
  User: lofnheart
  Date: 6/3/18
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="driver.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>test</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="javascript/jquery-1.12.4.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
          integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/odometer-theme-default.css"/>
    <script src="javascript/odometer.min.js"></script>
    <script>
        /* Set the width of the side navigation to 250px */
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        /* Set the width of the side navigation to 0 */
        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>
</head>
<body>
<!-- side bar -->
<div id="mySidenav" class="sidenav">
    <img id="avatar" src="https://www.w3schools.com/howto/img_avatar.png" width="100" height="100"/>
    <a id="name">Jinpeng He</a>
    <span id="projectDirection"></span>
    <a >
    <a id="logoutButton" href="login.jsp">Log out</a>
</div>

<div id="main">
    <!-- header -->

    <div class="header">
        <h1><a href="#">CheckMate</a></h1>
        <i class="fas fa-check-square fa-4x"></i>
        <i id="searchProjectButton" class="fas fa-search fa-4x"></i>
        <input class="searchProjectCode" type="text" name="projectCode">
    </div>
    <div onclick="changeNav()"><i id="navButton" class="fas fa-arrow-right fa-7x"></i></div>
    <!-- content -->
    <div id="container">

    </div>
</div>

<script>
    var isOpen = false;
    <%int numTasks  =(int) request.getSession().getAttribute("numTasks");%>
	console.log("<%=numTasks%>");
    var tasks = "<%=numTasks%>";
    //how many tasks total user needs to do;
	<%String usr  =(String) request.getSession().getAttribute("username");%>
	console.log("<%=usr%>");
	var username = "<%=usr%>";

    
    
    var Projects = null;//should be a project array.
    var user;
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
        document.getElementById("navButton").style.transform = "rotate(180deg)";
        isOpen = true;
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
        document.getElementById("navButton").style.transform = "";
        isOpen = false;
    }

    function changeNav() {
        if (isOpen) closeNav();
        else openNav();
    }
    //container adding
    $("#container").append("<h1>Hi "+ username + ",</h1><br>" + "<h2> You have <span class=\"odometer\">" + tasks + "</span> tasks to do today</h2>");
    //odometer
    var odometer = new Odometer({
        el: $('.odometer')[0],
        value: 123,
        theme: 'default',
        duration: 1000
    });
    odometer.render();

    $('.odometer').text(tasks);
</script>
</body>
</html>