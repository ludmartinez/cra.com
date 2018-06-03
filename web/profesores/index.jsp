<%-- 
    Document   : index
    Created on : 05-26-2018, 11:14:46 PM
    Author     : ACP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../WEB-INF/jspf/header.jspf" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="asignacionprof" dataSource="jdbc/cra">
    SELECT DISTINCTROW m.nombre, m.cod_materia 
    FROM profesorgradomateria AS pgm
    INNER JOIN materia AS m
    ON pgm.cod_materia = m.cod_materia
    WHERE pgm.carnet_profesor = ?
    <sql:param value="${sessionScope.id_user}"/>
</sql:query>

<section class="container py-4">
    <h3 class="text-center"> Materias Impartidas ${sessionScope.id_user}</h3>
    <div class="accordion" id="accordionMaterias">
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
                                        <sql:param value="${sessionScope.id_user}"/>
                                        <sql:param value="${materias.cod_materia}"/>                                        
                                    </sql:query>
                                        <c:choose>
                                            <c:when test="${cursosmateria.rowCount > 0}">
                                                <c:forEach var="grados" items="${cursosmateria.rows}">
                                                    <a href="listado.jsp?m=${materias.cod_materia}&g=${grados.cod_grado}" class="list-group-item list-group-item-action">${grados.grado} Grado</a>
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
                No hay datos
            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@include file="../WEB-INF/jspf/footer.jspf" %>

