<%-- 
    Document   : register
    Created on : Dec 1, 2018, 12:28:52 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Account </title>

	<!--/tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="Relief Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript">
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--//tags -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/prettyPhoto.css" rel="stylesheet" type="text/css" />
	<link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
	<link href="css/fontawesome-all.css" rel="stylesheet">
	<!-- //for bootstrap working -->
	<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Poppins:200,200i,300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">

        
         <style>
             .navbar-nav>li>a {
        padding: 20px 10px;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-size: 0.8em;
        font-weight: 600;
        
        }
        </style>
        <script type="text/javascript">
            function checkmob(){
                var mobile = document.getElementById("Mob").value;
        var pattern = /^\d{10}$/;
        if (pattern.test(mobile)) {
            //alert("Your mobile number : " + mobile);
            return true;
        }else{
        alert("Please enter valid mobile number");
        return false;
    }
            
            }
        </script>
    </head>
    <body>
       
        <div class="top_header" id="home">
		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="nav_top_fx_w3layouts_agileits">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					    aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="logo_wthree_agile">
						<h1>
							<a class="navbar-brand" href="index5.html">
								<i class="fas fa-heart" aria-hidden="true"></i> Safalam
								<span class="desc">Let's Heal the World.</span>
							</a>
						</h1>
					</div>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<div class="nav_right_top">
						<ul class="nav navbar-nav">
							<li >
								<a href="index5.html">Home</a>
							</li>
							<li>
								<a class="scroll" href="#about">About</a>
							</li>
							<li>
								<a class="scroll" href="#gallery">Gallery</a>
							</li>
                                                        <li>
								<a class="scroll" href="viewupdateindex.jsp">Updates</a>
							</li>
                                                        <li>
								<a class="scroll" href="post.jsp">Post Your Requirements</a>
							</li>
                                                        <li>
								<a class="scroll" href="Enumbers.html">Emergency Numbers</a>
							</li>
							
							<li>
								<a class="active" href="login.jsp">Sign In</a>
							</li>
                                                        <li class="active" >
								<a class="scroll" href="register.jsp">Register</a>
							</li>
                                                        <li>
								<a class="scroll" href="#contact">Contact</a>
							</li>
							

						</ul>
					</div>
				</div>
				
			</div>
		</nav>
		<div class="clearfix"></div>
	</div>
        
        <div class="banner_bottom donate-log">
		<div class="donate-inner">			
                    <div class="col-md-8 donate-info"><br><br><br>
                        <center><h4>Create an Account</h4></center>
                        Kindly register to donate.<br><br>
        <form  action="registerservlet" method="post">
            <div  >
        <table border="0">
            
            <tbody>
                <tr>
                    <td><label >Name</label></td>
                    <td><input type="text" name="name" value="" required/></td>
                </tr>
                      <tr>
            <td><label >Dob</label></td>
            <td>
                <input type="date" name="dob" min="1940-10-20" max="2001-10-20" required/></td>
                </tr>
                    <tr>
            <td><label >Gender</label></td>
            <td><input type="radio" name="gender" value="m" required/>Male<input type="radio" name="gender" value="f" />Female<input type="radio" name="gender" value="o" />others</td>
                </tr>
          
                <tr>
                    <td><label >Address</label></td>
                    <td><textarea name="address" rows="4" cols="20" required>
                        </textarea></td>
                </tr>
                  <tr>
            <td><label >City</label></td>
            <td><input type="text" name="City" required/></td>
                </tr>
                  <tr>
            <td><label >State</label></td>
            <td><input type="text" name="State" required/></td>
                </tr>
             <td><label >Mob</label></td>
             <td><input type="text" name="Mob" id="Mob" onblur="return checkmob()" required  /></td>
                </tr>
                    <tr>
            <td><label >Email</label></td>
            <td><input type="email" name="Email" value="" required/></td>
                </tr>
                <tr>
            <td><label >Password</label></td>
            <td><input type="password" name="pass" value="" required/></td>
                </tr>
                <tr><td></td><td><input type="submit"  value="Create Account" /></td></tr>
           
            </tbody>
        </table></form>
            </div>
            
            </div>
			<div class="clearfix"></div>
		</div>
	</div>
        
       <p class="copy-right"><font style=" color: black">2019 © Safalam. All rights reserved.</font>
			</p> 
                        
       
    </body>
</html>
