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
    <title>Login</title>
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>

  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="https://wallpapershome.com/images/pages/pic_h/23878.jpg" alt="">
        <div class="text">
          <span class="text-1"><br> </span>
          <span class="text-2"></span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="https://wallpapershome.com/images/pages/pic_h/16346.jpg" alt="">
        <div class="text">
          <span class="text-1"><br>  </span>
          <span class="text-2"></span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Login</div>
          <form class="login_form" action="LoginUser" method="post" onsubmit="return Loginvalidate()">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter your email" id="loginEmail" name="loginEmail" >
              </div>
              <span id="mail_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Enter your password" id="loginpassword" name="loginpassword">
              </div>
             <span id="password_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="text"><a href="#" style="color:8d566f">Forgot password?</a></div>
              <span style="color:red;font-size: 12px;font-weight: 600;">${loginerrormessage}</span>
              <span style="color:red;font-size: 12px;font-weight: 600;">${registererrormessage}</span><br>
              <span style="color:red;font-size: 12px;font-weight: 600;">${errormessage}</span>
              <div class="button input-box">
                <input type="submit" value="Login">
              </div>
              <div class="text sign-up-text">Don't have an account? <label for="flip">Signup now</label></div>
             <div class="text"style="margin-left: 79px;">Admin Account?Click here</div>
             <div class="text"><a href="Adminlogin.jsp" style="margin-left: 126px;">Admin Login</a></div>
            </div>
        </form>
      </div>
        <div class="signup-form">
          <div class="title">Signup</div>
         
        <form class="signup_form" action="RegisterUser" method="post" onsubmit="return Registervalidate()">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter your name" id="registername" name="registername">
              </div>
              <span id="name_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="input-box">
                <i class="fas fa-mobile-alt"></i>
                <input type="Number" placeholder="Enter your Mobile Number" id="registermobile" name="registermobile">
              </div>
              <span id="mobile_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter your email" id="registeremail" name="registeremail">
              </div>
              <span id="registermail_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Enter your password" id="registerpassword" name="registerpassword">
              </div>
              <span id="registerpassword_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Confirm your password" id="confirmregisterpassword">
              </div>
              <span id="registerconfirmpassword_error" style="display: none;color: red;font-size: 12px;font-weight: 600;" ></span>
              
              <div class="button input-box">
                <input type="submit" value="Signup">
              </div>
              <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
            </div>
            
      </form>
    </div>
    </div>
    </div>
  </div>
<script >
function Loginvalidate(){
    var mail=document.getElementById("loginEmail").value;
    var password=document.getElementById("loginpassword").value;
    var isSuccessEmail=validatemail(mail, "mail_error");
    var isSuccessPassword=validatePassword(password, "password_error");
    if(isSuccessEmail && isSuccessPassword){
    	
        return true;
    }
	else{
		return false;
	}
}
function Registervalidate(){
	var name=document.getElementById("registername").value;
	var mobile=document.getElementById("registermobile").value;
	var mail=document.getElementById("registeremail").value;
	var password=document.getElementById("registerpassword").value;
	var confirmpassword=document.getElementById("confirmregisterpassword").value;
	/* function calling */
	var isSuccessName=validatename(name,"name_error");
	var isSuccessMobile=validatephoneno(mobile,"mobile_error");
	var isSuccessEmail=validatemail(mail, "registermail_error");
	var isSuccessPassword=validatePassword(password, "registerpassword_error");
	var isSuccessConfirmpassword=isEqual(password,confirmpassword,"registerconfirmpassword_error");
	if(isSuccessEmail && isSuccessPassword && isSuccessName && isSuccessMobile && isSuccessConfirmpassword){
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
function isEqual(password,confirmpassword, id){
    if(password==confirmpassword){
        return true;
    }else{
    	document.getElementById(id).style.display="block";
        document.getElementById(id).innerHTML ="*Mismatch Password";
        return false;
    }
}

</script>
</body>
</html>
    