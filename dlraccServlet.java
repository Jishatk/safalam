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
import javax.servlet.http.HttpSession;

/**
 *
 * @author STUDENTS
 */
public class dlraccServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
                HttpSession sess=request.getSession(true);
                String dnam=(String)sess.getAttribute("uname");               
         
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String extra="";
            String name=request.getParameter("name");
            String gen=request.getParameter("gender");
            String dob=request.getParameter("dob");
            String edu=request.getParameter("education");
            String bloodgroup=request.getParameter("blood");
            String addr=request.getParameter("addr");
            String postcode=request.getParameter("post");
            String dist=request.getParameter("dist");
            String state=request.getParameter("state");
            String mob=request.getParameter("mob");
            long lmob=Long.parseLong(mob);
            String email=request.getParameter("email");
            String pass=request.getParameter("pass");
            String ex1=request.getParameter("nss");
            String ex2=request.getParameter("ncc");
            String ex3=request.getParameter("jrc");
            String ex4=request.getParameter("scout&guide");
            String ex5=request.getParameter("other");
            extra=ex1+","+ex2+","+ex3+","+ex4+","+ex5;
            DateFormat df=new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date db = df.parse(dob);
            String aboutyou=request.getParameter("abtyou");
            out.print(email+extra+pass);
            java.sql.Date dt=new java.sql.Date(db.getTime());
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=fathima";
            
            String q="update adddealer set name=?,gender=?,dob=?,education=?,bloodgroup=?,address=?,postcode=?,district=?,state=?,mobile=?,password=?,areyou=?,about=? where email=?";
            Connection con=DriverManager.getConnection(url);
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, name);
            ps.setString(2, gen);
            ps.setString(3,dob);
            ps.setString(4,edu);
            ps.setString(5,bloodgroup);
            ps.setString(6,addr);
            
            ps.setString(7,postcode);
            ps.setString(8,dist);
            ps.setString(9,state);
            ps.setLong(10,lmob);
            ps.setString(11,pass);
            ps.setString(12,extra);
            
            ps.setString(13,aboutyou);
            ps.setString(14,email);
            
            int c= ps.executeUpdate();
            if(c==1){
               out.println("<script type=\"text/javascript\">");
                    out.println("alert('Record Updated Succesfully !!!');");
                    out.println("location='dealerhome.jsp';");
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
