package check;

public class UserProject {
	private int code;
	private UserTasks usertasks;
	public UserProject(int code, UserTasks usertasks) {
		this.code = code;
		this.usertasks = usertasks;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int k) {
		this.code = k;
	}
	public UserTasks getUserTasks() {
		return usertasks;
	}
	public void addTask(UserTask a) {
		usertasks.addTask(a);
	}
}
