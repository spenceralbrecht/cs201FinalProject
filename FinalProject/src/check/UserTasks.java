package check;
import java.util.ArrayList;
public class UserTasks {
	ArrayList<UserTask> usertasks;
	public void addTask(UserTask a) {
		usertasks.add(a);
	}
	public int getNumTasks() {
		return usertasks.size();
	}

}
