function addTaskInDatabase(title, projectID) {

	var url = "UpdateDatabase";
	var type = "addTask";
	var taskID = "";

	$.ajax({
		type : "GET",
		url : url,
		data : {
			queryType: type,
			title: title,
			async: false,
			projectID: projectID,
		},
//		data : 'queryType=' + type + '&title=' + title + '&projectID='+ projectID,
		// Runs once the request returns
		success : function(result) {
			console.log("updated task in database");
			taskID = result;
			console.log(taskID);
			
			// 	                  sendUpdateToAllOtherUsers();
		}
	});
	return taskID;
}

function markCompletedInDatabase(userID, taskID) {
	var url = "UpdateDatabase";
	var type = "markCompleted";

	$.ajax({
		type : "POST",
		data : 'queryType=' + type + '&userID=' + userID + '&taskID=' + taskID,
		url : url,

		// Runs once the request returns
		success : function(content) {
			console.log("marked task completed in database");
			// 	        		sendUpdateToAllOtherUsers();
		}
	});
}

function assignTaskInDatabase(userID, taskID) {
	var url = "UpdateDatabase";
	var type = "assignTask";
console.log("uid = "+ userID + " tID:" + taskID);
	$.ajax({
		type : "GET",
		data : "queryType=" + type + "&userID=" + userID + "&taskID=" + taskID,
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
