<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
   <%@ page import="jakarta.servlet.*" %>
    <%@ page import="java.io.ByteArrayOutputStream" %>
    <%@ page import="java.io.InputStream" %>
    <%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
    />
    <link rel = "icon" href = "./assets/images/Aspirelogo.png" type = "image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css" />
    <title>Dashboard</title>
    <style type="text/css">
    .bookings{
    	width: 200px;
    	height: 200px;
    	/* background : cornflowerblue; */
    	position: relative;
    }
    .outer{
    	height: 200px;
    	width: 200px;
    	border-radius : 50%;
    	/* border : 1px solid red; */
    	box-shadow: 6px 6px 10px -1px rgba(0,0,0,0.15),
    				-6px -6px 10px -1px rgba(255,255,255,0.7);
    	padding : 19px;
    }
    h4{
    	padding-left: 20px;
    }
    .inner{
    	height : 160px;
    	width: 160px;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	border-radius : 50%;
    	/* border : 1px solid red; */
    	box-shadow: inset 4px 4px 6px -1px rgba(0,0,0,0.2),
    				inset -4px -4px 6px -1px rgba(255,255,255,0.7),
    				-0.5px -0.5px 0px rgba(255,255,255,1),
    				0.5px 0.5px 0px rgba(0,0,0,0.15),
    				0px 12px 10px -10px rgba(0,0,0,0.05);
    }
    #count{
    	font-weight: 600;
    	color : #555;
    	
    }
    .bookingcircle{
    	fill:none;
    	stroke : url(#GradientColor);
    	stroke-width: 19px;
    	stroke-dasharray: 561;
    	stroke-dashoffset: 561; 	
    	animation: bookinganim 2s linear forwards; 
    }
    .usercircle{
    	fill:none;
    	stroke : url(#GradientColor);
    	stroke-width: 19px;
    	stroke-dasharray: 561;
    	stroke-dashoffset: 561; 	
    	animation: useranim 2s linear forwards; 
    }
    .packagecircle{
    	fill:none;
    	stroke : url(#GradientColor);
    	stroke-width: 19px;
    	stroke-dasharray: 561;
    	stroke-dashoffset: 561; 	
    	animation: packageanim 2s linear forwards; 
    }
    .gallerycircle{
    	fill:none;
    	stroke : url(#GradientColor);
    	stroke-width: 19px;
    	stroke-dasharray: 561;
    	stroke-dashoffset: 561; 	
    	animation: galleryanim 2s linear forwards; 
    }
    svg{
    	position : absolute;
    	top : 0;
    	left : 0;
    
    }
     @keyframes bookinganim{
    	100%{
    	<%
    	
          java.sql.Connection connec=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		connec = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      
      	String bookingquery = "SELECT count(*) FROM booking";
      	
		try {
			Statement stmt  = connec.createStatement();
			ResultSet rs    = stmt.executeQuery(bookingquery);
			while (rs.next()) {
				int count=rs.getInt(1);
				int offset = 549-((549*count)/100);
				System.out.println(offset);
			%>
      					stroke-dashoffset:<%=offset%>;
      					<%}
		}catch(Exception e){
		}
          %>
    	}
    
    }
    @keyframes useranim{
    	100%{
    		<%
      	String userquery = "SELECT count(*) FROM user";
      	
		try {
			Statement stmt  = connec.createStatement();
			ResultSet rs    = stmt.executeQuery(userquery);
			while (rs.next()) {
				int count=rs.getInt(1);
				int offset = 549-((549*count)/100);
				System.out.println(offset);
			%>
      					stroke-dashoffset:<%=offset%>;
      					<%}
		}catch(Exception e){
		}
          %>
    	}
    
    }
     @keyframes packageanim{
    	100%{
    	<%
      	String packagequery = "SELECT count(*) FROM package";
      	
		try {
			Statement stmt  = connec.createStatement();
			ResultSet rs    = stmt.executeQuery(packagequery);
			while (rs.next()) {
				int count=rs.getInt(1);
				int offset = 549-((549*count)/100);
				System.out.println(offset);
			%>
      					stroke-dashoffset:<%=offset%>;
      					<%}
		}catch(Exception e){
		}
          %>
    		
    	}
    
    }
     @keyframes galleryanim{
    	100%{
    		<%
      	String galleryquery = "SELECT count(*) FROM gallery";
      	
		try {
			Statement stmt  = connec.createStatement();
			ResultSet rs    = stmt.executeQuery(galleryquery);
			while (rs.next()) {
				int count=rs.getInt(1);
				int offset = 549-((549*count)/100);
				System.out.println(offset);
			%>
      					stroke-dashoffset:<%=offset%>;
      					<%}
		}catch(Exception e){
		}
          %>
    	}
    
    }
    
    .totalbookings{
    	padding-left: 150px;
    	padding-top: 30px;
    }
    .totaluser{
    	padding-left: 75px;
    	padding-top: 36px;
    }
    </style>
  </head>
  <body style="background-color: #dddcdc;">
    <!-- top navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark  fixed-top" style="background-color: rgb(221 118 0);">
      <div class="container-fluid">
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="offcanvas"
          data-bs-target="#sidebar"
          aria-controls="offcanvasExample"
        >
          <span class="navbar-toggler-icon" data-bs-target="#sidebar"></span>
        </button>
        <a
          class="navbar-brand me-auto ms-lg-0 ms-3 text-uppercase fw-bold"
          href="#"
          >Admin</a
        >
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#topNavBar"
          aria-controls="topNavBar"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="topNavBar">
          <form class="d-flex ms-auto my-3 my-lg-0">
            <div class="input-group">
              <input
                class="form-control"
                type="search"
                placeholder="Search"
                aria-label="Search"
              />
              <button class="btn btn-primary" type="submit">
                <i class="bi bi-search"></i>
              </button>
            </div>
          </form>
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle ms-2"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                <i class="bi bi-person-fill"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="#">Profile</a></li>
                <li><a class="dropdown-item" href="#">Logout</a></li>
                <li>
                  <a class="dropdown-item" href="#">AS Travel</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- top navigation bar -->
    <!-- offcanvas -->
    <div
      class="offcanvas offcanvas-start sidebar-nav "
      tabindex="-1"
      id="sidebar" style="background-color: rgb(221 118 0);"
    >
      <div class="offcanvas-body p-0">
        <nav class="navbar-dark">
          <ul class="navbar-nav">
            <li>
              <div class=" small fw-bold text-uppercase px-3">
                Main
              </div>
            </li>
            <li>
              <a href="dashboard.jsp" class="nav-link px-3 active">
                <span class="me-2"><i class="bi bi-speedometer2"></i></span>
                <span>Dashboard</span>
              </a>
            </li>
            <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
            <li>
              <div class=" small fw-bold text-uppercase px-3 mb-3">
                History
              </div>
            </li>
            <li>
              <a
                class="nav-link px-3 sidebar-link"
                data-bs-toggle="collapse"
                href="#booking"
              >
                <span class="me-2"><i class="bi bi-layout-split"></i></span>
                <span>Booking</span>
                <span class="ms-auto">
                  <span class="right-icon">
                    <i class="bi bi-chevron-down"></i>
                  </span>
                </span>
              </a>
              <div class="collapse" id="booking">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="bookinghistory.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span>Booking History</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="booking">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="managebooking.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Manage Booking </span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <a
                class="nav-link px-3 sidebar-link"
                data-bs-toggle="collapse"
                href="#user"
              >
                <span class="me-2"><i class="bi bi-layout-split"></i></span>
                <span>Users</span>
                <span class="ms-auto">
                  <span class="right-icon">
                    <i class="bi bi-chevron-down"></i>
                  </span>
                </span>
              </a>
              <div class="collapse" id="user">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="userhistory.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span>User History</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="user">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="deleteuser.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Delete User</span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <a
                class="nav-link px-3 sidebar-link"
                data-bs-toggle="collapse"
                href="#package"
              >
                <span class="me-2"><i class="bi bi-layout-split"></i></span>
                <span>Packages</span>
                <span class="ms-auto">
                  <span class="right-icon">
                    <i class="bi bi-chevron-down"></i>
                  </span>
                </span>
              </a>
              <div class="collapse" id="package">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="packagehistory.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span>Packages History</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="package">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="addpackage.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Add Packages</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="package">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="deletepackage.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Delete Packages</span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <a
                class="nav-link px-3 sidebar-link"
                data-bs-toggle="collapse"
                href="#gallery"
              >
                <span class="me-2"><i class="bi bi-layout-split"></i></span>
                <span>Gallery</span>
                <span class="ms-auto">
                  <span class="right-icon">
                    <i class="bi bi-chevron-down"></i>
                  </span>
                </span>
              </a>
              <div class="collapse" id="gallery">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="galleryhistory.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span>Gallery History</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="gallery">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="addgallery.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Add Gallery</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="gallery">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="deletegallery.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Delete Gallery</span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
                    <li>
              <a
                class="nav-link px-3 sidebar-link"
                data-bs-toggle="collapse"
                href="#blog"
              >
                <span class="me-2"><i class="bi bi-layout-split"></i></span>
                <span>Blog</span>
                <span class="ms-auto">
                  <span class="right-icon">
                    <i class="bi bi-chevron-down"></i>
                  </span>
                </span>
              </a>
              <div class="collapse" id="blog">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="addblog.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span>Add Blog</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="collapse" id="blog">
                <ul class="navbar-nav ps-3">
                  <li>
                    <a href="deleteblog.jsp" class="nav-link px-3">
                      <span class="me-2"
                        ><i class="bi bi-speedometer2"></i
                      ></span>
                      <span> Delete Blog</span>
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <!-- <li>
              <a href="#" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-book-fill"></i></span>
                <span>Blogs</span>
              </a>
            </li> --> 
            <li class="my-4"><hr class="dropdown-divider bg-light" /></li>
            <li>
              <div class=" small fw-bold text-uppercase px-3 mb-3">
                Addons
              </div>
            </li>
           <!--  <li>
              <a href="#" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-graph-up"></i></span>
                <span>Charts</span>
              </a>
            </li> -->
           <!-- <li>
              <a href="#" class="nav-link px-3">
                <span class="me-2"><i class="bi bi-table"></i></span>
                <span>Tables</span>
              </a>
            </li> -->
          </ul>
        </nav>
      </div>
    </div>
    <!-- offcanvas -->
    <main class="mt-5 pt-3">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <h4>Dashboard</h4>
          </div>
        </div>
         <div class="row">
         <div class="col-md-6">
        <div class="totalbookings">
       <h4>Total Bookings</h4>
      <div class="bookings">
      		<div class="outer">
      			<div class ="inner">
      				<div id="count">
      					<%
          java.sql.Connection connect=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		connect = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkbookingquery = "SELECT count(*) FROM booking";
      	
		try {
			Statement stmt  = connect.createStatement();
			ResultSet rs    = stmt.executeQuery(checkbookingquery);
			while (rs.next()) {
				
			%>
      					<span><%=rs.getString(1) %></span>
      					<%}
		}catch(Exception e){
		}
          %>
      				</div>
      			</div>
      		</div>
      
     <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="200px" height="200px">
			<defs>
				<linearGradient id="GradientColor">
					<stop offset="0%" stop-color="#e91e63" />
					<stop offset="100%" stop-color="#673ab7" />
				</linearGradient>
		</defs>
	<circle class="bookingcircle" cx="100" cy="100" r="90" stroke-linecap="round" />
	</svg>
      
      
      </div>
     </div>
   </div>
   <div class="col-md-6">
        <div class="totaluser">
       <h4 style="padding-left: 30px;">Total Users</h4>
      <div class="bookings">
      		<div class="outer">
      			<div class ="inner">
      				<div id="usercount">
      					<%
          java.sql.Connection conne=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		conne = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkuserquery = "SELECT count(*) FROM user";
      	
		try {
			Statement stmt  = conne.createStatement();
			ResultSet rs    = stmt.executeQuery(checkuserquery);
			while (rs.next()) {
				
			%>
      					<span><%=rs.getString(1) %></span>
      					<%}
		}catch(Exception e){
		}
          %>
      				</div>
      			</div>
      		</div>
      
     <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="200px" height="200px">
			<defs>
				<linearGradient id="GradientColor">
					<stop offset="0%" stop-color="#e91e63" />
					<stop offset="100%" stop-color="#673ab7" />
				</linearGradient>
		</defs>
	<circle class="usercircle" cx="100" cy="100" r="90" stroke-linecap="round" />
	</svg> 
      
      </div>
     </div>
   </div>
   
    </div>
       <div class="row">
         <div class="col-md-6">
        <div class="totalbookings">
       <h4>Total Package</h4>
      <div class="bookings">
      		<div class="outer">
      			<div class ="inner">
      				<div id="packagecount">
      					<%
          java.sql.Connection conn=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkpackagequery = "SELECT count(PID) FROM package";
      	
		try {
			Statement stmt  = conn.createStatement();
			ResultSet rs    = stmt.executeQuery(checkpackagequery);
			while (rs.next()) {
				
			%>
      					<span><%=rs.getString(1) %></span>
      					<%}
		}catch(Exception e){
		}
          %>
      				</div>
      			</div>
      		</div>
      
 <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="200px" height="200px">
			<defs>
				<linearGradient id="GradientColor">
					<stop offset="0%" stop-color="#e91e63" />
					<stop offset="100%" stop-color="#673ab7" />
				</linearGradient>
		</defs>
	<circle class="packagecircle" cx="100" cy="100" r="90" stroke-linecap="round" />
	</svg>
      
      
      </div>
     </div>
   </div>
   <div class="col-md-6">
        <div class="totaluser">
       <h4 style="padding-left: 35px;">Total Gallery</h4>
      <div class="bookings">
      		<div class="outer">
      			<div class ="inner">
      				<div id="gallerycount">
      				<%
          java.sql.Connection con=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkgalleryequery = "SELECT count(GID) FROM gallery";
      	
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checkgalleryequery);
			while (rs.next()) {
				
			%>
      					<span><%=rs.getString(1) %></span>
      					<%}
		}catch(Exception e){
		}
          %>
      				</div>
      			</div>
      		</div>
      
     <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="200px" height="200px">
			<defs>
				<linearGradient id="GradientColor">
					<stop offset="0%" stop-color="#e91e63" />
					<stop offset="100%" stop-color="#673ab7" />
				</linearGradient>
		</defs>
	<circle class="gallerycircle" cx="100" cy="100" r="90" stroke-linecap="round" />
	</svg> 
      
      
      </div>
     </div>
   </div>
   
    </div>
      </div>
    </main>
    <!-- <script >
    	let count =document.getElementById("count");
    	let usercount =document.getElementById("usercount");
    	let packagecount =document.getElementById("packagecount");
    	let gallerycount =document.getElementById("gallerycount");
    	let counter = 0;
    	setInterval(() => {
    		if(counter ==65){
    			clearInterval();
    		}else{
    			counter +=1;
        		count.innerHTML = counter + "%";
        		usercount.innerHTML = counter + "%";
        		packagecount.innerHTML = counter + "%";
        		gallerycount.innerHTML = counter + "%";
    		}
    		
    	}, 30)
    
    </script> -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
  </body>
</html>
