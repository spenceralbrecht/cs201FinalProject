package check;

import java.util.ArrayList;

public class Users {
	protected ArrayList<User> users;
	
	public Users() {
		this.users = new ArrayList<User>();
	}
	
	public int getNumUsers() {
		return users.size();
	}
	public void addUser(String username, String password) {
		User a = new User(username, password);
		if(users.isEmpty()) {
			users = new ArrayList<User>();
			
		}
		users.add(a);
	}
	public boolean userExists(String username) {
		for(int i = 0; i < users.size();i++) {
			if(users.get(i).getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}
	public User getUser(String username) {
		for(int i = 0; i < users.size();i++) {
			if(users.get(i).getUsername().equals(username)) {
				return users.get(i);
			}
		}
		return null;
	}
	public ArrayList<User> getUsers() {
		return users;
	}
}
