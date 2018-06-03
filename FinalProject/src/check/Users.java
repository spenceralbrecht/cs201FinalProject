package check;

import java.util.ArrayList;

public class Users {
protected ArrayList<User> users;
	
	public int getNumUsers() {
		return users.size();
	}
	public void addUser(User a) {
		users.add(a);
	}
}
