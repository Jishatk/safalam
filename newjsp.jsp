<%-- 
    Document   : newjsp
    Created on : 3 Mar, 2019, 5:54:56 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
           //String 
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url="jdbc:sqlserver://localhost:1433;databaseName=safalam;user=sa;password=nihal";
            Connection con=DriverManager.getConnection(url);          
               String q1= "select * from  lateup"; 
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery(q1);
        %>
        <br><br>
        <form action="donateservlet" method="post"><br><br><br><br><br>
             <div style="font-size:large; colour: #313A3D;border-style: hidden;width:600px;height:650px; margin-left:100px">
            <table>
            <tr>
                <td><label>Name</label></td>
                <td><input type="text" name="name" value="" /></td>
            </tr>
            <tr>
                <td><label>Emailid</label></td>
        <td><input type="text" name="emailid"  readonly/></td>
            </tr>
            <tr>
        <td><label>Mobilenumber</label></td>
        <td><input type="number" name="mobilenumber" value="" /></td>
            </tr>
            <tr>
        <td><label>Disaster</label>
        <td><select name="disaster">
            <option value="select">select</option> 
            <%while(rs.next()){%>
            <option value="<%=rs.getString("title")%>"><%=rs.getString("title")%></option>
            <% } %>
        </select></td>
            </tr>
            <tr>
        <td><label>Donation amount in INR</label></td>
        <td><input type="number" name="donationamt" value="" /></td>
            </tr>
            <tr>
         <td><label>Select bank</label></td>
        <td><select name="ptype">
            <option value="select">select</option>
            <option value="credit">credit</option>
            <option value="debit">debit</option>
            <option value="nbank">net banking</option>
            
        </select></td>
            </tr>
            <tr>
        <td><input type="submit" name="" value="Donate" /></td>
            </tr>
            </table>
             </div>
        </form>
        <center><b><h1>PAYMENT DETAILS</h1></b></center>
        <div align="center">
        <form id="myform" name="myform" action="Bookservlet" method="post">  
            <b>Choose Payment Option</b></br></br>
                    <table cellspacing="5" cellpadding="5"><tr><td>
        <input type="radio" id="card" name="group1" value="Card"  />Credit/Debit </br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table cellspacing="5" cellpadding="15">
            <tr><td width="150" >&nbsp;&nbsp;Card No </td><td><input type="text"  name="cardno" id="txt" style="font-size:18pt;height:30px;width:200px;"></td></tr>
            <tr><td width="150">&nbsp;&nbsp;Expiry Date</td><td><input type="text" name="exp" id="txt" style="font-size:18pt;height:30px;width:200px;"></td></tr>
            <tr><td width="150">&nbsp;&nbsp;Name Of Card</td><td><input type="text" name="namecard" id="txt" style="font-size:18pt;height:30px;width:200px;"></td></tr>
        </table>   </td></tr> 
                        <tr><td><input type="radio" id="bank" name="group1" value="Banking" />Internet Banking </br></br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="bank" id="bankd" style="font-size: 15pt">
        <option value="Select">Select</option>
        <option value="SBI">SBI</option>
        <option value="SBT">SBT</option>
        <option value="ICICI">ICICI</option>
        <option value="State Bank">State Bank</option>
        </select></td></tr></table>
        <br><input type="submit" value="Pay" class="button" /></br>
       
        </form>
        </div>
        
        <table>
            <tr><th><h3><input type="radio" id="card" name="group1" value="Card"/>Credit/Debit </h3></th><th></th></tr>
            <tr><th>&nbsp;&nbsp;Card No</th><th></th></tr>
            <tr><th>&nbsp;&nbsp;&nbsp;&nbsp;Expiry Date</th><th></th></tr>
            <tr><th>&nbsp;&nbsp;&nbsp;&nbsp;Name Of Card</th><th></th></tr>
            <tr><th><h3><input type="radio" id="bank" name="group1" value="Banking"/>Internet Banking</h3></th><th></th></tr>
            <tr><th>Select</th><th><select name="bank" id="bankd" style="font-size: 15pt">
        <option value="Select">Select</option>
        <option value="SBI">SBI</option>
        <option value="SBT">SBT</option>
        <option value="ICICI">ICICI</option>
        <option value="State Bank">State Bank</option>
        </select></th></tr>
            
        </table>
        
    </body>
</html>
