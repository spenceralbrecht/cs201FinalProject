package check;

import java.util.ArrayList;

public class User {
	private String username;
	private String password;
	private UserProjects userprojectslist;
	
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
		
	}
	
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public ArrayList<UserProject> getuserProjects() {
		return userprojectslist.getUserProjects();
	}
	public void addProject(int code) {
		userprojectslist.addUserProject(code);
	}
	

}
