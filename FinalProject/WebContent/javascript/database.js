function addTaskInDatabase(title, projectID) {

	var url = "UpdateDatabase";
	var type = "addTask";

	$.ajax({
		type : "GET",
		url : url,
		data : {
			queryType: type,
			title: title,
			projectID: projectID,
		},
//		data : 'queryType=' + type + '&title=' + title + '&projectID='+ projectID,
		// Runs once the request returns
		success : function(content) {
			console.log("updated task in database");
			// 	                  sendUpdateToAllOtherUsers();
		}
	});
}

function markCompletedInDatabase(userID, taskID) {
	var url = "UpdateDatabase.java";
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
	var url = "UpdateDatabase.java";
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

function generateCode() {
	  var text = "";
	  var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	  for (var i = 0; i < 6; i++)
	    text += possible.charAt(Math.floor(Math.random() * possible.length));

	  return text;
}
