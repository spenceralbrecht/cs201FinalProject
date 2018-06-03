package check;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import backend.Database;

/**
 * Servlet implementation class loadProjectData
 */
@WebServlet("/loadProjectData")
public class loadProjectData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loadProjectData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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

}
