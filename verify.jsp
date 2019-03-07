<%-- 
    Document   : verify
    Created on : Feb 5, 2019, 2:43:47 PM
    Author     : STUDENTS
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
       String id=request.getParameter("id");out.print(id);
        String val[]=id.split(",");
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=fathima";
        Connection con=DriverManager.getConnection(url);
        if(val[1].equals("verify")){
            con.setAutoCommit(false);
            String q="update postview1 set status='t' where rid="+val[0];
            Statement st=con.createStatement();
            int c=st.executeUpdate(q);
            String q1="update posts set status='verified' where refid="+val[0];
            Statement st1=con.createStatement();
            int c1=st1.executeUpdate(q1);
            
        if(c==1 && c1==1){
            con.commit();
            request.setAttribute("msg","Post Verified");
          //  RequestDispatcher rd=request.getRequestDispatcher("verifypost.jsp");
          //  rd.forward(request, response);
           out.println("<script type=\"text/javascript\">");
                    out.println("alert('Post Verified .');");
                    out.println("location='dealerhome.jsp';");
                    out.println("</script>");
        }
        }
        if(val[1].equals("resend")){
            con.setAutoCommit(false);
            String q="delete from postview1  where rid="+val[0];
            Statement st=con.createStatement();
            int c=st.executeUpdate(q);
            String q1="update posts set status='Not verified resend' where refid="+val[0];
            Statement st1=con.createStatement();
            int c1=st1.executeUpdate(q1);
            if(c==1 && c1==1){
               con.commit(); 
               out.println("<script type=\"text/javascript\">");
                    out.println("alert('Post resend to Admin .');");
                    out.println("location='dealerhome.jsp';");
                    out.println("</script>");
            }
        }
        %>        
    </body>
</html>
