<%-- 
    Document   : fileupload
    Created on : 05-25-2018, 03:21:31 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="upload.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="file">
            <input type="submit" value="subir archivo">
        </form>
    </body>
</html>
