<%-- 
    Document   : delete
    Created on : 26 févr. 2023, 14:33:26
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    
        String id_prod=request.getParameter("id_prod");
        
        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         pst=con.prepareStatement("delete from produits where id_prod = ?");
      
           pst.setString(1, id_prod);
          pst.execute();
          %>
          
          <script>
              alert("delete");
          </script>
  <%         
        
    
%>
<jsp:forward page="produit.jsp"/>

