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
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>AS Travel</title>
	<link rel = "icon" href = "./assets/images/Aspirelogo.png" type = "image/x-icon">
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="./assets/css/style.css">

</head>
<body>
   
<!-- header section starts     -->

<section class="header">

   <a href="#" class="logo"> <i class="far fa-paper-plane"></i> AS Travel. </a>

   <nav class="navbar">
      <a href="#home">home</a>
      <a href="#about">about</a>
      <a href="#food">package</a>
      <a href="#gallery">gallery</a>
      <a href="#order">book</a>
      <a href="#blogs">blogs</a>
      <a href="#">Logout</a>
      <a href="#" class="logo"><i class="far fa-user"></i>profile</a>
   </nav>

   <div id="menu-btn" class="fas fa-bars"></div>

</section>

<!-- header section ends    -->

<!-- home section starts  -->

<section class="home" id="home">

   <div class="swiper home-slider">

      <div class="swiper-wrapper">

         <div class="swiper-slide slide" style="background: url(./assets/images/homeslide-1.jpg) no-repeat;">
            <div class="content">
               <span>Live with no excuses</span>
               <h3>Travel with no regrets</h3>
               <a href="#order" class="btn">Book Now</a>
            </div>
         </div>

         <div class="swiper-slide slide" style="background: url(./assets/images/homeslide-2.jpg) no-repeat;">
            <div class="content">
               <span>Life is journey</span>
               <h3>Not a destination</h3>
               <a href="#order" class="btn">Book now</a>
            </div>
         </div>

         <div class="swiper-slide slide" style="background: url(./assets/images/homeslide-3.jpg) no-repeat;">
            <div class="content">
               <span>The journey is a home</span>
               <h3>To travel is to live</h3>
               <a href="#order" class="btn">Book now</a>
            </div>
         </div>

      </div>

      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>

   </div>

</section>

<!-- home section ends -->

<!-- about section starts  -->

<section class="about" id="about">

   <div class="image">
      <img src="./assets/images/aboutimg.png" alt="">
   </div>

   <div class="content">
      <h3 class="title">About us</h3>
      <p>Travel is the main thing you purchase that makes you more extravagant. We, at , ASPIRE TOUR, swear by this and put stock in satisfying travel dreams that make you perpetually rich constantly.</p>
     <!--  <a href="#" class="btn">read more</a> -->
      <div class="icons-container">
         <div class="icons">
            <img src="./assets/images/abouticon-1.png" alt="">
            <h3>quality service</h3>
         </div>
         <div class="icons">
            <img src="./assets/images/abouticon-2.png" alt="">
            <h3>hospitality</h3>
         </div>
         <div class="icons">
            <img src="./assets/images/abouticon-3.png" alt="">
            <h3>quick response</h3>
         </div>
      </div>
   </div>

</section>

<!-- about section ends -->

<!-- food section starts  -->

<section class="food" id="food">

   <div class="heading">  
      <span>our popular</span>
      <h3>packages</h3>
   </div>

   <div class="swiper food-slider">

      <div class="swiper-wrapper">
      <%
          java.sql.Connection con=null;
      String Image;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkpackagequery = "SELECT * FROM package";
      	byte[] imgData;
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checkpackagequery);
			while (rs.next()) {
				Blob blob = rs.getBlob(5);
				imgData = blob.getBytes(1,(int)blob.length());
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
               
                 
                inputStream.close();
                outputStream.close();
                
                Image="data:image/jpg;base64,"+Base64.getEncoder().encodeToString(imageBytes);
			
			
			%>
         <div class="swiper-slide slide" data-name=<%=rs.getString(1) %>>
            <img src=<%=Image %> alt=""/>
            <h3><%=rs.getString(2) %></h3>
            
         </div>
         <%}
		}catch(Exception e){
		}
          %>
      </div>

      <div class="swiper-pagination"></div>
	  
   </div>

</section>

<!-- food section ends -->

<!-- food preview section starts  -->

<section class="food-preview-container">

   <div id="close-preview" class="fas fa-times"></div>
<%
          java.sql.Connection conn=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String packagequery = "SELECT * FROM package";
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(packagequery);
			while (rs.next()) {
				Blob blob = rs.getBlob(5);
				imgData = blob.getBytes(1,(int)blob.length());
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
               
                 
                inputStream.close();
                outputStream.close();
                
                Image="data:image/jpg;base64,"+Base64.getEncoder().encodeToString(imageBytes);
	                 
			%>
			
   <div class="food-preview" data-target=<%=rs.getString(1) %>>
      <img src="<%=Image %>" alt="">
      <h3><%=rs.getString(2) %></h3>
      <p><%=rs.getString(4) %></p>
      <div class="price">Rs.<%=rs.getString(3) %></div>
      <!-- <a href="#" class="btn">Book now</a> -->
   </div>
<%}
		}catch(Exception e){
		}
          %>
</section>

<!-- food preview section ends -->

<!-- gallery section starts  -->

<section class="gallery" id="gallery">

   <div class="heading">
      <span>our gallery</span>
      <h3>our untold stories</h3>
   </div>

   <div class="gallery-container">
		<%
          java.sql.Connection connec=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checkquery = "SELECT * FROM gallery";
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checkquery);
			while (rs.next()) {
				Blob blob = rs.getBlob(3);
				imgData = blob.getBytes(1,(int)blob.length());
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
               
                 
                inputStream.close();
                outputStream.close();
                
                Image="data:image/jpg;base64,"+Base64.getEncoder().encodeToString(imageBytes);
			
			
			
			%>
      <a href="<%=Image %>" class="box">
         <img src="<%=Image %>" alt="">
         <div class="icon"> <i class="fas fa-plus"></i> </div>
         
      </a>
      
      <%}
		}catch(Exception e){
		}
          %>

      

   </div>

</section>

<!-- gallery section ends -->

<!-- menu section starts  -->
<!-- 
<section class="menu" id="menu">

   <div class="heading">
      <span>our menu</span>
      <h3>our popular dishes</h3>
   </div>

   <div class="swiper menu-slider">

      <div class="swiper-wrapper">

         <div class="swiper-slide slide">
            <h3 class="title">breakfast</h3>
            <div class="box-container">
               <div class="box">
                  <div class="info">
                     <h3>morning breakfast</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>morning breakfast</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>morning breakfast</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>morning breakfast</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>morning breakfast</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>morning breakfast</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
            </div>
         </div>

         <div class="swiper-slide slide">
            <h3 class="title">lunch</h3>
            <div class="box-container">
               <div class="box">
                  <div class="info">
                     <h3>delicious lunch</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious lunch</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious lunch</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious lunch</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
            </div>
         </div>

         <div class="swiper-slide slide">
            <h3 class="title">dinner</h3>
            <div class="box-container">
               <div class="box">
                  <div class="info">
                     <h3>delicious dinner</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious dinner</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious dinner</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious dinner</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>delicious dinner</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
            </div>
         </div>

         <div class="swiper-slide slide">
            <h3 class="title">drinks</h3>
            <div class="box-container">
               <div class="box">
                  <div class="info">
                     <h3>cold drinks</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>cold drinks</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>cold drinks</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>cold drinks</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>cold drinks</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>cold drinks</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
            </div>
         </div>

         <div class="swiper-slide slide">
            <h3 class="title">dessert</h3>
            <div class="box-container">
               <div class="box">
                  <div class="info">
                     <h3>sweet dessets</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>sweet dessets</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>sweet dessets</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
               <div class="box">
                  <div class="info">
                     <h3>sweet dessets</h3>
                     <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ex, dolores.</p>
                  </div>
                  <div class="price">$49.99</div>
               </div>
            </div>
         </div>

      </div>

      <div class="swiper-pagination"></div>

   </div>

</section> -->

<!-- menu section ends -->

<!-- order section starts  -->

<section class="order" id="order">

   <div class="heading">
      <span>Book now</span>
      <h3>Your Favourite Place</h3>
   </div>

   <form action="booking.jsp" method="post" onsubmit="return bookingValidate()">
      <div class="box-container">
         <div class="box">
            <div class="inputBox">
               <span>full name</span>
               <input type="text" name="bookingusername" id="bookingname" placeholder="enter your name">
               <span id="name_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
            </div>
            <div class="inputBox">
               <span>place</span>
               <input type="text" name="bookingplace" placeholder="place you want" list="placelist">
               <datalist id="placelist">
               <%
          java.sql.Connection connect=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "aspire@123");
      	}catch(Exception e) {
      	}
      	String checklistquery = "SELECT packagename FROM Package";
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checklistquery);
			while (rs.next()) {
			
			%>
               		<option value="<%=rs.getString(1) %>">
               		
            <%}
		}catch(Exception e){
		}
          %>
           
               </datalist>
               
            </div>
            <div class="inputBox">
               <span>Departure</span>
               <input type="date" name="departuredate">
            </div>
            <div class="inputBox">
               <span>your address</span>
               <textarea name="bookingaddress" placeholder="enter your address" id="bookingaddress" cols="30" rows="10"></textarea>
               <span id="address_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
            </div>
         </div>
         <div class="box">
            <div class="inputBox">
               <span>number</span>
               <input type="number" name="bookingmobile" id="bookingmobile" placeholder="enter your number">
               <span id="mobile_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
            </div>
            <div class="inputBox">
               <span>Number Passengers</span>
               <input type="number" name="passengescount" id="bookingpassengercount" placeholder="enter the number of passenger">
               <span id="passenger_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
            </div>
            <div class="inputBox">
               <span>Arrival</span>
               <input type="date" name="arrivaldate">
            </div>
            <div class="inputBox">
               <span>our address</span>
               <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3890.2099145486186!2d80.22114151408857!3d12.829707821448935!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a525a5d7d9090d7%3A0xf1593c682fbb41a6!2sASPIRE%20SYSTEMS%2C%20SIPCOT%20IT%20PARK-1%2C%201%2FD-1%2C%20SIPCOT%20IT%20PARK%2C%20Siruseri%2C%20Siruseri%2C%20Tamil%20Nadu%20603103!5e0!3m2!1sen!2sin!4v1645014391298!5m2!1sen!2sin" allowfullscreen="" loading="lazy"></iframe>
            </div>
         </div>
      </div>
      <input type="submit" value="Book now" class="btn">
   </form>
   
</section>

<!-- order section ends -->

<!-- blogs section starts  -->

<section class="blogs" id="blogs">

   <div class="heading">
      <span>our blogs</span>
      <h3>our latest posts</h3>
   </div>

   <div class="swiper blogs-slider">

      <div class="swiper-wrapper">
		<%
          java.sql.Connection conne=null;
      	try {
          	Class.forName("com.mysql.jdbc.Driver");
      		con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/astravel", "root", "Ratshna@2329");
      	}catch(Exception e) {
      	}
      	String checkblogquery = "SELECT * FROM blog";
		try {
			Statement stmt  = con.createStatement();
			ResultSet rs    = stmt.executeQuery(checkblogquery);
			while (rs.next()) {
				Blob blob = rs.getBlob(3);
				imgData = blob.getBytes(1,(int)blob.length());
                
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
               
                 
                inputStream.close();
                outputStream.close();
                
                Image="data:image/jpg;base64,"+Base64.getEncoder().encodeToString(imageBytes);
			
			
			
			
			%>
         <div class="swiper-slide slide">
            <div class="image">
               <img src="<%=Image %>" alt="">
               
            </div>
            <div class="content">
               <div class="icon">
                  <a href="#"> <i class="fas fa-calendar"></i> 21st may, 2022 </a>
                  <a href="#"> <i class="fas fa-user"></i> by admin </a>
               </div>
               <a href="#" class="title"><%=rs.getString(1) %></a>
               <p><%=rs.getString(2) %></p>
               <!-- <a href="#" class="btn">read more</a> -->
            </div>
         </div>

        <%}
		}catch(Exception e){
		}
          %>
        


        

         

         

      </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

<!-- blogs section ends -->

<!-- footer section starts  -->

<section class="footer">

   <div class="icons-container">

      <div class="icons">
         <i class="fas fa-clock"></i>
         <h3>Booking Hours</h3>
         <p>09:00am to 10:00pm</p>
      </div>

      <div class="icons">
         <i class="fas fa-phone"></i>
         <h3>phone</h3>
         <p>+91 6382441587</p>
         <p>+91 9486593623</p>
      </div>

      <div class="icons">
         <i class="fas fa-envelope"></i>
         <h3>email</h3>
         <p>soudh2000@gmail.com</p>
         <p>abdulalsowdh@gmail.com</p>
      </div>

      <div class="icons">
         <i class="fas fa-map"></i>
         <h3>address</h3>
         <p>chennai, india - 607106</p>
      </div>

   </div>

   <div class="share">
      <a href="#" class="fab fa-facebook-f"></a>
      <a href="#" class="fab fa-twitter"></a>
      <a href="#" class="fab fa-instagram"></a>
      <a href="#" class="fab fa-linkedin"></a>
   </div>

   <div class="credit"> created by <span>Mr Vampire Salvatore</span> | all rights reserved! </div>

</section>

<!-- footer section ends  -->










<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>

<!-- custom js file link  -->
<script src="./assets/js/script.js"></script>

<script>
   lightGallery(document.querySelector('.gallery .gallery-container'));
   function bookingValidate(){
	   var name=document.getElementById("bookingname").value;
	   var mobile=document.getElementById("bookingmobile").value;
	   var passenger=document.getElementById("bookingpassengercount").value;
	   var address=document.getElementById("bookingaddress").value;
	   var isSuccessName=validatename(name,"name_error");
		var isSuccessMobile=validatephoneno(mobile,"mobile_error");
		var isSuccessPassenger=validatepassenger(passenger,"passenger_error");
		var isSuccessAddress=validateAddress(address,"address_error");
		if(isSuccessPassenger && isSuccessAddress && isSuccessName && isSuccessMobile ){
	        return true;
	    }
		else{
			return false;
		}
	}
   function validatename(name, id){

	    if(name.length<4){
	    // name check
	        if(name.length<1){
	          document.getElementById(id).style.display="block";
	          document.getElementById(id).innerHTML = "*Name is mandatory field";
	        }else{
	        	document.getElementById(id).style.display="block";
	            document.getElementById(id).innerHTML = "*Name must be above 3 Character.";
	        }
	        return false;
	        
	    }else{
	        if(name.match("^[a-zA-Z]{2,}\\s?([a-zA-Z]{2,})?")){
	            document.getElementById(id).innerHTML = "";
	            return true;
	        }else{
	        	document.getElementById(id).style.display="block";
	            document.getElementById(id).innerHTML = "*Name must contain only Alphabets.";
	            return false;
	        }
	        
	    }
	}
   function validatephoneno(number,id){
	    var firstDigit=number.charAt(0);
	    if(number.match("^\\d{10}$") && firstDigit>5) {
	        document.getElementById(id).innerHTML = "";
	        return true;
	    }
	    else {
	    	 document.getElementById(id).style.display="block";
	      	 document.getElementById(id).innerHTML = "*Mobile Number is mandatory field";
	      if(!number.length<1){
	          if(firstDigit<=5 && number.length==10) {
	        	 	 document.getElementById(id).style.display="block";
	              	 document.getElementById(id).innerHTML = "*Mobile Number is InValid. First number must be above 5.";
	              }else {
	            	  document.getElementById(id).style.display="block";
	              	  document.getElementById(id).innerHTML = "*Mobile Number must be 10 digit number";
	              }
	      }
	      return false;
	    }
	}
   function validatepassenger(number,id){
	    var firstDigit=number.charAt(0);
	    if(number.match("^\\d{1}$") && firstDigit>0) {
	        document.getElementById(id).innerHTML = "";
	        return true;
	    }
	    else {
	    	 document.getElementById(id).style.display="block";
	      	 document.getElementById(id).innerHTML = "*Passenger count is mandatory field";
	      if(!number.length<1){
	          if(firstDigit<=0 && number.length==1) {
	        	 	 document.getElementById(id).style.display="block";
	              	 document.getElementById(id).innerHTML = "*Passenger count is InValid. passenger number must be above 0.";
	              }else {
	            	  document.getElementById(id).style.display="block";
	              	  document.getElementById(id).innerHTML = "*Passenger count must be 1 digit number";
	              }
	      }
	      return false;
	    }
	}
   function validateAddress(name, id){

	    if(name.length<4){
	    // name check
	        if(name.length<1){
	          document.getElementById(id).style.display="block";
	          document.getElementById(id).innerHTML = "*Address is mandatory field";
	        }
	        return false;
	        
	    }else{
	        if(name.match("^[a-zA-Z0-9\s,'-]*$")){
	            document.getElementById(id).innerHTML = "";
	            return true;
	        }
	        
	    }
	}
</script>

</body>
</html>