/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author student
 */
public class volunteerServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            String name=request.getParameter("name");
            String gender=request.getParameter("gender");
            String dob=request.getParameter("date");           
            String bloodgroup=request.getParameter("blood");
            String address=request.getParameter("addr");
            String postcode=request.getParameter("post");
            String district=request.getParameter("dist");
            String state=request.getParameter("state");
            String mobile=request.getParameter("mob");
            String emailid=request.getParameter("email");
            String pass=request.getParameter("pass");
            String member=request.getParameter("member");
            String aboutyou=request.getParameter("abtyou");
           
          //  out.print(name+gender+dob+bloodgroup);
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date dt=df.parse(dob);             
            java.sql.Date sdt=new java.sql.Date(dt.getTime());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=password123";
            
            String q="insert into addvolunteer values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            Connection con=DriverManager.getConnection(url);
           con.setAutoCommit(false);
            PreparedStatement ps=con.prepareStatement(q);
            
            ps.setString(1, name);
            ps.setString(2, gender);
            ps.setString(3, dob);
             ps.setString(4, bloodgroup);
             ps.setString(5, address);
             ps.setString(6, postcode);
             ps.setString(7, district);
             ps.setString(8, state);
             ps.setLong(9, Long.parseLong(mobile));
             ps.setString(10, emailid);
             ps.setString(11, pass);
             ps.setString(12, member);
             ps.setString(13, aboutyou);
            int c=ps.executeUpdate();
            
            String q1="insert into logtb values(?,?,?)";
             PreparedStatement ps1=con.prepareStatement(q1);
            
            ps1.setString(1,emailid);
            ps1.setString(2, pass);
            ps1.setString(3, "volunteer");
            int c1=ps1.executeUpdate();
            
            if(c==1 &c1==1){
                con.commit();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Volunteer Account Created !!!');");
                out.println("location='admin.jsp';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (ParseException ex) {
            ex.printStackTrace();
        }  catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
        
        