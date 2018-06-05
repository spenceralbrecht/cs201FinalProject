package check;

public class Task {
	private boolean assigned;
	private String t;
	public Task(String t) {
		this.assigned = false;
		this.t= t;
	}
	public void setTask(String t) {
		this.t= t;
	}
	public void setAssigned() {
		this.assigned = true;
	}
	public String getTask() {
		return t;
	}
	public boolean getAssigned() {
		return assigned;
	}
}
