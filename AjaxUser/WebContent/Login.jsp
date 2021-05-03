<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage ="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

	<h1>${message}</h1>

 <div class="container">
        <div class="myCard">
            <div class="row">
                <div class="col-md-9">
                    <div class="myLeftCtn"> 
                        <form class="myForm text-center" >
                            <header>Customer Login</header>

                            <div class="form-group">
                                <i class="fas fa-envelope"></i>
                                <input class="myInput" type="email" placeholder="Email"  id="email" name="email" required> 
                            	
                            </div>
							<span id="emailerror" class="text-danger font-weight-bold"></span>
                           
                            <div class="form-group pass">
                                <i class="fas fa-lock"></i>
                                <input class="myInput" type="password" id="password" placeholder="Password" name="password" required> 
                           		 <i class = "far fa-eye"id="togglePassword"></i>
                           		
                            </div>
						    <span id="passworderror" class="text-danger font-weight-bold"></span>
							<br>
                            <input type="button" id="submit" class="butt" value="LOGIN">
                            <br>
                            <br>
                            
                            <a href="Signup.jsp">Don't have account? Sign up </a>
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
		var email = $('#email').val();
		var password = $('#password').val();
		var passwordcheck = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
		
		var emailcheck = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		var check = 1;
		console.log($('#email').val());
	    if(passwordcheck.test(password)){
	        $("#passworderror").html("");
	    }
	    else if(password ==null || password ==""){
	        $("#passworderror").html ( "Field Required");
	        check = 2;
	    }else{
	    	$("#passworderror").html ( "Invaild Password");
	        check = 2;
	    }

	    if(emailcheck.test(email)){
	        $("#emailerror").html ("");
	    }
	    else if(email == null || email== ""){
	        $("#emailerror").html ( "Field Required");
	        check = 2;
	    }else{
	    	  $("#emailerror").html ( "Invaild Email");
		        check = 2;
	    }
		
		if(check==1){
		
		var jsondata={
			email:email,
			password:password
		};
		console.log(jsondata);
		$.ajax({
			url:"/AjaxUser/UserValidity",
			type:"POST",
			//contenttype:'application/json',
			//dataType: 'json',
			data: JSON.stringify(jsondata),
			success: function(result){
				console.log('request send'+JSON.stringify(result));
				localStorage.setItem("id",result.id);
				localStorage.setItem("name",result.name);
				localStorage.setItem("email",result.email);
		    	localStorage.setItem("phone",result.phone);
				localStorage.setItem("address",result.address);
			
				console.log(result.msg);
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
		
		}else{
			console.log("not in ajax error");
		}
		
	});
	
	
});


</script>


</body>
</html>