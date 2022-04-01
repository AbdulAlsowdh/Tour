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
   <title>Booking Confirmation</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link rel = "icon" href = "./assets/images/Aspirelogo.png" type = "image/x-icon">
   <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="./assets/css/style.css">

</head>
<body>
   <%
   String uname=request.getParameter("bookingusername")  ;
   String place=request.getParameter("bookingplace")  ;
   String departure=request.getParameter("departuredate")  ;
   String address=request.getParameter("bookingaddress")  ;
   String number=request.getParameter("bookingmobile")  ;
   String passenger=request.getParameter("passengescount")  ;
   String arrival=request.getParameter("arrivaldate")  ;
   
   
   %>


<!-- order section starts  -->

<section class="order" id="order">

   <div class="heading">
      <h3>Booking Confirmation</h3>
   </div>

   <form action="Booknow" method="post">
      <div class="box-container">
         <div class="box">
            <div class="inputBox">
               <span>full name</span>
               <input type="text" name="bookingusername" value="<%=uname %>"  >
          
            </div>
            <div class="inputBox">
               <span>place</span>
               <input type="text" name="bookingplace" value="<%=place %>" >
            </div>
            <div class="inputBox">
               <span>Departure</span>
               <input type="date" name="departuredate" value="<%=departure %>">
            </div>
            <div class="inputBox">
               <span>your address</span>
               <input type="text" name="bookingaddress" value="<%=address %>" >
            </div>
         </div>
         <div class="box">
            <div class="inputBox">
               <span>number</span>
               <input type="number" name="bookingmobile" value="<%=number %>">
            </div>
            <div class="inputBox">
               <span>Number Passengers</span>
               <input type="number" name="passsengercount" value="<%=passenger %>">
            </div>
            <div class="inputBox">
               <span>Arrival</span>
               <input type="date" name="arrivaldate" value="<%=arrival %>">
            </div>
            
         </div>
      </div>
      <input type="submit" value="payment" class="btn">
   </form>
   
</section>

<!-- order section ends -->


        

         

         

      </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

<!-- blogs section ends -->













<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>

<!-- custom js file link  -->
<script src="./assets/js/script.js"></script>

<script>
   lightGallery(document.querySelector('.gallery .gallery-container'));
</script>

</body>
</html>