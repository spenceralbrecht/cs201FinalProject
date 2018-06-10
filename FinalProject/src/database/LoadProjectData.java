package database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoadProjectData
 */
@WebServlet("/LoadProjectData")
public class LoadProjectData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadProjectData() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Option for getting either a list of tasks associated with a single user 
		// or the total tasks for the project
		String option = request.getParameter("queryType");
		String projectJSP = "project.jsp";
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			// Needed to import MySQL driver code
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root&password=spencer&useSSL=false");
			
			// Getting a list of tasks associated with one specific user
			if (option.equals("getUserTasks")) {
				int projectID = Integer.valueOf(request.getParameter("projectID"));
				int userID = Integer.valueOf(request.getParameter("userID"));
				
				// Get all tasks with specific userID and specific projectID
				preparedStatement = conn.prepareStatement("SELECT DISTINCT t.taskID,t.completed,t.title,t.projectID FROM User u, Task t WHERE t.userID=? AND t.projectID=?");
	            preparedStatement.setInt(1, userID);
	            preparedStatement.setInt(2, projectID);
	            
	            Map<String, Boolean> results = new HashMap<String, Boolean>();
	            
	            // Execute the query and get the result in a table
	            resultSet = preparedStatement.executeQuery();
	            while(resultSet.next()) {
	                String title = resultSet.getString("title");
	                Boolean completed = resultSet.getBoolean("completed");
	                results.put(title, completed);
	            }
				
	            // Send a map of the results back to the JSP
	            request.setAttribute("resultsMap", results);
			}
			// Getting the list of tasks associated with the entire project
			if (option.equals("getProjectTasks")) {
				
				int projectID = Integer.valueOf(request.getParameter("projectID"));
				
				// Get all tasks in a specific project
				preparedStatement = conn.prepareStatement("SELECT DISTINCT t.taskID,t.userID,t.title,t.projectID FROM Task t WHERE  t.projectID=? AND t.assigned=?");
	            preparedStatement.setInt(1, projectID);
	            preparedStatement.setBoolean(2, false);
	            
	            ArrayList<String> results = new ArrayList<String>(); 
	            // Execute the query and get the result in a table
	            resultSet = preparedStatement.executeQuery();
	            
	            while(resultSet.next()) {
	                String title = resultSet.getString("title"); 
	                results.add(title);
	            }
				
	            // Send back a list of titles to the JSP
	            request.setAttribute("resultsList", results);
			}
			
			if (option.equals("getProjectID")) {
				int projectCode = Integer.valueOf(request.getParameter("projectCode"));
				preparedStatement = conn.prepareStatement("SELECT p.projectID FROM Project p WHERE t.code=?");
				preparedStatement.setInt(1, projectCode);
				resultSet = preparedStatement.executeQuery();
				
                String projectID = resultSet.getString("projectID"); 
                
		        request.setAttribute("projectID", projectID);
			}
				
		}
		catch(SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		}
		catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: "+ cnfe.getMessage());
		} 
		finally {
			 try {
				if (resultSet != null) {
					 resultSet.close();
				}if (preparedStatement!= null) {
					preparedStatement.close();
				}
				if (conn != null) {
					conn.close(); }
			} catch (SQLException sqle) { 
				System.out.println(sqle.getMessage());
			}
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(projectJSP);
		dispatch.forward(request, response);
	}

}
