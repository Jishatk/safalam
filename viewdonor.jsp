<%-- 
    Document   : viewdonor
    Created on : Jan 5, 2019, 12:43:30 PM
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
        <title>Home </title>

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
							<a class="navbar-brand" href="admin.jsp">
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
								<a href="admin.jsp">Home</a>
							</li>
                                                         <li>
								<a class="scroll" href="Viewupdates.jsp">Add news</a>
							</li>
							<li>
								<a class="scroll" href="viewdonor.jsp">View donor</a>
							</li>
                                                        <li>
								<a class="scroll" href="viewdonation.jsp">View donation</a>
                                                           
							</li>                                                       
							                                                            
                                                           <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Volunteer
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a class="scroll" href="addvolunteer.jsp">Add volunteer</a>
									</li>
									<li>
										<a class="scroll" href="viewvolunteer.jsp">View volunteer</a>
									</li>
                                                                        
								</ul>
							</li>
                                                        <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dealer
									<span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a class="scroll" href="adddealer.jsp">Add Dealer</a>
									</li>
									<li>
										<a class="scroll" href="viewdealer.jsp">View Dealer</a>
									</li>
                                                                        <li>
										<a class="scroll" href="messages.jsp">Messages to dealers</a>
									</li>
								</ul>
							</li>
                                                        <li>
								<a class="scroll" href="viewpost.jsp">View Post</a>
							</li>
                                                        <li>
								<a class="scroll" href="signout.jsp">Sign Out</a>
							</li>
						</ul>
					</div>
				</div>
                            <div align="right" >     Welcome <%=nam%>
                            </div> 
                            </div>
		</nav>
		<div class="clearfix"></div>
	</div>
        
        <div class="banner_bottom donate-log">
            <div class="donate-inner"><br><br><br><br><br><br>
                <center><h4>Donor Info</h4></center><br>
        <table style="width:100%">
            <tr><th>Name</th><th>City</th><th>Mobile</th><th>Email</th></tr>
        <%
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=password123";
            
            String q="select * from register";
            Connection con=DriverManager.getConnection(url);
            Statement ps=con.createStatement();
            ResultSet rs=ps.executeQuery(q);
            while(rs.next()){
               // out.print(rs.getString("fname"));
         %>
         <tr><td><%=rs.getString("fname")%></td><td><%=rs.getString("city")%></td><td><%=rs.getString("mobile")%></td><td><%=rs.getString("email")%></td></tr>
         <%
            }
         %> 
        </table>
                
                <br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="clearfix"></div>
		</div>
	</div> 
        <p class="copy-right"><font style=" color: black">2019 © Safalam. All rights reserved.</font>
			</p>
    </body>
</html>
