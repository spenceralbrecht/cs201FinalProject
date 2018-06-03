package check;

import java.util.ArrayList;

public class User {
	private String username;
	private String password;
	private ArrayList<UserProject> userprojects;
	
	
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
	
	public int getNumProjects() {
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
