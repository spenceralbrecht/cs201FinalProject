package database;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class loadProjectData
 */
@WebServlet("/UpdateDatabase")
public class UpdateDatabase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDatabase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String option = request.getParameter("queryType");
		String projectJSP = "project.jsp";
		
//		String title = "helloo";
//		int projectID = 82;
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root&password=spencer&useSSL=false");
			
			// Adding a task
			if (option.equals("addTask")) {
				String title  = request.getParameter("title");
				int projectID = Integer.valueOf(request.getParameter("projectID"));
				System.out.println("title = "+title);
				System.out.println("project id "+projectID);
				
//				preparedStatement = conn.prepareStatement("INSERT INTO Task(title, projectID, userID) VALUES ('"+title+"',"+ projectID + "',null");
				String query = "INSERT INTO Task (title, projectID) VALUES(?, ?)";
				
				preparedStatement = conn.prepareStatement(query);
				preparedStatement.setString(1, title);
				preparedStatement.setInt(2, projectID);
				
				// Execute the SQL command for adding a task to the database
				preparedStatement.executeUpdate();				
			}
			else {
				
				int userID = Integer.valueOf(request.getParameter("userID"));
				int taskID = Integer.valueOf(request.getParameter("taskID"));
				
				// Assigning a task to a user
				if (option.equals("assignTask")) {
					preparedStatement = conn.prepareStatement("UPDATE Task SET userID =? WHERE taskID =? ");
					preparedStatement.setInt(1, userID);
					preparedStatement.setInt(2, taskID);	
				}
				// Mark a task as completed
				if (option.equals("markCompleted")) {
					preparedStatement = conn.prepareStatement("UPDATE Task WHERE taskID =? SET completed =?");
		            preparedStatement.setInt(1, taskID);
		            preparedStatement.setBoolean(2, true);
				}	
				preparedStatement.executeUpdate();
				
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
	}

}
