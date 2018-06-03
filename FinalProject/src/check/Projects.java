package check;

import java.util.ArrayList;

public class Projects {
	private ArrayList<Project> projects;
	public int getNumProjects() {
		return projects.size();
	}
	public void addProject(Project a) {
		projects.add(a);
	}
	public boolean ProjectExists(int code) {
		for(int i = 0; i < projects.size();i++) {
			if(projects.get(i).getCode()==code) {
				return true;
			}
		}
		return false;
	}
	
}
