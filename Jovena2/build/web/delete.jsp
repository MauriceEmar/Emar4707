<%-- 
    Document   : delete
    Created on : 26 févr. 2023, 14:33:26
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    
        String id_cli=request.getParameter("id_cli");
        
        Connection con;
        PreparedStatement  pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost/jovenna", "root", "");
         pst=con.prepareStatement("delete from client where id_cli = ?");
      
           pst.setString(1, id_cli);
          pst.execute();
          %>
          
          <script>
              alert("delete");
            </script>
  <%         
        
    
%>
<jsp:forward page="index.jsp"/>

