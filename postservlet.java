package control;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class postservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.text.ParseException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
             String date=request.getParameter("date"); 
           
            String name=request.getParameter("Name");
            String place=request.getParameter("Place");
            String dst=request.getParameter("dist");
             String ds=request.getParameter("des");
            String smob=request.getParameter("Mob");
            long mob=Long.parseLong(smob);
            String things=request.getParameter("Things");
             DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date dt=df.parse(date);             
            java.sql.Date sdt=new java.sql.Date(dt.getTime());
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=fathima";
            
            String q="insert into posts values(?,?,?,?,?,?,?,?)";
           
         
            Connection con=DriverManager.getConnection(url);
             PreparedStatement ps=con.prepareStatement(q);

            
            ps.setString(1, date);
            ps.setString(2, name);
            ps.setString(3, place);
            ps.setString(4, dst);
             ps.setString(5, smob);
             ps.setString(6, ds);
             ps.setString(7, things);
             ps.setString(8,"Not verified");
            int c=  ps.executeUpdate();   
            if(c==1){
                out.println("<script type=\"text/javascript\">");
                    out.println("alert('Requirements posted !!!');");
                    out.println("location='index5.html';");
                    out.println("</script>");
               // RequestDispatcher rd=request.getRequestDispatcher("post.jsp");
           // rd.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(postservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(postservlet.class.getName()).log(Level.SEVERE, null, ex);
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
