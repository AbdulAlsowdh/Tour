

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
/**
 * Servlet implementation class Addpackage
 */
@WebServlet("/Addpackage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
					maxFileSize = 1024 * 1024 * 10, // 10MB
					maxRequestSize = 1024 * 1024 * 50)
public class Addpackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addpackage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con=getConnection();
		String packageid = request.getParameter("pid");
	    String name = request.getParameter("packagename");
	    String price = request.getParameter("packagePrice");
	    String description = request.getParameter("description");
	    InputStream inputStream = null; 
	    Part filePart = request.getPart("imagefile");
	    if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
		String checkquery = "SELECT pid " + "FROM package";
		int find=0;
		try {
			Statement statement  = con.createStatement();
			ResultSet resultset    = statement.executeQuery(checkquery);
			while (resultset.next()) {
				
				if(packageid.equals(resultset.getString(1))){
					find++;
				}	                    
			}
		}catch(Exception e){
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<h1>"+e+  "</h1>");
	        out.println();
		}
		if(find!=0) {
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        
	        response.sendRedirect("./addpackage.jsp");
	        out.println();
		}else {
			try {
				PreparedStatement statement=con.prepareStatement("insert into package values(?,?,?,?,?)");  
				statement.setString(1,packageid);
				statement.setString(2,name);
				statement.setString(3,price);
				statement.setString(4,description);
				if (inputStream != null) {
	                
	                statement.setBlob(5, inputStream);
	            }
				statement.executeUpdate();
				response.sendRedirect("./addpackage.jsp");
			}catch(Exception e){
				response.setContentType("text/html");
		        PrintWriter out = response.getWriter();
		        out.println("<h1>"+e+  "</h1>");
		        out.println();
			}
		}
		
	}
	static Connection getConnection() {
    	java.sql.Connection con=null;
    	try {

        	Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
    	}catch(Exception e) {
    		
    	}
    	return (Connection) con;
    }
}
