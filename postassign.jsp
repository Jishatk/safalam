<%-- 
    Document   : postassign
    Created on : Feb 4, 2019, 12:27:53 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        String id=request.getParameter("rid");
        out.print("id"+id);
        int refid=Integer.parseInt(id);
         String dn=request.getParameter("dname");
        out.print("dn"+dn);
        String val[]=dn.split(",");out.print(val[0]+val[1]);
        int did=Integer.parseInt(val[1]);
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=fathima";
        Connection con=DriverManager.getConnection(url);
        String q1="select email from  adddealer where dlrid="+did; 
        Statement ps1=con.createStatement();
       ResultSet rs1=ps1.executeQuery(q1);
       rs1.next();
       String email=rs1.getString("email");out.print(email);
        String q="select * from  posts where refid="+refid;            
        Statement ps=con.createStatement();
       ResultSet rs=ps.executeQuery(q);
        rs.next();
        String dt=rs.getString("ddate");
        String aname=rs.getString("uname");
        String pl=rs.getString("place");
        String dst=rs.getString("district");
        String mob=rs.getString("mob");
        String desc=rs.getString("descrpt");
        String need=rs.getString("needs");
       
        con.setAutoCommit(false);
        String q2="insert into postview1 values(?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(q2);
        p.setInt(1, refid);
        p.setString(2, aname);
        p.setString(3, dt);
        p.setString(4, pl);
        p.setString(5, dst);
        p.setString(6, mob);
        p.setString(7, desc);
        p.setString(8, need);
        p.setString(9, email);
        p.setString(10, "f");
        int c=p.executeUpdate();out.print(c) ;
        String q3="update posts set status=? where refid=?";
        PreparedStatement p1=con.prepareStatement(q3);
        p1.setString(1, "assigned to "+dn);
        p1.setInt(2, refid);
        int c1=p1.executeUpdate();out.print(c1) ;
        if(c==1 && c1==1){
            con.commit();
             out.println("<script type=\"text/javascript\">");
                    out.println("alert('Post Assigned !!!');");
                    out.println("location='admin.jsp';");
                    out.println("</script>");
        }

        %>        
    </body>
</html>
