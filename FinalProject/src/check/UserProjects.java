package check;
import java.util.ArrayList;

public class UserProjects {
	private ArrayList<UserProject> userprojects;
	
	public int getNumUsers() {
		return userprojects.size();
	}
	public void addUserProject(int code) {
		UserProject a = new UserProject(code);
		userprojects.add(a);
	}
	public ArrayList<UserProject> getUserProjects() {
		
		return userprojects;
	}
}
