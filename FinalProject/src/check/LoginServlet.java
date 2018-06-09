package check;


import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		pw.println("<html><head><title>Query Results</title></head>");
		pw.println("<body>");
		String uName = request.getParameter("username");
		String pass = request.getParameter("pw");
		int userID = Integer.valueOf(request.getParameter("uID"));
		int pID = Integer.valueOf(request.getParameter("pID"));
		System.out.println(uName);
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root&password=password!&useSSL=false");
			//if different than port (3306) after local host put: port
			//rs = ps.executeQuery("SELECT * FROM User WHERE username='"+ uName +"';"); 
			//ps = conn.prepareStatement("SELECT * FROM User WHERE username=? AND pw=?");
			//ps.setString(1, uName);
			//ps.setString(2, pass);
			/*int userID =-1;
			ps = conn.prepareStatement("SELECT * FROM User WHERE username=? AND pw=?");
			ps.setString(1, uName);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while(rs.next()) { 
				userID = rs.getInt("userID");
				//int projectID = rs.getInt("projectID");
				//String password = rs.getString("pw");
				pw.println(userID+ "<br />");
				
			}
			ps.close();
			*/ //how to get the all of a users tasks  
			ps = conn.prepareStatement("SELECT DISTINCT t.taskID,t.userID,t.title,t.projectID FROM User u, Task t WHERE t.userID=? AND t.projectID=?");
			ps.setInt(1, userID);
			ps.setInt(2, pID);
			rs = ps.executeQuery();
			while(rs.next()) { 
				//String username = rs.getString("username");
				int userIDs = rs.getInt("userID");
				int taskID = rs.getInt("taskID");
				int projectID = rs.getInt("projectID");
				String titlet = rs.getString("title");
				//String password = rs.getString("pw");
				pw.println(taskID + " " + userIDs + " - " + titlet + " " + projectID + "<br />");
				
			}
		}catch(SQLException sqle) {
			System.out.println("sqle: " + sqle.getMessage());
		}catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe: "+ cnfe.getMessage());
		} finally {
			 try {
				if (rs != null) {
					 rs.close();
				}if (ps!= null) {
					ps.close();
				}
				if (pw != null) {}
				if (conn != null) {
					conn.close(); }
			} catch (SQLException sqle) { 
				System.out.println(sqle.getMessage());
			}
		}
		pw.println("</body></html>");
	}

}
