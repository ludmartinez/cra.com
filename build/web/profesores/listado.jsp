<%-- 
    Document   : listado
    Created on : 05-27-2018, 02:18:34 AM
    Author     : ACP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:transaction dataSource="jdbc/cra">
    <sql:query var="listadogrado">
        SELECT a.carnet, a.nombre1, a.nombre2, a.nombre3, a.apellidoPaterno, a.apellidoMaterno
        FROM matricula AS m
        INNER JOIN alumno AS a 
        on m.carnet_alumno = a.carnet
        INNER JOIN grado AS g 
        ON m.cod_grado = g.cod_grado
        WHERE m.cod_grado = ? AND a.estado = 1
        <sql:param value="${param.g}"/>
    </sql:query>
    <sql:query var="listadoevaluaciones">
        SELECT ev.cod_evaluacion, ev.titulo, ev.descripcion, ev.ponderacion
        FROM evaluacion AS ev
        INNER JOIN materia AS m
        ON ev.cod_materia = m.cod_materia
        WHERE ev.cod_materia = ? AND ev.cod_grado = ?
        <sql:param value="${param.m}"/>
        <sql:param value="${param.g}"/>
    </sql:query>
</sql:transaction>

<c:set var="target" value="profesores"/>
<%@include file="../WEB-INF/jspf/header.jspf" %>
<script src="js/profesor.js"></script>
<section class="container py-4">
    <div class="row">
        <div class="form-group col-12">
            <label for="slcEvaluacion">Evaluación:</label>
            <select class="form-control" id="slcEvaluacion" onchange="pasardatos()">
                <option value="">--Selecciones una opción--</option>
                <c:choose>
                    <c:when test="${listadoevaluaciones.rowCount > 0}">
                        <c:forEach var="evaluaciones" items="${listadoevaluaciones.rows}">
                            <option value="${evaluaciones.cod_evaluacion}">${evaluaciones.titulo}</option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option>Error</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </div>
    </div>
</section>
<section class="container py-4">
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">#Carnet</th>
                    <th scope="col">Nombre del Alumno</th>
                    <th scope="col">Nota: </th>

                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${listadogrado.rowCount > 0}">
                        <c:set var="contador" value="0"/>
                        <c:forEach var="alumno" items="${listadogrado.rows}">
                            <c:set var="contador" value="${contador + 1}"/>
                            <tr>
                                <th scope="row">${contador}</th>
                                <td>${alumno.carnet}</td>
                                <td>${alumno.nombre1} ${alumno.nombre2} ${alumno.nombre3} ${alumno.apellidoPaterno} ${alumno.apellidoMaterno}</td>
                                <td>
                                    <form method="get" class="form-inline" name="frmnota${contador}" action="actions/notas.jsp?grado=${contador}&materia=${param.m}&alumno=${alumno.carnet}">
                                        <input type="hidden" id="evaluacion" name="evaluacion" value="">
                                        <input type="number" id="nota" name="nota" class="form-control" required>
                                        <button type="submit" class="btn btn-success"><i class="fas fa-check"></i></button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>


            </tbody>
        </table>
    </div>
</section>
<section class="container py-4">
    <button type="button" class="btn btn-primary btn-lg btn-block">Calificar</button>
</section>
<%@include file="../WEB-INF/jspf/footer.jspf" %>