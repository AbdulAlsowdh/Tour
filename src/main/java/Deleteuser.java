import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Deleteuser
 */
@WebServlet("/Deleteuser")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class Deleteuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteuser() {
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
		String name = request.getParameter("username");
		String mobilenumber = request.getParameter("mobilenumber");
		String email = request.getParameter("usermail");
	    try { 
	    	Statement statement = con.createStatement();
			String deletequery = "DELETE FROM User WHERE name='"+name+"' AND mobilenumber='"+mobilenumber+"'AND email='"+email+"';";
		    statement.executeUpdate(deletequery);
		    response.sendRedirect("./dashboard/deleteuser.jsp");
		}catch(Exception e){
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<h1>"+e+  "</h1>");
	        out.println();
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
