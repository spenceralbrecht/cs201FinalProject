<%@ page import="check.Project"%>
<%@ page import="java.util.ArrayList"%><%--
  Created by IntelliJ IDEA.
  User: lofnheart
  Date: 6/3/18
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="check.Task" import="java.util.ArrayList"
	import="java.util.HashMap" import="java.util.Map"%>
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/project.css">

</head>
<body>

	<script>

	window.onload = function() {
			<% 
			Map<String, Map<String, Boolean> > userTaskMap = new HashMap<>();
		
			// Map that has userName to map of tasks with name and completed boolean
	// 		System.out.println("we are all in this together");
	// 		System.out.println(request.getSession().getAttribute("userTaskMap"));
			userTaskMap = ( Map<String, Map<String, Boolean> >) request.getSession().getAttribute("userTaskMap");
			
			int numUsers = userTaskMap.size();
			System.out.println("numUsrs= "+numUsers);
			ArrayList<String> userNames = (ArrayList<String>)request.getSession().getAttribute("userNames");
			for(int i = 0; i < userNames.size(); i++) { 
		%>
				var userCard = document.getElementById("userCard"+parseInt(<%=i%>+1));
				var title = document.createElement('h2');
				title.innerHTML = "<%= userNames.get(i) %>";
				userCard.appendChild(title);
<%-- 				var content = document.getElementById("tdl-content"+parseInt(<%=i%>+1)); --%>
				var content = document.createElement('div');
				content.className = "tdl-content"+parseInt(<%=i%>+1);		
		<%
				String username = (String)request.getSession().getAttribute("username");
				if(userNames.get(i).equals(username)){
					request.getSession().setAttribute("tdl-content", "tdl-content"+(i+1));
				}
				Map<String, Boolean> userTasks = userTaskMap.get(userNames.get(i));
				ArrayList<String> tasksForUser = new ArrayList<String>();
			
				if (userTasks!=null && userTasks.size() > 1) {
					System.out.println("userTasks="+userTasks);
					userTasks.forEach((k, v) -> tasksForUser.add(k));
	
			
					for (int j=0; j<tasksForUser.size(); j++){
			%>
						var listItem = document.createElement('li');
						var label = document.createElement('label');
						var checkbox = document.createElement('input');
						checkbox.type = "checkbox";
						var circle = document.createElement('i');
						var span = document.createElement('span');
			<%
			if(tasksForUser != null){
						if(userTasks.get(tasksForUser.get(j))){ 
			%>

							checkbox.checked = true;
			<%			

						}
			%>
						span.innerHTML = "<%= tasksForUser.get(j) %>";
						label.appendChild(checkbox);
						label.appendChild(circle);
						label.appendChild(span);
						listItem.appendChild(label);
						content.appendChild(listItem);
						userCard.appendChild(content); 
			<%			
					}
			%>				
			<%
				}
			%>
				// Adds users tasks to the card
				
				
				// Add the progress bar
				var progressBarDiv = document.createElement('div');
				progressBarDiv.className = "progress";
				var progressBar = document.createElement('div');
				progressBar.className = "progress-bar bg-dark progress-bar-striped";
				progressBar.style.width = "25%";
	// 			progressBar.style.aria-valuenow = "25";
	// 			progressBar.style.aria-valuemin = "0";
	// 			progressBar.style.aria-valuemax = "100";
				
				progressBarDiv.appendChild(progressBar);
				userCard.appendChild(progressBarDiv);
		<%		
			}
		%>
		<% 
		
		ArrayList<Task> unassignedTasks = new ArrayList<Task>();
		unassignedTasks = (ArrayList<Task>) request.getSession().getAttribute("unassignedTasks");
		System.out.println("unASS: " + unassignedTasks);
		// Map that has userName to map of tasks with name and completed boolean
// 		System.out.println("we are all in this together");
// 		System.out.println(request.getSession().getAttribute("userTaskMap"));
		
		
		
	%>
		var projectTaskList = document.getElementById("projectTasksList");
		
<%-- 				var content = document.getElementById("tdl-content"+parseInt(<%=i%>+1)); --%>
		/* var content = document.createElement('div');
		content.className = "tdl-content"; */
		var content2 = document.getElementById('projectListDiv');
		var list = document.createElement('ul');
		
		
	<%
		if (unassignedTasks!= null) {
			
			for(int i = 0; i < unassignedTasks.size(); i++) { 
				System.out.println(" "+unassignedTasks.get(i).getTaskID());
	%>
				var listItem = document.createElement('li');
				var label = document.createElement('label');
				var add = document.createElement('i');
				var span = document.createElement('span');
				var link = document.createElement('a');
				link.name = "<%=unassignedTasks.get(i).getTaskID()%>";
				link.innerHTML = "+";
				span.innerHTML = "<%= unassignedTasks.get(i).getTask() %>";
				label.appendChild(link);
				label.appendChild(add);
				label.appendChild(span);
				listItem.appendChild(label);
				list.appendChild(listItem);		
	<%			
				
			}
	%>
			
			content2.appendChild(list);
	<%	
		}
	
		else {
	%>
			var listItem = document.createElement('li');	
			listItem.appendChild(label);
	<%	
		}
	%>
			
	list.appendChild(listItem);
	content.appendChild(list);
		
	}
	
	
	</script>

	<!-- side bar -->
	<div id="mySidenav" class="sidenav">
		<img id="avatar" src="https://www.w3schools.com/howto/img_avatar.png"
			width="100" height="100" /> <a id="name" href="profile.jsp"><%=request.getSession().getAttribute("username") %></a> <span id="projectDirection"></span>
		<form action="createProject.jsp" method="POST" class="form create project">
			<a id="createProject">Create a Project</a>
			<input id="createProjectBar" type="text" name="projectName" class="form__input" placeholder="Project Code">
		</form><a id="logoutButton"

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
				type="text" name="projectID">
		</div>
		<div onclick="changeNav()">
			<i id="navButton" class="fas fa-arrow-right fa-7x"></i>
		</div>
		<!-- content -->
		<div id="container">
			<div class="UsersTask">
				<div id="userCard1" class="tdl-holder">
					<!-- 					<h2>User 1</h2> -->
					<!-- 					<div class="tdl-content1"> -->
					<!-- 						<ul> -->
					<!-- 						</ul> -->
					<!-- 					</div> -->
					<!-- 					<div class="progress"> -->
					<!-- 						<div class="progress-bar bg-success progress-bar-striped" -->
					<!-- 							role="progressbar" style="width: 25%" aria-valuenow="25" -->
					<!-- 							aria-valuemin="0" aria-valuemax="100"></div> -->
					<!-- 					</div> -->
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
			</div>
			<div class="ProjectTasks">
				<div id="projectTasksList" class="tdl-holder">
					<h2>Unassigned Tasks</h2>
					<div id="projectListDiv" class="tdl-content"></div>
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


    var userProjects;
    <%ArrayList<Project> userProjects  =(ArrayList<Project>) request.getSession().getAttribute("userProjects");
    for (int i = 0; i < userProjects.size(); i++){ %>
    $("#projectDirection").append("<a href='#' onclick='jumpToProject(\"<%=userProjects.get(i).getID()%>\")" + "'>" + "<%=userProjects.get(i).getTitle()%>" + "</a>");

    <%}%>

    function jumpToProject(projectID, userID){
    	
		var url = "LoadProjectData";
		$.ajax({
			type : "GET",
			url : url,
			data : {
				projectID: projectID,
				userID: userID,
			},
			// Runs once the request returns
			success : function(content) {
				console.log("going to swervlet");
				location.href = "project.jsp";
				// 	                  sendUpdateToAllOtherUsers();
			}
		});
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
            	var projectID = "<%=request.getSession().getAttribute("projectID")%>";
            	//console.log(taskTitle);
            	//var taskID = addTaskInDatabase(taskTitle, projectID);
            	
            	var url = "UpdateDatabase?queryType=addTask&title="+taskTitle+"&projectID="+projectID;
            	var databaseRequest = new XMLHttpRequest();
            	databaseRequest.open('GET', url, true);
            	databaseRequest.send();
            	
            	databaseRequest.onload = function() {
            		console.log("database response = "+databaseRequest.response);
            		var taskID = databaseRequest.response;
	                $(".tdl-content ").append("<li><label><i></i><span class=\"val\">"+ v +"</span><a name=\""+taskID+"\" href='#'>+</a></label></li>");
            	}
	            $(this).val("");
            	
            }
        }
    });


    // when you add a task into your task list;
    $(".tdl-content").on('click', "a", function(){
        var _li = $(this).parent().parent("li");
        var userTaskList = ("<%=request.getSession().getAttribute("tdl-content")%>");
        var userID = "<%=request.getSession().getAttribute("userID")%>";
        console.log(<%=request.getSession().getAttribute("userID")%>);
        console.log("taskID = "+(this).name);

        var taskID = (this).name;
        console.log("taskID = "+ taskID); 
        var url = "UpdateDatabase?queryType=assignTask&userID="+userID+"&taskID="+taskID;
    	var databaseRequest = new XMLHttpRequest();
    	databaseRequest.open('GET', url, true);
    	databaseRequest.send();
    	
    	databaseRequest.onload = function() {
    		console.log("database response = "+databaseRequest.response);
    		var taskID = databaseRequest.response;
            //$(".tdl-content ").append("<li><label><i></i><span class=\"val\">"+ v +"</span><a name=\""+taskID+"\" href='#'>+</a></label></li>");
	        $(".<%=request.getSession().getAttribute("tdl-content")%>").append("<li><label><input type=\"checkbox\" unchecked><i></i><span class=\"val\">"+ _li.find("span").text()+"</label></li>");
    	}
        $(this).val("");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function(){
            _li.remove();
        });
        return false;
    });

    $("#createProjectBar").toggle();
    $('#createProject').click(function () {
        $("#createProjectBar").toggle();
        return false;
    });

</script>
</body>
</html>
