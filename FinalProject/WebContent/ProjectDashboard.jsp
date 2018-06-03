<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<link rel="stylesheet" href="ProjectDashboard.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>
</head>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block w3-border-right"
		style="display: none" id="mySidebar">
		<button onclick="w3_close()" class="w3-bar-item w3-large">Close
			&times;</button>
		<a id="username" href="#" class="w3-bar-item w3-button">Peter Pug</a>
		<a href="#" class="w3-bar-item w3-button">
			<img id="profilePicture" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsOrFQqmb0ugvL-8vTwyqawh_H3Lar8JsJMHMBmXBLChT_7dId" 
			class="w3-circle">
		</a>
		<a href="#" class="w3-bar-item w3-button sidebarLink">Other Project</a> 
		<a href="#" class="w3-bar-item w3-button sidebarLink">Other Project</a> 
		<a href="#" class="w3-bar-item w3-button sidebarLink">Other Project</a>
		<a href="#" class="w3-bar-item w3-button sidebarLink">Logout</a>
	</div>

	<!-- Menu Bar -->
	<div class="w3-blue">
		<div class="w3-container w3-cell">
			<button class="w3-button w3-blue w3-xlarge" onclick="w3_open()">☰</button>
		</div>
		<div class="w3-container w3-cell">
			<h1>CS 201 Project</h1>
		</div>
	</div>

<!-- 	Page Content -->
	<div class="container-fluid h-100">
		<div class="row h-100">
		
<!-- 			Users -->
			<div class="col-md-3 ">
				<div class="card">
			    	<div class="card-body">
			    		<h3>User 1</h3>
						<ul class="list-group">
						  <li class="list-group-item">
						  	Task 1
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 2
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 3
						  	
						  </li>
						  <li class="list-group-item">
						  	Task 4
						  	
						  </li>
						</ul>
						<div class="progress">
						    <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
						      <span class="sr-only">70% Complete</span>
						    </div>
						</div>
			    	</div>
		 		</div>
			</div>
			
			<div class="col-md-3 ">
				<div class="card">
			    	<div class="card-body">
			    		<h3>User 2</h3>
						<ul class="list-group">
						  <li class="list-group-item">
						  	Task 1
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 2
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 3
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 4
						  	
						  </li>
						</ul>
						<div class="progress">
						    <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
						      <span class="sr-only">50% Complete</span>
						    </div>
						</div>
			    	</div>
		 		</div>
			</div>
			<div class="col-md-3 ">
				<div class="card">
			    	<div class="card-body">
			    		<h3>User 3</h3>
						<ul class="list-group">
						  <li class="list-group-item">
						  	Task 1
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 2
						  </li>
						  <li class="list-group-item">
						  	Task 3
						  	
						  </li>
						  <li class="list-group-item">
						  	Task 4
						  	
						  </li>
						</ul>
						<div class="progress">
						    <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:20%">
						      <span class="sr-only">20% Complete</span>
						    </div>
						</div>
			    	</div>
		 		</div>
			</div>
			
<!-- 			Group Task List -->
			<div class="col-md-3 ">
				<div class="card">
			    	<div id="mainTasksCard" class="card-body">
			    		<h3>All tasks</h3>
						<ul id="mainTasksList" class="list-group">
						  <li class="list-group-item">
						  	Task 1
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 2
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 3
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 4
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 5
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 6
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 7
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 8
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 9
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 10
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 11
						  	<span class="badge badge-primary badge-pill">Take Task</span>
						  </li>
						  <li class="list-group-item">
						  	Task 12
						  	<span class="badge badge-primary badge-pill">Take Task</span>
						  </li>
						  <li class="list-group-item">
						  	Task 13
							<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 14
						  	<span class="glyphicon glyphicon-ok"></span>
						  </li>
						  <li class="list-group-item">
						  	Task 15
						  	<span class="badge badge-primary badge-pill">Take Task</span>
						  </li>
						  <li class="list-group-item">
						  	Task 16
						  	<span class="badge badge-primary badge-pill">Take Task</span>
						  </li>
						</ul>
			    	</div>
		 		</div>
			</div>
		</div>		
<!-- 	</div> -->

		<footer class="footer">
	      <div class="container-fluid fixed-bottom">
	      	<div class="row">
	      		<div class="col-md-10">
			      	<div class="progress">
					    <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:70%">
					      <span class="sr-only">70% Complete</span>
					    </div>
					</div>
	      		</div>
	      		<div class="col-md-2">
					<div id="projectCodeDiv">
				        <span id="projectCode">#QF734G9</span>			
					</div>	      			
	      		</div>
	      	</div>
	      </div>
	    </footer>
	
<!-- 	<div class="w3-container"> -->
<!-- 	</div> -->
	
	</div>
		
		

	<script>
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}
	</script>
</body>
</html>