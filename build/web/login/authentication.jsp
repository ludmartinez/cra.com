<%-- 
    Document   : authentication
    Created on : 05-27-2018, 09:36:21 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<sql:query var="veruser" dataSource="jdbc/cra">
    SELECT *
    FROM usuario
    WHERE nombreUsuario = ?
    AND password = ?
    <sql:param value="${param.user}"/>
    <sql:param value="${param.pass}"/>
</sql:query>

<c:choose>
    <c:when test="${veruser.rowCount > 0}">
        <c:if test="${veruser.rows[0].carnet_profesor != null}">
            <sql:query var="profesordata" dataSource="jdbc/cra">
                SELECT nombre1, apellidoPaterno
                FROM profesor
                WHERE carnet = ?
                <sql:param value="${veruser.rows[0].carnet_profesor}"/>
            </sql:query>
            <c:set var="id_user" scope="session" value="${veruser.rows[0].carnet_profesor}"/>
            <c:set var="cnt" scope="application" value="${profesordata.rows[0].nombre1} ${profesordata.rows[0].apellidoPaterno}"/>
            <c:redirect url="../profesores/"/>
        </c:if>
        <c:if test="${veruser.rows[0].carnet_alumno != null}">
            <sql:query var="alumnodata" dataSource="jdbc/cra">
                SELECT nombre1, apellidoP
                FROM alumno
                WHERE carnet = ?
                <sql:param value="${veruser.rows[0].carnet_alumno}"/>
            </sql:query>
                <c:set var="id_user" scope="session" value="${veruser.rows[0].carnet_alumno}"/>
            <c:set var="cnt" scope="session" value="${alumnodata.rows[0].nombre1} ${alumndata.rows[0].apellidoPaterno}"/>
            <c:redirect url="../alumnos/"/>
        </c:if>
        <c:if test="${veruser.rows[0].carnet_profesor == null && veruser.rows[0].carnet_alumno == null}">
            <c:set var="cnt" scope="session" value="${param.user}"/>
            <c:redirect url="../administration/"/>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:redirect url="${pageContext.servletContext.contextPath}"/>
    </c:otherwise>
</c:choose>