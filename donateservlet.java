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
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class donateservlet extends HttpServlet {

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
           HttpSession sess=request.getSession(true);
         String name=(String)sess.getAttribute("nam");out.print(name);
          String email=(String)sess.getAttribute("em");out.print(email);
           String mob=(String)sess.getAttribute("mob");out.print(mob);
            String dis=(String)sess.getAttribute("dis");out.print(dis);
             String amt=(String)sess.getAttribute("amt");out.print(amt);
            String val=request.getParameter("group1");
         out.print(val);   
         String cno="";
         String cname="";
         String exp="";
         String bnk="";
         java.sql.Date dt=null;
         DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
         long lcno=0;   
         if(val.equals("Card"))
           {
            cno=request.getParameter("cardno");
            out.print(cno);
            cname=request.getParameter("namecard");
            out.print(cname);
            exp=request.getParameter("exp");
            out.print(exp);
             java.util.Date db = df.parse(exp); 
              dt=new java.sql.Date(db.getTime());
              lcno= Long.parseLong(cno);
           }    
           if(val.equals("Banking"))
           {
             bnk=request.getParameter("bank");
             out.print(bnk);          
           } 
                  
                            
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=nihal";
            
            String q="insert into donation values(?,?,?,?,?,?,?,?,?,?,?)";
            Connection con=DriverManager.getConnection(url);
            PreparedStatement ps=con.prepareStatement(q);
           
           ps.setString(1, name);
            ps.setString(2,email);
            ps.setLong(3,Long.parseLong(mob));
            ps.setString(5,dis);
            ps.setLong(4,Long.parseLong(amt));
            ps.setInt(6,2);
             ps.setString(7, val);
             ps.setLong(8, lcno);
             ps.setDate(9, dt);
              ps.setString(10,cname);
              ps.setString(11,bnk);
            int c=ps.executeUpdate();out.print(c);
            if(c==1)
            {
               RequestDispatcher rd=request.getRequestDispatcher("userhome.jsp");
                rd.forward(request, response);
                        
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(donateservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(donateservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(donateservlet.class.getName()).log(Level.SEVERE, null, ex);
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
