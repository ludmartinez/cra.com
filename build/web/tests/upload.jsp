<%-- 
    Document   : upload
    Created on : 05-25-2018, 03:47:52 PM
    Author     : ludie
--%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String filebox = "C:\\Users\\ludie\\OneDrive\\UFG\\Ciclo-07\\PRG3\\cra.com\\web\\files";
    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(1024);
    factory.setRepository(new File(filebox));
    ServletFileUpload upload = new ServletFileUpload(factory);
    
try{
    List<FileItem> partes = upload.parseRequest(request);
    for(FileItem items: partes){
        File file = new File(filebox,items.getName());
        items.write(file);
    }
    out.println(request.getContextPath());
}
catch(Exception ex){
    out.println("Exception: "+ex.getMessage());
}
%>