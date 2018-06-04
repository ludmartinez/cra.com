<%-- 
    Document   : cmbListGrado
    Created on : 06-03-2018, 03:14:16 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.materia != '' and param.profesor !=''}">
    <sql:query var="listadoGrados" dataSource="jdbc/cra">
        SELECT *
        FROM grado AS g
        WHERE NOT EXISTS (SELECT *
        FROM profesorgradomateria AS pgm 
        WHERE g.cod_grado = pgm.cod_grado
        AND pgm.cod_materia = ?
        AND pgm.carnet_profesor = ?)
        <sql:param value="${param.materia}"/>
        <sql:param value="${param.profesor}"/>
    </sql:query>
</c:if>

<select name="grado" required>
    
    <c:if test="${listadoGrados.rowCount > 0}">
        <option value="">--Seleccione una opción--</option>
        <c:forEach var="grado" items="${listadoGrados.rows}">
            <option value="${grado.cod_grado}">${grado.grado}</option>  
        </c:forEach>
    </c:if>    
</select>


