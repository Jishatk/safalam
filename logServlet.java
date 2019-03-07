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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class logServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
             response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String email=request.getParameter("uname");
            String pass=request.getParameter("pass");
           // String rol=request.getParameter("role");out.print(rol);
           String rol="";
            HttpSession sess=request.getSession(true);
            sess.setAttribute("uname",email);
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=password123";
            Connection con=DriverManager.getConnection(url); 
            String q="select * from logtb where uname=? and pass=?";            
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1,email);
            ps.setString(2,pass);
            ResultSet rs=ps.executeQuery();
            if(rs!=null){
                rs.next();
                rol=rs.getString("role");
                if(rol.equals("admin")){
                    RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
                    rd.forward(request, response);
                }
                else if(rol.equals("dealer")){
                    RequestDispatcher rd=request.getRequestDispatcher("dealerhome.jsp");
                    rd.forward(request, response);
                }
                else if(rol.equals("volunteer")){
                    RequestDispatcher rd=request.getRequestDispatcher("volunteerhome.jsp");
                    rd.forward(request, response);
                }else if(rol.equals("user")){
                    RequestDispatcher rd=request.getRequestDispatcher("userhome.jsp");
                    rd.forward(request, response);
                }
                
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Login !!!');");
                    out.println("location='index5.html';");
                    out.println("</script>");
                }
            } else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Login !!!');");
                    out.println("location='index5.html';");
                    out.println("</script>");
                }
          
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
           RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
           
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
