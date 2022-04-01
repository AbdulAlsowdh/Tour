



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Booknow
 */
@WebServlet("/Booknow")
public class Booknow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Booknow() {
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
		String name = request.getParameter("bookingusername");
		String place = request.getParameter("bookingplace");
		String departure = request.getParameter("departuredate");
		String address = request.getParameter("bookingaddress");
		String number = request.getParameter("bookingmobile");
		String passengercount = request.getParameter("passsengercount");
		String arrival = request.getParameter("arrivaldate");
		try {
			PreparedStatement statement=con.prepareStatement("insert into booking values(?,?,?,?,?,?,?)");  
			statement.setString(1,name);
			statement.setString(2,place);
			statement.setString(3,departure);
			statement.setString(4,address);
			statement.setString(5,number);
			statement.setString(6,passengercount);
			statement.setString(7,arrival);
			
			statement.executeUpdate();
			response.sendRedirect("booking.jsp");
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
