package database;

import java.io.IOException;

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

	 /* @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Option for getting either a list of tasks associated with a single user
		// or the total tasks for the project

		String projectJSP = "/project.jsp";

		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			// Needed to import MySQL driver code
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager
					.getConnection("jdbc:mysql://localhost/Users?user=root&password=spencer&useSSL=false");

			int projectID = Integer.parseInt(request.getParameter("projectID"));
			int userID = (int) request.getSession().getAttribute(("userID"));

			// Get a list of users in the project
			preparedStatement = conn
					.prepareStatement("SELECT DISTINCT up.userID, u.username FROM UserProject up JOIN User u WHERE up.projectID =? AND up.userID= u.userID");
			preparedStatement.setInt(1, projectID);
			resultSet = preparedStatement.executeQuery();

			ArrayList<Integer> userIDs = new ArrayList<Integer>();
			ArrayList<String> userNames = new ArrayList<String>();

			while (resultSet.next()) {
				userIDs.add(resultSet.getInt("userID"));
				userNames.add(resultSet.getString("username"));
			}

			request.getSession().setAttribute("userNames", userNames);

			Map<String, Map<String, Boolean>> userTaskMap = new HashMap<>();

			for (int userIDNum : userIDs) {
				preparedStatement = conn.prepareStatement(
						"SELECT DISTINCT u.userID,t.completed, u.username, t.title, t.userID, t.projectID FROM Task t JOIN User u WHERE t.userID=? AND t.projectID = ?");
				preparedStatement.setInt(1, userIDNum);
				preparedStatement.setInt(2, projectID);

				Map<String, Boolean> results = new HashMap<String, Boolean>();
				String userName = "";
				// Execute the query and get the result in a table
				resultSet = preparedStatement.executeQuery();
				while (resultSet.next()) {
					userName = resultSet.getString("username");
					//userNames.add(userName);
					String title = resultSet.getString("title");
					Boolean completed = resultSet.getBoolean("completed");
					results.put(title, completed);
				}
				userTaskMap.put(userName, results);
			}

			// Sets the attribute for the list of tasks for each user
			request.getSession().setAttribute("userTaskMap", userTaskMap);

			System.out.println("in lpd line 97" + request.getSession().getAttribute("userTaskMap"));

			// Get all unassigned tasks in a specific project
			preparedStatement = conn.prepareStatement(
					"SELECT DISTINCT t.taskID,t.userID,t.title,t.projectID FROM Task t WHERE t.projectID=? AND t.userID=?");
			preparedStatement.setInt(1, projectID);
			preparedStatement.setInt(2, userID);

			ArrayList<String> unassignedTasks = new ArrayList<String>();
			// Execute the query and get the result in a table
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String title = resultSet.getString("title");
				unassignedTasks.add(title);
			}

			// Send back a list of titles to the JSP
			request.setAttribute("unassignedTasks", unassignedTasks);


		} catch (SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: " + cnfe.getMessage());
		} finally {
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(projectJSP);
		dispatch.forward(request, response);
	}

}
