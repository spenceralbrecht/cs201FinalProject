package check;
import java.util.ArrayList;

public class Project {
	private String title;
	private int id;
	private ArrayList<User> users;
	private ArrayList<Task> tasks;
	
	public Project(String title) {
		this.title = title;
		//this.id = createId(); NEED TO DO THIS
	}
}
