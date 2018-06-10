<%--
  Created by IntelliJ IDEA.
  User: lofnheart
  Date: 6/3/18
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="css/project.css">
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
    <form action="createProject.jsp" method="POST" class="form create project">
        <a id="createProject">Create a Project</a>
        <input id="createProjectBar" type="text" name="projectName" class="form__input" placeholder="Project Code">
    </form>
    <a id="logoutButton" href="login.jsp">Log out</a>
</div>

<div id="main">
    <!-- header -->
    <div class="header">
        <h1><a href="#">CheckMate</a></h1>
        <i class="fas fa-check-square fa-4x"></i>
        <span id="searchBar">
        <i id="searchProjectButton" class="fas fa-search fa-4x"></i>
        <form action="searchProject.jsp" method="POST" class="form-search-project">
        <input class="searchProjectCode" type="text" required>
        </form>
        </span>
    </div>
    <div onclick="changeNav()"><i id="navButton" class="fas fa-arrow-right fa-7x"></i></div>
    <!-- content -->
    <div id="container">
        <div class="UsersTask">
        <div class="tdl-holder">
            <h2>User 1</h2>
            <div class="tdl-content1">
                <ul>
                </ul>
            </div>
            <div class="progress">
                <div class="progress-bar bg-success progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
            <div class="tdl-holder">
                <h2>User 2</h2>
                <div class="tdl-content2">
                    <ul>
                    </ul>
                </div>
                <div class="progress">
                    <div class="progress-bar bg-dark progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="tdl-holder">
                <h2>User 3</h2>
                <div class="tdl-content3">
                    <ul>
                    </ul>
                </div>
                <div class="progress">
                    <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
            <div class="tdl-holder">
                <h2>User 3</h2>
                <div class="tdl-content4">
                    <ul>
                    </ul>
                </div>
                <div class="progress">
                    <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <div class="ProjectTasks">
            <div class="tdl-holder">
                <h2>PROJECT TASK</h2>
                <div class="tdl-content">
                    <ul>
                    </ul>
                </div>
                <input type="text" class="tdl-new" placeholder="Write new item and hit 'Enter'...">
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="progress-bar bg-success progress-bar-striped" role="progressbar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
    </div>
</div>
<script>
    var isOpen = false;
    var tasks = 100;//how many tasks total user needs to do;
    var username = "James"; //first name
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

    /* TO DO LIST */

    //when hitting the button to create a task;
    $(".tdl-new").bind('keypress', function(e){
        var code = (e.keyCode ? e.keyCode : e.which);
        if(code == 13) {
            var v = $(this).val();
            var s = v.replace(/ +?/g, '');
            if (s == ""){
                return false;
            }else{
                console.log("111");
                $(".tdl-content ul").append("<li><label><i></i><span class=\"val\">"+ v +"</span><a href='#'>+</a></label></li>");
                $(this).val("");
            }
        }
    });


    // when you add a task into your task list;
    $(".tdl-content").on('click', "a", function(){
        var _li = $(this).parent().parent("li");
        $(".tdl-content1 ul").append("<li><label><input type=\"checkbox\" unchecked><i></i><span class=\"val\">"+ _li.find("span").text()+"</label></li>");
        $(this).val("");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function(){
            _li.remove();
        });
        return false;
    });

</script>
</body>
</html>
