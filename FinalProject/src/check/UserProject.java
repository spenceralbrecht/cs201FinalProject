package check;
import java.util.ArrayList;

public class UserProject {
	private int code;
	private ArrayList<UserTask> usertasks;
	
	public UserProject(int code) {
		this.code = code;
		this.usertasks = null;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int k) {
		this.code = k;
	}
	public ArrayList<UserTask> getUserTasks() {
		return usertasks;
	}
	public void addTask(UserTask a) {
		usertasks.add(a);
	}
	public int getNumTasks() {
		return usertasks.size();
	}
}
