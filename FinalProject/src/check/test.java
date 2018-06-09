package check;


import com.google.gson.*; 



import java.io.*;

public class test {
	public static void main(String [] args) {
		Gson gson = new Gson();
		Users users = new Users();
		users.addUser("JeffreyMiller", "PHD");
		users.addUser("201Student", "needSLEEP");
		if(users.userExists("JeffreyMiller")) {
			users.getUser("JeffreyMiller").addUserProject(100);
			if (users.getUser("JeffreyMiller").UserProjectExists(100)) {
				UserProject p = users.getUser("JeffreyMiller").getUserProject(100);
				p.addTask("Teach 201");
			}
		}if(users.userExists("201Student")) {
			users.getUser("201Student").addUserProject(2);
			if (users.getUser("201Student").UserProjectExists(2)) {
				UserProject p = users.getUser("201Student").getUserProject(2);
				p.addTask("201 Lab");
				p.addTask("201 Class");
				p.addTask("201 Assignment#4");
				p.addTask("201 Final Project");
				p.addTask("201 Deliverables");
				p.addTask("201 Test");
				p.addTask("201 Make Cheat Sheet");
			}
		}
	
		try {
			
			// this says where to write it when it's written
			String json1 = gson.toJson(users); 
			FileWriter fw = new FileWriter("C:\\users.json");
			fw.write(json1);
			fw.close();

		} catch (JsonIOException q) {
			System.out.println(q.getMessage());
	
		} catch (IOException q) {
			System.out.println(q.getMessage());
		}
	}
}
