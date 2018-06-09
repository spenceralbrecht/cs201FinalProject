package check;

import java.util.ArrayList;

public class User {
	private String username;
	private String password;
	private ArrayList<UserProject> userprojects;
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
		this.userprojects = new ArrayList<UserProject>();
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
	public boolean UserProjectExists(int code) {
		for(int i = 0; i< userprojects.size();i++) {
			if(userprojects.get(i).getCode() == code) {
				return true;
			}
		}return false;
	}
	public UserProject getUserProject(int code) {
		for(int i = 0; i< userprojects.size();i++) {
			if(userprojects.get(i).getCode() == code) {
				return userprojects.get(i);
			}
		}
		return null;
	}
	public ArrayList<UserProject> getUserProjects() {
		return userprojects;
	}

}
