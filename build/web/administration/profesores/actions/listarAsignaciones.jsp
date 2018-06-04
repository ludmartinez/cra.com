<%-- 
    Document   : listarAsignaciones
    Created on : 06-03-2018, 07:24:28 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${param.profesor != ''}">
    <sql:query var="asignacionprof" dataSource="jdbc/cra">
        SELECT DISTINCTROW m.nombre, m.cod_materia 
        FROM profesorgradomateria AS pgm
        INNER JOIN materia AS m
        ON pgm.cod_materia = m.cod_materia
        WHERE pgm.carnet_profesor = ?
        <sql:param value="${param.profesor}"/>
    </sql:query>
</c:if>

<form class="accordion" name="accordionMaterias">
    <c:choose>
        <c:when test="${asignacionprof.rowCount > 0}">
            <c:set var="contador" value="0"/>
            <c:forEach var="materias" items="${asignacionprof.rows}">
                <c:set var="contador" value="${contador + 1}"/>
                <div class="card">
                    <div class="card-header" id="heading${contador}">
                        <h5 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse${contador}" aria-expanded="true" aria-controls="collapse${contador}">
                                ${materias.nombre}
                            </button>
                        </h5>
                    </div>
                    <div id="collapse${contador}" class="collapse" aria-labelledby="heading${contador}" data-parent="#accordionMaterias">
                        <div class="card-body">
                            <h4 class="text-center"> Cursos </h4>
                            <div class="list-group">
                                <sql:query var="cursosmateria" dataSource="jdbc/cra">
                                    SELECT g.grado, g.cod_grado
                                    FROM profesorgradomateria AS pgm
                                    INNER JOIN grado AS g 
                                    ON pgm.cod_grado = g.cod_grado
                                    WHERE pgm.carnet_profesor = ? AND pgm.cod_materia = ?
                                    <sql:param value="${param.profesor}"/>
                                    <sql:param value="${materias.cod_materia}"/>                                        
                                </sql:query>
                                <c:choose>
                                    <c:when test="${cursosmateria.rowCount > 0}">
                                        <c:forEach var="grados" items="${cursosmateria.rows}">
                                            <a href="#" class="list-group-item list-group-item-action">${grados.grado} Grado</a>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p class="alert alert-info" role="alert">No hay datos</p>
        </c:otherwise>
    </c:choose>
</form>