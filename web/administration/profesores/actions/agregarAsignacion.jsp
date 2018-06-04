<%-- 
    Document   : agregarAsignacion
    Created on : 06-03-2018, 10:22:19 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
    <c:when test="${param.materia != '' and param.grado != '' and param.profesor != ''}">
        <c:catch var="exception">
            <sql:update var="addasignation" dataSource="jdbc/cra">
                INSERT INTO profesorgradomateria(
                carnet_profesor, cod_grado, cod_materia)
                VALUES (?, ?, ?)
                <sql:param value="${param.profesor}"/>
                <sql:param value="${param.grado}"/>
                <sql:param value="${param.materia}"/>
            </sql:update>
            <form name="dalert">
                <div class="alert alert-success alert-dismissible fade show col" role="alert">
                    <strong>¡Éxito!</strong> Asignación realizada correctamente.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </form>        
        </c:catch>
        <c:if test="${exception != null}">
            <form name="dalert">
                <div class="alert alert-danger alert-dismissible fade show col" role="alert">
                    <strong>¡Error!</strong> No pudo agregarse la asignación.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </form>
        </c:if>
    </c:when>
        <c:when test="${param.materia == '' or param.grado == '' or param.profesor == ''}">
            <form name="dalert">
                <div class="alert alert-warning alert-dismissible fade show col" role="alert">
                    <strong>¡Advertencia!</strong> Faltan datos para agregar.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </form>
        </c:when>
</c:choose>


