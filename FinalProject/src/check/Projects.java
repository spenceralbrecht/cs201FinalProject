package check;

import java.util.ArrayList;

public class Projects {
	private ArrayList<Project> projects;
	public int getNumProjects() {
		return projects.size();
	}
	public void addProject(String t) {
		int code = projects.size()+1;
		Project p = new Project(t, code);
		projects.add(p);
	}
	public boolean ProjectExists(int code) {
		for(int i = 0; i < projects.size();i++) {
			if(projects.get(i).getCode()==code) {
				return true;
			}
		}
		return false;
	}
	public Project getProject(int code) {
		for(int i = 0; i < projects.size();i++) {
			if(projects.get(i).getCode()==code) {
				return projects.get(i);
			}
		}
		return null;
	}
	public ArrayList<Project> getProjects() {
		return projects;
	}
}
// session userID once logged in 


