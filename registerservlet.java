/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
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
 * @author User
 */
public class registerservlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            String name=request.getParameter("name");
            String dob=request.getParameter("dob");
            String gen=request.getParameter("gender");
            String addr=request.getParameter("address");
            String city=request.getParameter("City");
            String state=request.getParameter("State");
            String smob=request.getParameter("Mob");
            long mob=Long.parseLong(smob);
            String email=request.getParameter("Email");
            String password=request.getParameter("pass");
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date db = df.parse(dob);         
                            
            java.sql.Date dt=new java.sql.Date(db.getTime());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=password123";
            
            String q="insert into register values(?,?,?,?,?,?,?,?,?)";
            Connection con=DriverManager.getConnection(url);
            con.commit();
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, name);
            ps.setDate(2, dt);
            ps.setString(3,gen);
            ps.setString(4,addr);
            ps.setString(5,city);            

            ps.setString(6,state);
            ps.setLong(7,mob);
            ps.setString(8,email);
            ps.setString(9,password); 
            int c=ps.executeUpdate();
            
            String q1="insert into logtb values(?,?,?)";
              PreparedStatement ps1=con.prepareStatement(q1);
            ps1.setString(1, email);
            ps1.setString(2, password);
            ps1.setString(3,"user");
            int c1=ps1.executeUpdate();
            
            if(c==1 &c1==1){
                con.commit();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Account created !!!');");
                out.println("location='index5.html';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
           ex.printStackTrace();
        } catch (ParseException ex) {
           ex.printStackTrace();
        }
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
