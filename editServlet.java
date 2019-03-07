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
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class editServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            
            String name=request.getParameter("name");
           
            String addr=request.getParameter("address");
            String city=request.getParameter("City");
            String state=request.getParameter("State");
            String smob=request.getParameter("Mob");
            long mob=Long.parseLong(smob);
            String email=request.getParameter("Email");
            String password=request.getParameter("pass");
            // DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            //java.util.Date db = df.parse(dob);
            
            
            
            //   java.sql.Date dt=new java.sql.Date(db.getTime());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=fathima";
            
            String q="update register set fname=?,address=?,city=?,state=?,mobile=?,password=? where email=?";
            Connection con=DriverManager.getConnection(url);
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, name);
             ps.setString(2, addr);
             ps.setString(3, city);
             ps.setString(4, state);
            ps.setLong(5, mob);
            ps.setString(6, password);
            ps.setString(7,email);
            int c= ps.executeUpdate();
            
           
                    /* TODO output your page here. You may use following sample code. */
                    
                    } catch (SQLException ex) {
            Logger.getLogger(editServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editServlet.class.getName()).log(Level.SEVERE, null, ex);
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
