package check;

public class UserTask {
	private boolean completed;
	private String task;
	public UserTask(String task) {
		this.completed = false;
		this.task = task;
	}
	public void setComplete() {
		completed = true;
	}
	public boolean getComplete() {
		return completed;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getTask() {
		return task;
	}
}
