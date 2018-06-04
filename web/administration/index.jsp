<%-- 
    Document   : index
    Created on : 05-14-2018, 05:28:01 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="target" value="administration"/>
<%@include file="/WEB-INF/jspf/header.jspf" %>
<section class="container py-4">
    <div class="row">
        <a href="alumnos/" class="btn btn-block btn-success col-12 col-md my-2 mr-2">
            <h3>Alumnos</h3>
            <br>
            <i class="fas fa-user-graduate" style="font-size: 10em"></i>
        </a>
        <a href="profesores/" class="btn btn-block btn-success col-12 col-md my-2 mr-2">
            <h3>Profesores</h3>
            <br>
            <i class="fas fa-chalkboard-teacher" style="font-size: 10em"></i>
        </a>
        <a href="materias/" class="btn btn-block btn-success col-12 col-md my-2 mr-2">
            <h3>Materias</h3>
            <br>
            <i class="fas fa-book" style="font-size: 10em"></i>
        </a>
        <div class="w-100"></div>
        <a href="#" class="btn btn-block btn-success col-12 col-md my-2 mr-2">
            <h3>Grados</h3>
            <br>
            <i class="fas fa-list-ol" style="font-size: 10em"></i>
        </a>
        <a href="#" class="btn btn-block btn-success col-12 col-md my-2 mr-2">
            <h3>Direcciones</h3>
            <br>
            <i class="fas fa-map" style="font-size: 10em"></i>
        </a>
        <a href="#" class="btn btn-block btn-success col-12 col-md my-2 mr-2">
            <h3>Usuarios</h3>
            <br>
            <i class="fas fa-user" style="font-size: 10em"></i>
        </a>
    </div>
</section>

<%@include file="/WEB-INF/jspf/footer.jspf" %>

