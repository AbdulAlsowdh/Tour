

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
		String name = request.getParameter("registername");
	    String mobilenumber = request.getParameter("registermobile");
	    String email = request.getParameter("registeremail");
	    String password = request.getParameter("registerpassword");
	    String checkuserquery = "SELECT name,mobilenumber,email, password from User";
		int find=0;
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checkuserquery);
			while (rs.next()) {
				
				if(name.equals(rs.getString(1)) && mobilenumber.equals(rs.getString(2)) && email.equals(rs.getString(3))){
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
			request.setAttribute("registererrormessage", "*Inserted fields are already exists");
			request.setAttribute("errormessage", "*Try to login with email and password");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}else {
			try {
				String insertUserQuery="insert into User(Name,Mobilenumber,email,password) values(?,?,?,?)";
				PreparedStatement statement=con.prepareStatement(insertUserQuery);
				statement.setString(1,name);
				statement.setString(2,mobilenumber);
				statement.setString(3,email);
				statement.setString(4,password);
				statement.executeUpdate();
				
				response.sendRedirect("index.jsp");
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

