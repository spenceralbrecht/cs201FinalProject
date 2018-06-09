package check;
import java.util.ArrayList;

public class UserProject {
	private int code;
	private ArrayList<UserTask> usertasks;

	public UserProject() {
		this.usertasks = new ArrayList<UserTask>();
	}
	public UserProject(int code) {
		this.code = code;
		this.usertasks = new ArrayList<UserTask>();
	}
	public int getCode() {
		return code;
	}
	public ArrayList<UserTask> getUserTasks() {
		return usertasks;
	}
	public void addTask(String a) {
		UserTask b = new UserTask(a);
		if (usertasks.size()==0) {
			this.usertasks = new ArrayList<UserTask>();
			usertasks.add(b);
		}
		else {	usertasks.add(b);}
	}
	public int getNumTasks() {
		return usertasks.size();
	}
}
