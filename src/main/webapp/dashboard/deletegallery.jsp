<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%@ page import="java.sql.*" %>
    <%@ page import="jakarta.servlet.*" %>
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
  </head>
  <body>
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
              <a href="dashboard.jsp" class="nav-link px-3 ">
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
                    <a href="deletegallery.jsp" class="nav-link px-3 active">
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
          <!--  <li>
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
            <h4>Delete Gallery </h4>
          </div>
        </div>
   
        <div class="row">
          <div class="col-md-12 mb-3">
           <form action="./Deletegallery" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label for="inputFirstname">GID</label>
                        <input type="text" class="form-control" id="" name="deletegid" placeholder="Gallery Id" required="" oninvalid="this.setCustomValidity('Gallery ID is mandatory filed ')"oninput="setCustomValidity('')">
                    </div>
                    <div class="col-sm-6">
                        <label for="inputLastname">Gallery name</label>
                        <input type="text" class="form-control" id="" name="galleryname" placeholder="Gallery name" required="" oninvalid="this.setCustomValidity('Gallery Name is mandatory filed ')"oninput="setCustomValidity('')">
                    </div>
                </div>
                
                
                <button type="submit" class="btn btn-primary px-4 my-3 float-right">Delete</button>
            </form>
            <div class="card">
              <div class="card-header">
                <span><i class="bi bi-table me-2"></i></span> Gallery Table
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table
                    id="example"
                    class="table table-striped data-table"
                    style="width: 100%"
                  >
                    <thead>
                      <tr>
                        <th>GID</th>
                        <th>Gallery Name</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                               <%
          java.sql.Connection con=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkuserquery = "SELECT * from gallery;";
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checkuserquery);
			while (rs.next()) {%>
			
  							<tr>
 								<td><%=rs.getString(1) %></td>
    							<td><%=rs.getString(2) %></td>
    							
    							
  							</tr>
        
        <%}
		}catch(Exception e){
		}
          %>
            
         
                    </tbody>

                  </table>
                </div>
                 
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
  </body>
</html>
