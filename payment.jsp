<%-- 
    Document   : payment.jsp
    Created on : 3 Mar, 2019, 6:08:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    
    </head>
    <body>
        <%
            HttpSession sess=request.getSession(true);
            String name=request.getParameter("name");
            String emailid=request.getParameter("emailid");
            String mob=request.getParameter("mobilenumber");
            String disaster=request.getParameter("disaster");
            String amt=request.getParameter("donationamt");out.print(name+emailid+mob+disaster+amt);
            sess.setAttribute("nam",name);
            sess.setAttribute("em",emailid);
            sess.setAttribute("mob",mob);
            sess.setAttribute("dis",disaster);
            sess.setAttribute("amt",amt);
        %>
         <div class="top_header" id="home">
		<!-- Fixed navbar -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="nav_top_fx_w3layouts_agileits">
				
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					    aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<div class="logo_wthree_agile">
						<h1>
							<a class="navbar-brand" href="index.html">
								<i class="fas fa-heart" aria-hidden="true"></i> Safalam
								<span class="desc">Let's Heal the World.</span>
							</a>
						</h1>
					</div>
				
				<div id="navbar" class="navbar-collapse collapse">
					<div class="nav_right_top">
						<ul class="nav navbar-nav">
							<li >
								<a href="userhome.jsp">Home</a>
							</li>
						 <li>
								<a class="scroll" href="viewupdateuser.jsp">Latest updates</a>
							</li>
							<li class="active">
								<a class="scroll" href="donate.jsp">Donate online</a>
							</li>
                                                        <li>
								<a class="scroll" href="Enumbers.html">Emergency numbers</a>
                                                           
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MyAccount
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a class="scroll" href="myacc.jsp">Edit Profile</a>
									</li>
									<li>
										<a class="scroll" href="mydonation.jsp">MyDonations</a>
									</li>
								</ul>
							</li>


							<li>
								<a class="scroll" href="signout.jsp">Sign Out</a>
							</li>

						</ul>
					</div>
				</div>
				<!--/.nav-collapse -->
                              <div align="right"       >     Welcome
                            </div>  
			</div>
		</nav>
		<div class="clearfix"></div>
         </div>
          <div class="banner_bottom donate-log">
            <div class="donate-inner"><br><br>
        <center><h4>PAYMENT DETAILS</h4></center>
        <div style="font-size:large; colour:grey;border-style: groove;width:500px;height:430px; margin-left:200px">
        <form id="myform" name="myform" action="donateservlet" method="post">  
            <b>Choose Payment Option</b></br></br>
                    <table cellspacing="5" cellpadding="5"><tr><td>
        <input type="radio" id="card" name="group1" value="Card"  />Credit/Debit </br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table cellspacing="5" cellpadding="15">
            <tr><td width="150" >&nbsp;&nbsp;Card No </td><td><input type="text"  name="cardno" id="txt" ></td></tr>
            <tr><td width="150">&nbsp;&nbsp;Expiry Date</td><td><input type="date" name="exp" id="txt" ></td></tr>
            <tr><td width="150">&nbsp;&nbsp;Name Of Card</td><td><input type="text" name="namecard" id="txt" ></td></tr>
        </table>   </td></tr> 
                        <tr><td><input type="radio" id="bank" name="group1" value="Banking" />Internet Banking </br></br>
       &nbsp;&nbsp;&nbsp;&nbsp;Select A Bank &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="bank" id="bankd" >
        <option value="Select">Select</option>
        <option value="SBI">SBI</option>
        <option value="SBT">SBT</option>
        <option value="ICICI">ICICI</option>
        <option value="State Bank">State Bank</option>
       </select></td></tr></table><br>
        <br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Proceed" class="button" style="width:100px;height:30px;" /></br>
       
        </form>
        </div>
            </div>
          </div>
         <p class="copy-right"><font style=" color: black">2019 © Safalam. All rights reserved.</font>
			</p>
          <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<!-- script for responsive tabs -->
	<script src="js/easy-responsive-tabs.js"></script>
	<script>
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true, // 100% fit in a container
				closed: 'accordion', // Start closed if in accordion view
				activate: function (event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#tabInfo');
					var $name = $('span', $info);
					$name.text($tab.text());
					$info.show();
				}
			});
			$('#verticalTab').easyResponsiveTabs({
				type: 'vertical',
				width: 'auto',
				fit: true
			});
		});
	</script>
	<!--// script for responsive tabs -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
			// Slideshow 4
			$("#slider4").responsiveSlides({
				auto: true,
				pager: true,
				nav: false,
				speed: 500,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<script type="text/javascript" src="js/all.js"></script>
	<script>
		$('ul.dropdown-menu li').hover(function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function () {
			$(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
		});
	</script>

	<!-- js -->
	<script type="text/javascript" src="js/simplyCountdown.js"></script>
	<link href="css/simplyCountdown.css" rel='stylesheet' type='text/css' />
	<script>
		var d = new Date();
		simplyCountdown('simply-countdown', {
			year: d.getFullYear(),
			month: d.getMonth() + 2,
			day: 25
		});
		simplyCountdown('simply-countdown-custom', {
			year: d.getFullYear(),
			month: d.getMonth() + 2,
			day: 25
		});
		$('#simply-countdown-losange').simplyCountdown({
			year: d.getFullYear(),
			month: d.getMonth() + 2,
			day: 25
		});
	</script>
	<!--js-->
	<!--/tooltip -->
	<script>
		$(function () {
			$('[data-toggle="tooltip"]').tooltip({
				trigger: 'manual'
			}).tooltip('show');
		});

		// $( window ).scroll(function() {   
		// if($( window ).scrollTop() > 10){  // scroll down abit and get the action   
		$(".progress-bar").each(function () {
			each_bar_width = $(this).attr('aria-valuenow');
			$(this).width(each_bar_width + '%');
		});

		//  }  
		// });
	</script>
	<!--//tooltip -->
	<!-- Smooth-Scrolling-JavaScript -->
	<script type="text/javascript" src="js/easing.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			$(".scroll, .navbar li a, .footer li a").click(function (event) {
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //Smooth-Scrolling-JavaScript -->
	<script type="text/javascript">
		$(document).ready(function () {
			/*
									var defaults = {
							  			containerID: 'toTop', // fading element id
										containerHoverID: 'toTopHover', // fading element hover id
										scrollSpeed: 1200,
										easingType: 'linear' 
							 		};
									*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>


	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>

	<!-- jQuery-Photo-filter-lightbox-Gallery-plugin -->
	<script type="text/javascript" src="js/jquery-1.7.2.js"></script>
	<script src="js/jquery.quicksand.js" type="text/javascript"></script>
	<script src="js/script.js" type="text/javascript"></script>
	<script src="js/jquery.prettyPhoto.js" type="text/javascript"></script>   
        <script>
            window.onload = function() {
                form.cardno.disabled = form.exp.disabled = form.namecard.disabled = true;
                document.getElementById("bankd").disabled=true;
            }
            var form = document.forms['myform'];
            form.group1[0].onfocus = function () {
            form.cardno.disabled = form.exp.disabled = form.namecard.disabled = false;
            document.getElementById("bankd").disabled=true;
            }
            form.group1[1].onfocus = function () {
            form.cardno.disabled = form.exp.disabled = form.namecard.disabled = true;
            document.getElementById("bankd").disabled=false;
            }
        </script>  
    </body>
</html>
