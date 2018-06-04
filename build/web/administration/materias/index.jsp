<%-- 
    Document   : index
    Created on : 05-27-2018, 10:07:19 AM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="listadoMaterias" dataSource="jdbc/cra">
    SELECT *
    FROM materia
    WHERE estado = 1
</sql:query>

<c:set var="target" value="administration"/>
<%@include file="../../WEB-INF/jspf/header.jspf" %>
<script src="js/materiasadmin.js"></script>
<c:set var="cantador" value="0"/>
<section class="container py-4">
    <h3 class="text-center">Listado Materias</h3>
    <div class="row no-gutters">
        <div class="col-12">
            <input class="form-control" type="text" placeholder="Buscar materia...">
        </div>

        <div class="col-12 col-md-3 mt-4 ml-auto">
            <a class="btn btn-success btn-block text-white" data-toggle="modal" data-target="#modalMto" onclick="agregar()"><i class="fas fa-plus-square"></i> Agregar</a>
        </div>
        <div class="col-12">
            <table class="table table-responsive-sm table-striped table-hover mt-4">
                <thead                    
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Codigo</th>
                        <th scope="col">Materia</th>
                        <th scope="col">Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${listadoMaterias.rowCount >0}">
                            <c:forEach var="materia" items="${listadoMaterias.rows}">
                                <c:set var="contador" value="${contador + 1}"/>
                                <tr>
                                    <th scope="row"><c:out value="${contador}"/></th>
                                    <td><c:out value="${materia.cod_materia}"/></td>
                                    <td><c:out value="${materia.nombre}"/></td>
                                    <td>
                                        <a class="btn btn-sm btn-warning" onclick="editar('${materia.cod_materia}', '${materia.nombre}')" data-toggle="modal" data-target="#modalMto"><i class="fas fa-edit"></i></a>
                                        <a class="btn btn-sm btn-danger" onclick="indicadorBanear('${materia.cod_materia}', '${materia.nombre}')" data-toggle="modal" data-target="#modalEliminar"><i class="fas fa-trash"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                        <p class="alert alert-info" role="alert">
                            No hay ningún alumno registrado
                        </p>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>        
    </div>
</section>

<!-- Modal mantenimiento -->
<section class="modal fade" id="modalMto" tabindex="-1" role="dialog" aria-labelledby="lblModalMto" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="lblModalMto">Agregar Materia</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formMto" method="post" action="actions/mtoMaterias.jsp">
                    <input type="hidden" name="op" id="opIndicator">
                    <div class="form-group">
                        <label for="codigo">Codigo Materia</label>
                        <input type="text" class="form-control" name="codigo" id="codigo" aria-describedby="codigoHelp" placeholder="Ejemplo: CSMB">
                        <small id="codigoHelp" class="form-text text-muted">Ingrese un código de 4 caracteres que identifique la materia.</small>
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ejemplo: Ciencias Salud y Medio Ambiente">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="btnsubmit" class="btn btn-block btn-primary">Agregar</button>
                    </div>
                </form>
            </div>            
        </div>
    </div>
</section>

<!-- Modal Advertencia eliminar -->
<section class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEliminarLabel">ADVERTENCIA</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Está seguro que desea dar de baja la materia <b id="labelMateria"></b>?
            </div>
            <div class="modal-footer">                        
                <button type="button" class="btn btn-danger" onclick="banear()">Si</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">no</button>
            </div>
        </div>
    </div>
</section>
<%@include file="../../WEB-INF/jspf/footer.jspf" %>