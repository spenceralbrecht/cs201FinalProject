package validation;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import backend.Database;
import backend.User;

/**
 * Servlet implementation class loginValidation
 */
@WebServlet("/loginValidation")
public class loginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginValidation() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username").toString().trim();
		String password = request.getParameter("password").toString().trim();
		
		String next = "/results.jsp";
		
		User user = getUser(username);
		
		// Check if the username exists and if the password is correct
		if (getUser(username)==null || !password.equals(user.getPassword())) {
			request.setAttribute("error", "Username or password is incorrect");
			next = "/login.jsp";
		}
		
		// Add the users to the request for later access
		if (next.equals("/results.jsp")) {
			request.setAttribute("users", getDatabase());
			
			// Add the user that will be logged in to the request
			request.setAttribute("loggedIn", user);
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
	}
	
	protected User getUser(String username) {
		Database database = getDatabase();
		ArrayList<User> users = database.getUsers();
		
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getUsername().equals(username)) {
				return users.get(i);
			}
		}
		return null;
	}
	
	protected Database getDatabase() {
		String file = null;
		BufferedReader reader = null;
		Gson gson = null;
		Database database = null;
	
		try {
			// Try to read in the JSON file
			file = this.getServletContext().getRealPath("Sample.json");
			reader = new BufferedReader(new FileReader(file));
			gson = new GsonBuilder().setPrettyPrinting().create();
			database = gson.fromJson(reader, Database.class);
			
			return database;
		} 
		catch (com.google.gson.JsonSyntaxException e) {
			System.out.println("File is not well-formed JSON.");
			System.out.println();
			return database;	
		}
		catch (com.google.gson.JsonIOException e) {
			System.out.println("JSON file could not be read.");
			System.out.println();
			return database;	
		}
		catch (FileNotFoundException e) {
			System.out.println("File not found.");
			System.out.println();
			return database;	
		}
		
	}

}
