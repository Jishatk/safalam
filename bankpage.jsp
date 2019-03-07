<%-- 
    Document   : bankpage
    Created on : 3 Mar, 2019, 8:47:55 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Please wait
        <%
        response.setIntHeader("Refresh",10);
        %>
    </body>
</html>
