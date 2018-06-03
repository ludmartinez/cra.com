<%-- 
    Document   : mtoMaterias
    Created on : 05-27-2018, 03:58:41 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
    <c:when test="${param.codigo != '' && param.nombre != ''}">
        <c:if test="${param.op == 1}">
            <sql:update dataSource="jdbc/cra">
                INSERT INTO materia(cod_materia, nombre)
                VALUES(?, ?)
                <sql:param value="${param.codigo}"/>
                <sql:param value="${param.nombre}"/>
            </sql:update>
            <c:redirect url="../index.jsp?st=1"/>
        </c:if>
        <c:if test="${param.op == 2}">
            <sql:update dataSource="jdbc/cra">
                UPDATE materia
                SET nombre = ?
                WHERE cod_materia = ?
                <sql:param value="${param.nombre}"/>
                <sql:param value="${param.codigo}"/>
            </sql:update>
            <c:redirect url="../index.jsp?st=2"/>
        </c:if>
    </c:when>
    <c:when test="${param.op == 3}">
        <sql:update dataSource="jdbc/cra">
            UPDATE materia
            SET estado = 0
            WHERE cod_materia = ?
            <sql:param value="${param.codigo}"/>
        </sql:update>
        <c:redirect url="../index.jsp?st=3"/>
    </c:when>
    <c:otherwise>
        <c:redirect url="../index.jsp?st=4"/>
    </c:otherwise>
</c:choose>