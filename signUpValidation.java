package validation;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import backend.Book;
import backend.Database;
import backend.Library;
import backend.User;

/**
 * Servlet implementation class signUpValidation
 */
@WebServlet("/signUpValidation")
public class signUpValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signUpValidation() {
        super();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username").toString().trim();
		String password = request.getParameter("password").toString().trim();
		String imageURL = request.getParameter("url").toString().trim();
		
		System.out.println("username="+username);
		
		String next = "/results.jsp";
		
		// Check if the username is blank
		if (username.equals("")) {
			request.setAttribute("username_blank", "Username cannot be blank");
			next = "/signUp.jsp";
		}
		
		// Check if the username is taken
		ArrayList<String> usernames = getUsernames(getDatabase());
		
		if (usernames.contains(username)) {
			request.setAttribute("username_taken", "Username is already taken");
			next = "/signUp.jsp";
		}
		
		// Check if the password is empty
		if (password.equals("")) {
			request.setAttribute("password_blank", "Password cannot be blank");
			next = "/signUp.jsp";
		}
		
		// Check if the image URL is empty
		if (imageURL.equals("")) {
			request.setAttribute("img_blank", "URL cannot be blank");
			next = "/signUp.jsp";
		}
		
		// Save the new user to the "server" if the input was valid
		// and add the users to the request
		if (next.equals("/results.jsp")) {
			updateDatabase(username, password, imageURL);
			request.setAttribute("users", getDatabase());
			
			// Add the user that will be logged in to the request
			request.setAttribute("loggedIn", getUser(username));
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(next);
		dispatch.forward(request, response);
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
	
	private void updateDatabase(String username, String password, String imageURL) {
		
		Database database = getDatabase();
		Set<String> followers = new HashSet<String>();
		Set<String> following = new HashSet<String>();
		Set<String> favorite = new HashSet<String>();
		Set<String>  read = new HashSet<String>();
		Library library = new Library(read, favorite);
		
		// Create the new user
		User newUser = new User(username, password, imageURL, followers, following, library);
		
		// Add the new user to the database
		database.getUsers().add(newUser);
		
		saveToFile(database);
		
	}
	
	private void saveToFile(Database database) {
		String file = this.getServletContext().getRealPath("Sample.json");
		try (Writer writer = new FileWriter(file)) {
		    Gson gson = new GsonBuilder().setPrettyPrinting().create();
		    gson.toJson(database, writer);
		} catch (IOException e) {
			System.out.println("Failed writing to file.");
		}
	}
	
	protected ArrayList<String> getUsernames(Database database) {
		ArrayList<String> usernames = new ArrayList<String>();
		database = getDatabase();
		
		for (int i=0; i<database.getUsers().size(); i++) {
			usernames.add(database.getUsers().get(i).getUsername());
		}
		
		return usernames;
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
}
