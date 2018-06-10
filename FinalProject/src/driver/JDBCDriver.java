package driver;

import java.sql.*;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

public class JDBCDriver {
	private static Connection conn = null;
	private static ResultSet rs = null;
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
					userID = (rs.getInt("userID"));
					//session.setAttribute("username", usr);
					//session.setAttribute("userID", userID);
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
	public static int getUserID() {
		return userID;
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
	
	

}