<%-- 
    Document   : logout
    Created on : 06-03-2018, 11:35:14 AM
    Author     : ludie
--%>

<%
   if (session != null) {
       session.invalidate();
   }
   response.sendRedirect(request.getContextPath());
%>