<%-- 
    Document   : comboList
    Created on : 05-20-2018, 03:32:48 PM
    Author     : ludie-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${param.cmb == '1'}">
    <sql:query var="listadoMunicipios" dataSource="jdbc/cra">
        SELECT *
        FROM municipio
        WHERE id_departamento = ?
        <sql:param value="${param.departamento}"/>
    </sql:query>
    <select name="municipio" >
        <option value="">--Seleccione una opción--</option>
        <c:if test="${listadoMunicipios.rowCount > 0}">
            <c:forEach var="municipio" items="${listadoMunicipios.rows}">
                <option value="${municipio.id_municipio}" <c:if test="${municipio.id_municipio == param.munsel}"><c:out value="selected"/></c:if>>${municipio.nombre}</option>  
            </c:forEach>
        </c:if>    
    </select>

</c:if>

