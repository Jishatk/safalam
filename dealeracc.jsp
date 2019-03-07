<%-- 
    Document   : dealeracc
    Created on : Feb 9, 2019, 10:25:50 AM
    Author     : STUDENTS
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Relief a Society </title>

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
                String dnam=(String)sess.getAttribute("uname");
         %>
       
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
							<li class="active">
								<a  href="dealerhome.jsp">Home</a>
							</li>
                                                         <li>
								<a class="scroll" href="viewupdate.jsp">View Updates</a>
							</li>
							<li>
								<a class="scroll" href="verifypost.jsp">Post Verification</a>
							</li>
                                                        <li>
								<a class="scroll" href="viewdonation.jsp">View Messages</a>
                                                           
							</li>
                                                        <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Volunteer
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a class="scroll" href="viewvolunteer.jsp">View Volunteer</a>
									</li>
									<li>
										<a class="scroll" href="volmessage.jsp">Message to Volunteer</a>
									</li>
								</ul>
							</li>
                                                        <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MyAccount
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a class="scroll" href="dealeracc.jsp">Edit Profile</a>
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
                                <div align="right"       >     Welcome <%=dnam%>
                            </div>
			</div>
		</nav>
		<div class="clearfix"></div>
	</div>
        
        <%
            String nam="",dt="",adr="",st="",areu="",pwd="",po="",abt="",ed="",email="",bg="",gen="";
            Date dob=null;    
            
            long mb=0;
            String gnd[]=new String[]{"Male","Female","Others"};
            String ex[]=new String[]{"nss","ncc","jrc","scout&guide","other"};
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=fathima";
             String q="select * from adddealer where email=?";
            Connection con=DriverManager.getConnection(url);
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, "lal@gmail.com");
                    
            ResultSet rs=ps.executeQuery();
            rs.next();
           if(rs!=null)
           {
               nam=rs.getString("name");
               gen=rs.getString("gender").trim();
               dob=rs.getDate("dob");
               ed=rs.getString("education");
               bg=rs.getString("bloodgroup");
               adr=rs.getString("address");
               po=rs.getString("postcode");
               dt=rs.getString("district");
               st=rs.getString("state");
               mb=rs.getLong("mobile");   
               email=rs.getString("email");
               pwd=rs.getString("password");
               areu=rs.getString("areyou");
               abt=rs.getString("about");
               
           }
           String ex1[]=areu.split(",");
           for(String s:ex1){
               out.print(s);
           }
         %>   
        <div class="banner_bottom donate-log">
		<div class="donate-inner">

			
                    <div class="col-md-8 donate-info"><br><br>	<br><br>
                        <form action="dlraccServlet" method="post">
                            <table>
            <tr>
                <td><label >Name</label></td>
                <td><input type="text" name="name" value="<%=nam%>" /></td>
        </tr>
         <tr>
            <td><label >Gender</label></td>
            <td><% for(int i=0;i<gnd.length;i++){//out.print("s"+gen);
                if(gen.equals(gnd[i])){
            %>
                <input type="radio" name="gender" value="<%=gnd[i]%>" checked  /><%=gnd[i]%>
                        <%}
            else{%>
                <input type="radio" name="gender" value="<%=gnd[i]%>" /><%=gnd[i]%>
                <%}}%></td>
                 </tr>
                <tr>
                <td><label >Date Of Birth</label></td>
                <td><input type="date" name="dob" value="<%=dob%>"/></td>
        </tr> <tr>
                <td><label >Educational Qualification</label></td>
                <td><input type="text" name="education" value="<%=ed%>" /></td>
        </tr>
                 <tr>
                <td><label >Bloodgroup</label></td>
                <td><input type="text" name="blood" value="<%=bg%>" /></td>
        </tr>
        <tr>
                <td><label >Address</label></td>
                <td><textarea name="addr" rows="4" cols="20"><%=adr%>
                    </textarea></td>
        </tr>
          <tr>
                <td><label >Postcode</label></td>
                <td><input type="text" name="post" value="<%=po%>" /></td>
        </tr>
         <tr>
                <td><label >District</label></td>
                <td><input type="text" name="dist" value="<%=dt%>" /></td>
        </tr>
         <tr>
                <td><label >State</label></td>
                <td><input type="text" name="state" value="<%=st%>" /></td>
        </tr>
         <tr>
                <td><label >Mobile</label></td>
                <td><input type="text" name="mob" value="<%=mb%>" /></td>
        </tr>
         <tr>
                <td><label >Email </label></td>
                <td><input type="text" name="email" value="<%=email%>" readonly/></td>
        </tr>
        <tr>
                <td><label >Password </label></td>
                <td><input type="text" name="pass" value="<%=pwd%>" /></td>
        </tr>
        <tr>
                <td><label >Are you member of</label></td>
                <td>
                    <% if(ex[0].equals(ex1[0])) {%>
                        <input type="checkbox" name="<%=ex[0]%>" value="<%=ex[0]%>" checked><%=ex[0].toUpperCase()%>
                    <%}else{%>
                        <input type="checkbox" name="<%=ex[0]%>" value="<%=ex[0]%>"><%=ex[0].toUpperCase()%>
                    <%} if(ex[1].equals(ex1[1])){%>
                        <input type="checkbox" name="<%=ex[1]%>" value="<%=ex[1]%>" checked><%=ex[1].toUpperCase()%>
                    <%}else{%>
                        <input type="checkbox" name="<%=ex[1]%>" value="<%=ex[1]%>"><%=ex[1].toUpperCase()%>
                    <%} if(ex[2].equals(ex1[2])){%>
                        <input type="checkbox" name="<%=ex[2]%>" value="<%=ex[2]%>" checked><%=ex[2].toUpperCase()%>
                    <%}else{%>
                        <input type="checkbox" name="<%=ex[2]%>" value="<%=ex[2]%>"><%=ex[2].toUpperCase()%>
                    <%} if(ex[3].equals(ex1[3])){%>
                        <input type="checkbox" name="<%=ex[3]%>" value="<%=ex[3]%>" checked><%=ex[3].toUpperCase()%>
                    <%}else{%>
                        <input type="checkbox" name="<%=ex[3]%>" value="<%=ex[3]%>"><%=ex[3].toUpperCase()%>
                    <%} if(ex[4].equals(ex1[4])){%>
                        <input type="checkbox" name="<%=ex[4]%>" value="<%=ex[4]%>" checked><%=ex[4].toUpperCase()%>
                    <%}else{%>
                        <input type="checkbox" name="<%=ex[4]%>" value="<%=ex[4]%>"><%=ex[4].toUpperCase()%>
                    <%} %>
                </td>
        </tr>
         <tr>
                <td><label >About you</label></td>
                <td><textarea name="abtyou" rows="4" cols="20"><%=abt%>
                    </textarea></td>
        </tr>
        <tr>
                <td></td>
                <td><input type="submit" value="update" /></td>
        </tr>
        </table>
                        </form>             
                            </div>
			<div class="clearfix"></div>
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
                              
    </body>
</html>
