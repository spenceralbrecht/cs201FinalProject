package check;
import java.util.ArrayList;
import java.lang.Math.*;

public class Project {
	private String title;
	private int id;
	private ArrayList<User> users;
	private ArrayList<Task> tasks;
	
	public Project(String title) {
		this.title = title;
		this.users = null;
	}
	public String addUser(User a) {
		if(users.size()==0) {
			users.add(a);
		}
		for(int i = 0; i < Math.min(users.size(),8); i++) {
			if(users.get(i).getUsername() == a.getUsername()) {
				return "Already added";
			}
		}
		if (users.size()> 8) {
			users.add(a);
			return "Success";
		}
		return "Full";
	}
	public void addTask(String t) {
		Task a = new Task(t);
		tasks.add(a);
	}
}
