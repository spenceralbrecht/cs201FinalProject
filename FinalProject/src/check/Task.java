package check;

public class Task {
	private boolean assigned;
	private int taskID; 
	private String title;
	public Task(String t) {
		this.assigned = false;
		this.title= t;
	}
	public void setTask(String title) {
		this.title= title;
	}
	public void setID(int t) {
		this.taskID= t;
	}
	public void setAssigned() {
		this.assigned = true;
	}
	public String getTask() {
		return title;
	}
	public int getTaskID( ) {
		return taskID;
	}
	public boolean getAssigned() {
		return assigned;
	}
}
