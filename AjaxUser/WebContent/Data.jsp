<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage ="error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/data.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
 
    <title>User Data</title>
</head>
<body>

		<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");// For HTTP 1.2
	
	response.setHeader("Pragma", "no-cache");//For HTTp 1.0
	response.setHeader("Expires", "0");//For proxies 
	
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("Login.jsp");
		}
	%>

    <!-- Optional JavaScript; choose one of the two! -->
    <div class="container con">
    
     <div class="d-flex justify-content-end">
         <form action="Logout" method="post">
         <button id="logout" type="submit" class="btn btn-primary">
         <i class="fas fa-sign-out-alt"></i> Logout</button>
		</form>
	</div>
<div id="error" class="text-danger font-weight-bold d-flex justify-content-center"></div>
        <div class="card">
          <div class="card-header text-center" style="color:white; background-color: black;">
            <h1 class="text-uppercase text-center">Your Data</h1>
          </div>

        </div>
   
    <table class="table table-dark">

      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Attributes</th>
          <th scope="col">Data</th>
        
        </tr>
      </thead>
      <tbody>
       
        <tr>
          <th scope="row">1</th>
          <td>Name</td>
          <td id="name"></td>
         
        </tr>
        <tr>
          <th scope="row">2</th>
          <td>Email</td>
          <td id="email"></td>
         
        </tr>
        <tr>
          <th scope="row">3</th>
          <td >address</td>
          <td id="address"></td>
        </tr>
        
         <tr>
          <th scope="row">4</th>
          <td >phone</td>
          <td id="phone"></td>
        </tr>
        

        

      </tbody>
    </table>
    <br>

<!-- Button to Open the Modal -->
<div class="d-flex justify-content-end">
<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal">
Edit Data
</button>
</div>
<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Edit Data</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<form action="Updatedata" method="post">
      		<input type="hidden" name="id" id="id" value="">
        <div class="form-group">
          <label>Your Name</label>
          <input type="text" class="form-control" id="name-model" name="name" value= "amit"  placeholder="Your Name" required>
        </div>
        <span id="nameerror" class="text-danger font-weight-bold"></span>
        <div class="form-group">
          <label >Email</label>
          <input type="email" class="form-control" id="email-model" name="email" value= "" placeholder="email" required>
        </div>
        <span id="emailerror" class="text-danger font-weight-bold"></span>
        <div class="form-group">
          <label >Phone</label>
          <input type="text" class="form-control" id="phone-model" name="phone" value="${listUser.phone}" placeholder="phone" required>
        </div>
        <span id="phoneerror" class="text-danger font-weight-bold"></span>
        <div class="form-group">
          <label >Address</label>
          <input type="text" class="form-control" id="address-model" name="address" value="${listUser.address}" placeholder="address" required>
        </div>  
		<span id="addresserror" class="text-danger font-weight-bold"></span>
         </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary" id="submit" data-dismiss="modal-wrong">Update</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
  

 
  </div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>    
    <script type="text/javascript">
    $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').trigger('focus');
    });
    

	$("document").ready(function(){
		
		console.log(localStorage.getItem("id"));

		$("#email").text(localStorage.getItem("email"));
		$("#name").text(localStorage.getItem("name"));
		$("#phone").text(localStorage.getItem("phone"));
		$("#address").text(localStorage.getItem("address"));
		
		
		$("#id").val(localStorage.getItem("id"));
		$("#name-model").val(localStorage.getItem("name"));
		$("#email-model").val(localStorage.getItem("email"));
		$("#phone-model").val(localStorage.getItem("phone"));
		$("#address-model").val(localStorage.getItem("address"));
		
		
		$("#submit").click(function (){
			
		var id = $('#id').val();
		var name = $('#name-model').val();
		var email = $('#email-model').val();
		var phone = $('#phone-model').val();
		var address = $('#address-model').val();
		
		var namecheck = /^[A-Za-z ]{3,30}$/;
		var addresscheck = /^[A-Za-z0-9. ]{3,50}$/;
		var emailcheck = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
		var phonecheck = /^[789][0-9]{9}$/;
		var check = 1;
		
		if(namecheck.test(name)){
	        $("#nameerror").html("");
	    }
	    else{
	        $("#nameerror").html ("Invaild Name");
	        check = 2;
	    }

	    if(addresscheck.test(address)){
	        $("#addresserror").html( "");
	    }
	    else{
	        $("#addresserror").html( "Invaild Address");
	        check = 2;
	    }
		

	    if(emailcheck.test(email)){
	        $("#emailerror").html ( "");
	    }
	    else{
	        $("#emailerror").html ( "Invaild Email");
	        check = 2;
	    }

	    if(phonecheck.test(phone)){
	        $("#phoneerror").html ( "");
	    }
	    else{
	        $("#phoneerror").html ("Invaild Phone");
	        check = 2;
	    }
	    
	    if(check ==2){
	    	$("#submit").attr("data-dismiss", "modal-wrong");
	    }
		
	    if(check ==1){
	 	   
			var jsondata={
					id:id,
					name:name,
					email:email,
					phone:phone,
					address:address	
				};
			
	    	swal({
	            title: "Are you sure?",
	            text: "Want to Update your Data",
	            icon: "warning",
	            buttons: true,
	            dangerMode: true,
	          })
	          .then((willUpdate) => {
	            
	            if (willUpdate) {
	              $("#submit").attr("data-dismiss", "modal");
	               $("#submit").click();
	              swal("Your data is successfully update", {
	                icon: "success",
	              });
	              
	            //ajax call  
	      		$.ajax({
	    			url:"/AjaxUser/UserUpdate",
	    			type:"POST",
	    			data: JSON.stringify(jsondata),
	    			success: function(result){
	    				console.log('request send'+JSON.stringify(result));
	    				
	    				if(result.name == undefined){
	    					$("#error").text(result.msg);
	    					console.log("email is taken");
	    				}else{
	    				$("#error").text("");
	    				$("#name").text(result.name);
	    				$("#email").text(result.email);
	    				$("#phone").text(result.phone);
	    				$("#address").text(result.address);
	    				
	    				$("#id").val(result.id);
	    				$("#name-model").val(result.name);
	    				$("#email-model").val(result.email);
	    				$("#phone-model").val(result.phone);
	    				$("#address-model").val(result.address);
	    				console.log("success");
	    				}

	    			},
	    			error: function(){
	    				console.log('error');
	    			}
	    		});
	              
	              
	              $("#submit").attr("data-dismiss", "model");
	            }
	          });

	    	

		

		
	    };//check end
	    
		});

	});
    </script>
  </body>
</html>