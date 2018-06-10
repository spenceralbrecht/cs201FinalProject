<%--
  Created by IntelliJ IDEA.
  User: lofnheart
  Date: 6/3/18
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.util.ArrayList" import = "java.util.HashMap"
import =  "java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>test</title>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="javascript/jquery-1.12.4.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="javascript/database.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
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

	<script>
	<% 
		Map<String, Map<String, Boolean> > userTaskMap = new HashMap<>();
	
		// Map that has userName to map of tasks with name and completed boolean
		System.out.println(request.getSession().getAttribute("userTaskMap"));
		userTaskMap = ( Map<String, Map<String, Boolean> >) request.getSession().getAttribute("userTaskMap");
		
		int numUsers = userTaskMap.size();
		ArrayList<String> userNames = (ArrayList<String>)request.getSession().getAttribute("userNames");
		for(int i = 0; i < userNames.size();i++) { 
	%>
			var userCard = document.getElementById("userCard"+(i+1));
			var title = document.createElement('h2');
			title.innerHTML = <%= userNames.get(i) %>;
			userCard.appendChild(title);
			var content = document.getElementById("tdl-content"+(i+1));
			
	<%
			Map<String, Boolean> userTasks = userTaskMap.get(userNames.get(i));
			ArrayList<String> tasksForUser = new ArrayList<String>();
			
			userTasks.forEach((k, v) -> tasksForUser.add(k));
			
// 			for (Map.Entry<String, Boolean> entry : userTasks.entrySet()) {
// // 	            System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
// 				tasksForUser.add(entry.getKey());
// 	        }
	
			for (int j=0; j<tasksForUser.size(); j++){
	%>
				var listItem = document.createElement('ul');
				listItem.innerHTML = <%= tasksForUser.get(i) %>;
				content.appendChild(listItem);
	<%			
			}
	%>
			// Adds users tasks to the card
			userCard.appendChild(content); 
			
			// Add the progress bar
			var progressBarDiv = document.createElement('div');
			progressBarDiv.className = "progress";
			var progressBar = document.createElement('div');
			progressBar.className = "progress-bar bg-dark progress-bar-striped";
			progressBar.style.width = "25%";
			progressBar.style.aria-valuenow = "25";
			progressBar.style.aria-valuemin = "0";
			progressBar.style.aria-valuemax = "100";
			
			progressBarDiv.appendChild(progressBar);
			userCard.appendChild(progressBarDiv);
	<%		
		}
	%>
	
	
	
	</script>
	
	<!-- side bar -->
	<div id="mySidenav" class="sidenav">
		<img id="avatar" src="https://www.w3schools.com/howto/img_avatar.png"
			width="100" height="100" /> <a id="name" href="profile.jsp">Jinpeng
			He</a> <span id="projectDirection"></span> <a id="logoutButton"
			href="login.jsp">Log out</a>
	</div>

	<div id="main">
		<!-- header -->
		<div class="header">
			<h1>
				<a href="#">CheckMate</a>
			</h1>
			<i class="fas fa-check-square fa-4x"></i> <i id="searchProjectButton"
				class="fas fa-search fa-4x"></i> <input class="searchProjectCode"
				type="text" name="projectCode">
		</div>
		<div onclick="changeNav()">
			<i id="navButton" class="fas fa-arrow-right fa-7x"></i>
		</div>
		<!-- content -->
		<div id="container">
			<div class="UsersTask">
				<div id="userCard1" class="tdl-holder">
					<h2>User 1</h2>
					<div class="tdl-content1">
						<ul>
						</ul>
					</div>
					<div class="progress">
						<div class="progress-bar bg-success progress-bar-striped"
							role="progressbar" style="width: 25%" aria-valuenow="25"
							aria-valuemin="0" aria-valuemax="100"></div>
					</div>
				</div>
				<div id="userCard2" class="tdl-holder">
					<!--                 <h2>User 2</h2> -->
					<!--                 <div class="tdl-content2"> -->
					<!--                     <ul> -->
					<!--                     </ul> -->
					<!--                 </div> -->
					<!--                 <div class="progress"> -->
					<!--                     <div class="progress-bar bg-dark progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div> -->
					<!--                 </div> -->
				</div>
				<div id="userCard3" class="tdl-holder">
					<!--                 <h2>User 3</h2> -->
					<!--                 <div class="tdl-content3"> -->
					<!--                     <ul> -->
					<!--                     </ul> -->
					<!--                 </div> -->
					<!--                 <div class="progress"> -->
					<!--                     <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div> -->
					<!--                 </div> -->
				</div>
				<div id="userCard4" class="tdl-holder">
					<!--                 <h2>User 3</h2> -->
					<!--                 <div class="tdl-content4"> -->
					<!--                     <ul> -->
					<!--                     </ul> -->
					<!--                 </div> -->
					<!--                 <div class="progress"> -->
					<!--                     <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div> -->
					<!--                 </div> -->
				</div>
				<div id="userCard5" class="tdl-holder">
					<!--                 <h2>User 3</h2> -->
					<!--                 <div class="tdl-content4"> -->
					<!--                     <ul> -->
					<!--                     </ul> -->
					<!--                 </div> -->
					<!--                 <div class="progress"> -->
					<!--                     <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div> -->
					<!--                 </div> -->
				</div>
				<div id="userCard6" class="tdl-holder">
					<!--                 <h2>User 3</h2> -->
					<!--                 <div class="tdl-content4"> -->
					<!--                     <ul> -->
					<!--                     </ul> -->
					<!--                 </div> -->
					<!--                 <div class="progress"> -->
					<!--                     <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div> -->
					<!--                 </div> -->
				</div>
				<div id="userCard7" class="tdl-holder">
					<!--                 <h2>User 3</h2> -->
					<!--                 <div class="tdl-content4"> -->
					<!--                     <ul> -->
					<!--                     </ul> -->
					<!--                 </div> -->
					<!--                 <div class="progress"> -->
					<!--                     <div class="progress-bar bg-warning progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div> -->
					<!--                 </div> -->
				</div>
			</div>
			<div class="ProjectTasks">
				<div class="tdl-holder">
					<h2>Unassigned Tasks</h2>
					<div class="tdl-content">
						<ul>
						</ul>
					</div>
					<input type="text" class="tdl-new"
						placeholder="Enter a new task...">
				</div>
			</div>
		</div>
		<div class="bottom">
			<div class="progress-bar bg-success progress-bar-striped"
				role="progressbar" style="width: 100%" aria-valuenow="25"
				aria-valuemin="0" aria-valuemax="100"></div>
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
            	// Send the update to the database
            	var taskTitle = $(this).val();
            	console.log(taskTitle);
            	addTaskInDatabase(taskTitle, 1)
            	
                $(".tdl-content ul").append("<li><label><i></i><span class=\"val\">"+ v +"</span><a href='#'>+</a></label></li>");
                $(this).val("");
            }
        }
    });


    // when you add a task into your task list;
    $(".tdl-content").on('click', "a", function(){
    	console.log("hello");
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