import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
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
		
		String email = request.getParameter("loginEmail");
	    String password = request.getParameter("loginpassword");
	    
		String sql = "SELECT email, password " + "FROM User";
		int find=0;
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(sql);
			while (rs.next()) {
				if(email.equals(rs.getString(1)) && password.equals(rs.getString(2))){
					find++;
				}	                    
			}
		}catch(Exception e){
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<h1>"+e+  "</h1>");
	        out.println();
		}
		if(find==0) {
			request.setAttribute("loginerrormessage", "*Invalid Id or Password");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}else {
			response.sendRedirect("./home.jsp");
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
