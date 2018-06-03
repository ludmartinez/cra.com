<%-- 
    Document   : notas
    Created on : 05-28-2018, 03:13:38 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
${param.grado}
${param.materia}
${param.evaluacion}
${param.alumno}
${param.nota}

<c:if test="${param.grado != '' && param.materia != '' && param.evaluacion != '' && param.alumno != '' && param.nota !=''}">
    <c:catch var="exception">
        <sql:update dataSource="jdbc/cra">
            INSERT INTO nota(carnet_alumno, cod_materia,cod_evaluacion,cod_grado, nota)
            VALUES( ?, ?, ?, ?, ?)
            <sql:param value="${param.alumno}"/>
            <sql:param value="${param.materia}"/>
            <sql:param value="${param.evaluacion}"/>
            <sql:param value="${param.grado}"/>
            <sql:param value="${param.nota}"/>
        </sql:update>
            <p>ok</p>
    </c:catch>
            ${exception}
</c:if>