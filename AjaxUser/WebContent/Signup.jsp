<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage ="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Login Form Design</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

 <div class="container">
        <div class="myCard">
            <div class="row">
                <div class="col-md-9">
                    <div class="myLeftCtn"> 
                        <form class="myForm text-center">
                            <header>Create new account</header>
                            <div class="form-group">
                                <i class="fas fa-user"></i>
                                <input class="myInput" type="text" placeholder="Yourname" id="name" name="name" pattern="[A-Za-z0-9 ]" required> 
                            	
                            </div>
                            <span id="nameerror" class="text-danger font-weight-bold"></span>

                            <div class="form-group">
                                <i class="fas fa-envelope"></i>
                                <input class="myInput" type="email" placeholder="Email"  id="email" name="email" required> 
                            	
                            </div>
                            <span id="emailerror" class="text-danger font-weight-bold"></span>

                            <div class="form-group">
                                <i class="fas fa-phone"></i>
                                <input class="myInput" type="text" id="phone" placeholder="phone" name="phone" pattern="[7-9]{1}[0-9]{9}" required> 
                            	
                            </div>
                            <span id="phoneerror" class="text-danger font-weight-bold"></span>

                            <div class="form-group">
                                <i class="fas fa-map-marker-alt"></i>
                                <input class="myInput" type="text" id="address" placeholder="Your Address" name="address"  required> 
                            	
                            </div>
                            <span id="addresserror" class="text-danger font-weight-bold"></span>

                            <div class="form-group pass">
                                <i class="fas fa-lock"></i>
                                <input class="myInput" type="password" id="password" placeholder="Password" name="password"  required> 
                            	 <i class = "far fa-eye"id="togglePassword"></i>
                                <!-- far fa-eye -->
                                
                            </div>
                            <span id="passworderror" class="text-danger font-weight-bold"></span>
							<br>

                            <input type="button" id="submit"  class="butt" value="CREATE ACCOUNT">
                            
                            <br>
                            <br>
                            
                            <a href="Login.jsp">Already have Account?</a>
                       </form> 
                        
                        
                    </div>
                </div> 
                <div class="col-md-3">
                    <div class="myRightCtn">
                            <div class="box"><header>Data Storing</header>
                            
                           <p style="color:white">You can save your data to get anywhere and anytime .</p>
                            	<form action="Aboutus.jsp" method="post">
                                <input type="submit" class="butt_out" value="Learn More"/>
                                </form>
                            </div>
                                
                    </div>
                </div>
            </div>
        </div>
</div>
      
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script type="text/javascript">


$(document).ready(function(){
	

	const togglePassword = document.querySelector('#togglePassword');
	const password = document.querySelector('#password');
	 
	togglePassword.addEventListener('click', function (e) {
	    // toggle the type attribute
	    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
	    password.setAttribute('type', type);
	    // toggle the eye slash icon
	    this.classList.toggle('fa-eye-slash');
	});
	
	<!-- ENTER SUMBIT ON ENTER-->
	$("#password").keyup(function(event) {
	    if (event.keyCode === 13) {
	        $("#submit").click();
	    }
	});
	
	
	$("#submit").click(function (){
		
		var name = $('#name').val();
		var email = $('#email').val();
		var phone = $('#phone').val();
		var address = $('#address').val();
		var password = $('#password').val();
		
		 var namecheck = /^[A-Za-z ]{3,30}$/;
		 var addresscheck = /^[A-Za-z0-9. ]{3,50}$/;
		 var passwordcheck = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
		 var emailcheck = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		 var phonecheck = /^[789][0-9]{9}$/;
		 var check = 1;
		 
		 <!-- Name checked-->
		 if(namecheck.test(name)){
		        $("#nameerror").html("");
		    }
		    else if(name == null || name ==""){
		        $("#nameerror").html ("Field Required");
		        check = 2;
		    }else{
		    	  $("#nameerror").html ("Invaild Name");
			        check = 2;
		    }
		 <!-- Address checked-->
		    if(addresscheck.test(address)){
		        $("#addresserror").html("");
		    }
		    else if(address == null || address == ""){
		        $("#addresserror").html( "Field Required");
		        check = 2;
		    }else{
		        $("#addresserror").html("Invaild Address");
		        check = 2;
		    }

		    if(passwordcheck.test(password)){
		        $("#passworderror").html( "");
		    }
		    else if (password ==null ||password ==""){
		        $("#passworderror").html ( "Field Required");
		        check = 2;
		    }else{
		    	 $("#passworderror").html ( "Invaild Password");
			        check = 2;
		    }

		    if(emailcheck.test(email)){
		        $("#emailerror").html ( "");
		    }
		    else if(email ==null || email ==""){
		        $("#emailerror").html ( "Field Required");
		        check = 2;
		    }else{
		    	$("#emailerror").html ( "Invaild Email");
		        check = 2;
		    }

		    if(phonecheck.test(phone)){
		        $("#phoneerror").html ("");
		    }
		    else if(phone =="" ||phone ==null){
		        $("#phoneerror").html ("Field Required");
		        check = 2;
		    }else{
		    	   $("#phoneerror").html ("Invaild Phone");
			        check = 2;
		    }

		 
		 
		 
		 if(check==1){
			

		
		var jsondata={
			name:name,
			email:email,
			phone:phone,
			address:address,
			password:password
		};

		$.ajax({
			url:"/AjaxUser/UserServlet",
			type:"POST",
//			contenttype:'application/json',
//			dataType: 'json',

			data: JSON.stringify(jsondata),
			success: function(result){
				console.log('request send'+JSON.stringify(result));
				localStorage.setItem("id",result.id);
				localStorage.setItem("name",result.name);
				localStorage.setItem("email",result.email);
		    	localStorage.setItem("phone",result.phone);
				localStorage.setItem("address",result.address);
				
				if(result.page == undefined){
					$("#passworderror").html(result.msg);
					}
					else{
						location.href=result.page;
					}

			},
			error: function(){
				console.log('error');
			}
			
		});
		
		
		};
		
	});
	
	
	
	
	
});



</script>



</body>
</html>