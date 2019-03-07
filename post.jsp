<%-- 
    Document   : post
    Created on : Feb 2, 2019, 1:31:35 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
    
    </head>
    
    
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
								<span class="desc">Let's Heal the World .</span>
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
								<a class="scroll" href="register.jsp">Updates</a>
							</li>
                                                        <li class="active">
								<a class="scroll" href="post.jsp">Post Your Requirements</a>
							</li>
                                                        <li>
								<a class="scroll" href="Enumbers.html">Emergency numbers</a>
							</li>
							
							<li>
                                                            <a class="scroll" href="login.jsp">Sign In</a>                                                                
                                                                
							</li>
                                                         <li>
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
    <br><br><br><br>
    <div class="banner_bottom donate-log">
		<div class="donate-inner">
                     <center><h4>Post UR Needs</h4></center>
                     <form action="postservlet" method="post">
        <table border="0">
            
            <tbody>
                <tr>
                    <td><label >Date</label></td>
                    <td><input type="date" name="date" value="" /></td>
                </tr>
            <tr>
            <td><label >Name</label></td>
            <td><input type="text" name="Name" /></td>
                </tr>
            <tr>
            <td><label >Place</label></td>
            <td><input type="text" name="Place" /></td>
            </tr>
            <tr>
            <td><label >District</label></td>
            <td><input type="text" name="dist" /></td>
            </tr>
             <td><label >Mob</label></td>
            <td><input type="text" name="Mob" value="" /></td>
                </tr>
          <tr>
              <td><label >Disaster Description</label></td>
            <td><input type="text" name="des" value="" /></td>
                </tr>
          <tr>
                    <td><label >Things You Need</label></td>
                    <td><textarea name="Things" rows="8" cols="40">
                        </textarea></td>
                </tr>
                <tr><td></td><td><input type="submit"  value="Send" /></td></tr>
           
            </tbody>
        </table></form>
        
            <div class="clearfix"></div>
		</div>
	</div>
        
       <p class="copy-right"><font style=" color: black">2019 © Safalam. All rights reserved.</font>
			</p> 
    
</html>
