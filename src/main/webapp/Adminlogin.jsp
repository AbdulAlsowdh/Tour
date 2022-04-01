<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/c/CodingLabYT-->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->
    <link rel="stylesheet" href="./assets/css/login.css">
    <link rel = "icon" href = "./assets/images/Aspirelogo.png" type = "image/x-icon">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="https://wallpapershome.com/images/pages/ico_h/23848.jpg" alt="">
        <div class="text">
          <span class="text-1">Use your Admin <br> Email Id and Password</span>
          <span class="text-2">Let's get connected</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Admin Login</div>
          <form class="login_form" action="AdminLogin" method="post" onsubmit="return AdminLoginvalidate()">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter your email" id="AdminloginEmail" name="AdminloginEmail">
              </div>
              <span id="mail_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Enter your password" id="Adminloginpassword" name="Adminloginpassword">
              </div>
             <span id="password_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="text"><a href="#" style="color:8d566f">Forgot password?</a></div>
              <span style="color:red;font-size: 12px;font-weight: 600;">${registererrormessage}</span>
              <div class="button input-box">
                <input type="submit" value="Login">
              </div>
            </div>
        </form>
      </div>
    </div>
    </div>
  </div>
<script >
function AdminLoginvalidate(){
    var mail=document.getElementById("AdminloginEmail").value;
    var password=document.getElementById("Adminloginpassword").value;
    var isSuccessEmail=validatemail(mail, "mail_error");
    var isSuccessPassword=validatePassword(password, "password_error");
    if(isSuccessEmail && isSuccessPassword){
        return true;
    }
	else{
		return false;
	}
}

function validatemail(mail, id){
    
    if(mail.length<1){
    	document.getElementById(id).style.display="block";
        document.getElementById(id).innerHTML = "*E-mail is mandatory field";
        return false;
    }else{
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail)){
            document.getElementById(id).innerHTML = "";
            return true;
        }else{
        	document.getElementById(id).style.display="block";
            document.getElementById(id).innerHTML = "*E-mail is InValid Format (abc19@xyzgmail.com)";
            return false;
        }
    }   
}
function validatePassword(password, id){
    if(password.match(/^(?=.*\d)(?=.*[@#$%^&*])(?=.*[a-zA-Z])[a-zA-Z0-9@#$%^&*]{8,}$/)){   
        document.getElementById(id).innerHTML="";
        return true;
    }else{
        if(password.length<1){
        	document.getElementById(id).style.display="block";
            document.getElementById(id).innerHTML = "*Password is mandatory field";
        }else{
        	document.getElementById(id).style.display="block";
            document.getElementById(id).innerHTML = "*Length of the password is atleast 8.*one Upper Case *one Special character *one digit";
        }
        return false;
    }
}




</script>
</body>
</html>
    