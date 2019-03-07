<%-- 
    Document   : donatefor
    Created on : 3 Mar, 2019, 11:05:21 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Safalam </title>

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
                String nam=(String)sess.getAttribute("uname");
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
							<li class="active">
								<a href="userhome.jsp">Home</a>
							</li>
						 <li>
								<a class="scroll" href="viewupdateuser.jsp">Latest updates</a>
							</li>
							<li>
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
                              <div align="right"       >     Welcome <%=nam%>
                            </div>  
			</div>
		</nav>
		<div class="clearfix"></div>
         </div>
        <% 
           //String 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=nihal";
            Connection con=DriverManager.getConnection(url);          
               String q1= "select * from  lateup"; 
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery(q1);
               String dis=request.getParameter("dis");
               String rid=request.getParameter("rfid");
        %>
        <br><br>
        <form action="payment.jsp" method="post"><br><br><br><br><br>
             <div style="font-size:large; colour: #313A3D;border-style: hidden;width:600px;height:650px; margin-left:100px">
            <table>
            <tr>
                <td><label>Name</label></td>
                <td><input type="text" name="name" value="" /></td>
            </tr>
            <tr>
                <td><label>Emailid</label></td>
        <td><input type="text" name="emailid" value="<%=nam%>" readonly/></td>
            </tr>
            <tr>
        <td><label>Mobilenumber</label></td>
        <td><input type="number" name="mobilenumber" value="" /></td>
            </tr>
            <tr>
        <td><label>Disaster</label>
        <td><input type="text" name="disaster" value="<%=dis%>"/></td>
            </tr>
            <tr>
        <td><label>Donation amount in INR</label></td>
        <td><input type="number" name="donationamt" value="" /></td>
            </tr>
            <tr>
        <td><input type="hidden" name="" value="<%=rid%>" /></td>
            </tr>
            <tr>
        <td><input type="submit" name="" value="Donate" /></td>
            </tr>
            </table>
             </div>
        </form>
         <p class="copy-right"><font style=" color: black">2019 © Safalam. All rights reserved.</font>
			</p>  
    </body>
</html>
