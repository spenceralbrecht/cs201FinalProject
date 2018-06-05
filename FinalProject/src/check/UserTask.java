package check;

public class UserTask {
	private boolean completed;
	private String taskname;
	public UserTask() {
		this.taskname = null;
	}
	public UserTask(String taskname) {
		this.completed = false;
		this.taskname = taskname;
	}
	public void setComplete() {
		completed = true;
	}
	public boolean getCompleteStatus() {
		return completed;
	}
	public void setTaskName(String taskname) {
		this.taskname = taskname;
	}
	public String getTaskName() {
		return taskname;
	}
}
