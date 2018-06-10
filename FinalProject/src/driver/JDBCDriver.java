package driver;

import java.io.PrintWriter;
import java.sql.*;
import check.*;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

public class JDBCDriver {
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static PrintWriter pw = null;
	private static PreparedStatement ps = null;
	private static int userID = 0;
	
	public static void connect(){
		try {
	
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/Users?user=root&password=password!&useSSL=false");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(){
		try{
			if (rs!=null){
				rs.close();
				rs = null;
			}
			if(conn != null){
				conn.close();
				conn = null;
			}
			if(ps != null ){
				ps = null;
			}
		}catch(SQLException sqle){
			System.out.println("connection close error");
			sqle.printStackTrace();
		}
	}

	public static boolean validate(String usr, String pwd){
		connect();
		try {
			ps = conn.prepareStatement("SELECT pw, userID FROM User WHERE username=?");
			ps.setString(1, usr);
			rs = ps.executeQuery();
			System.out.println(rs);
			//HttpSession session = null;
			if(rs.next()){
				if(pwd.equals(rs.getString("pw")) ){
					
					return true;
				
				}
			}
		} catch (SQLException e) {
			System.out.println("SQLException in function \"validate\"");
			e.printStackTrace();
		}finally{
			close();
		}
		return false;		
	}
	public static int getUserID(String username, String password) {
		connect();
		try {
			ps = conn.prepareStatement("SELECT userID FROM User WHERE username=? AND pw=?");
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			System.out.println(rs);
			//HttpSession session = null;
			if(rs.next()){
				return (rs.getInt("userID"));
			}
		} catch (SQLException e) {
			System.out.println("SQLException in function \"validate\"");
			e.printStackTrace();
		}finally{
			close();
		}	
		return userID;
	}
	public static int getNumTasks(int userID) {
		connect();
		try {
			ps = conn.prepareStatement("SELECT  DISTINCT t.taskID,t.userID,t.title,t.projectID FROM User u, Task t WHERE t.userID=? AND t.completed=?");
			ps.setInt(1, userID);
			ps.setBoolean(2, false);
			rs = ps.executeQuery();
			System.out.println(userID);
			int counter =0;
			while(rs.next()){
				String title = rs.getString("title");
				counter++;
			}
			return counter;
		} catch (SQLException e) {
			System.out.println("SQLException in function \"validate\"");
			e.printStackTrace();
		}finally{
			close();
		}	
		return 0;
	}
	//for sign up page
	public static boolean validateSignup(String usr, String password){
		connect();
		try {
			ps = conn.prepareStatement("SELECT username FROM User WHERE username=?");
			ps.setString(1, usr);
			rs = ps.executeQuery();
			System.out.println(rs);
			if(rs.next()){
				return true; //user exists
			}
			else { //create new user
				ps = conn.prepareStatement("INSERT INTO User (username, pw) VALUES (?,?)");
				ps.setString(1, usr);
				ps.setString(2, password);
				ps.executeUpdate();
				return false;
			}
		} catch (SQLException e) {
			System.out.println("SQLException in function \"validate\"");
			e.printStackTrace();
		}finally{
			close();
		}
		return false;		
	} 
	public static ArrayList<Project> getuserProjects(int userID){
		connect();
		ArrayList<Project> userprojects = new ArrayList<Project>();
		try {
			ps = conn.prepareStatement("SELECT DISTINCT p.projectID,p.ptitle,p.userID, up.projectID AS 'upppid',up.upID FROM UserProject up JOIN Project p WHERE up.userID=? AND up.projectID= p.projectID");
			ps.setInt(1, userID);
			rs = ps.executeQuery();
			System.out.println(rs);
			while(rs.next()){
				String ptitle = rs.getString("ptitle");//user exists
				int pID = rs.getInt("projectID");
				Project p = new Project(ptitle, pID);
				userprojects.add(p);
			}
			return userprojects;
		} catch (SQLException e) {
			System.out.println("SQLException in function \"validate\"");
			e.printStackTrace();
		}finally{
			close();
		}
		return userprojects;
	} 
	

}