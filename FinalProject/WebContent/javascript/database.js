function addTaskInDatabase(title, projectID) {

	var url = "updateDatabase.java";
	var type = "addTask";

	$.ajax({
		type : "POST",
		data : 'queryType=' + type + '&title=' + title + '&projectID='
				+ projectID,
		url : url,

		// Runs once the request returns
		success : function(content) {
			console.log("updated task in database");
			// 	                  sendUpdateToAllOtherUsers();
		}
	});

}

function markCompletedInDatabase(userID, taskID) {
	var url = "updateDatabase.java";
	var type = "markCompleted";

	$.ajax({
		type : "POST",
		data : 'queryType=' + type + '&userID=' + userID + 'taskID=' + taskID,
		url : url,

		// Runs once the request returns
		success : function(content) {
			console.log("marked task completed in database");
			// 	        		sendUpdateToAllOtherUsers();
		}
	});
}

function assignTaskInDatabase(userID, taskID) {
	var url = "updateDatabase.java";
	var type = "assignTask";

	$.ajax({
		type : "POST",
		data : 'queryType=' + type + '&userID=' + userID + 'taskID=' + taskID,
		url : url,

		// Runs once the request returns
		success : function(content) {
			console.log("added task in database");
			// 	        		sendUpdateToAllOtherUsers();
		}
	});
}

function getProjectID() {
	var url = "loadProjectData.java";
	var type = "getProjectID";

	$.ajax({
		type : "POST",
		data : 'queryType=' + type + '&userID=' + userID + 'taskID=' + taskID,
		url : url,

		// Runs once the request returns
		success : function(content) {
			console.log("got project ID from database");
			return content.getParameter("projectID");
			// 	        		sendUpdateToAllOtherUsers();
		}
	});
}