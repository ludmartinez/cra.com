<%-- 
    Document   : index
    Created on : 05-23-2018, 07:21:42 PM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:transaction dataSource="jdbc/cra">
    <sql:query var="listadoProfesores">
        SELECT 
        p.carnet, p.dui, p.nit, p.nombre1, p.nombre2, p.nombre3, p.apellidoPaterno, p.apellidoMaterno, p.sexo, p.fechaNacimiento,
        d.cod_direccion, d.id_departamento, d.id_municipio, d.direccion
        FROM profesor AS p
        INNER JOIN direccion AS d
        ON p.carnet = d.carnet_profesor
        WHERE p.estado = 1
    </sql:query>
    <sql:query var="listadoDepartamentos">
        SELECT *
        FROM departamento
    </sql:query>
</sql:transaction>

<%@include file="../../WEB-INF/jspf/header.jspf" %>
<script src="js/profesoresadmin.js"></script>

<section class="container">
    <form class="row my-4 mx-0">
        <input class="form-control col-8" type="search" placeholder="Buscar" aria-label="Buscar">
        <button class="btn btn-success col" type="button" onclick="indicadorAgregar()" data-toggle="modal" data-target="#formMto">Agregar</button> 
    </form>                                    
    <div class="row my-4">
        <div class="col">
            <c:choose>
                <c:when test="${listadoProfesores.rowCount > 0}">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Carnet</th>
                                    <th scope="col">DUI</th>
                                    <th scope="col">Apellidos</th>
                                    <th scope="col">Nombres</th>
                                    <th scope="col">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="contador" value="1"/>
                                <c:forEach var="profesor" items="${listadoProfesores.rows}">
                                    <tr>
                                        <th scope="row">${contador}</th>
                                        <td>${profesor.carnet}</td>
                                        <td>${profesor.dui}</td>
                                        <td>${profesor.apellidoPaterno} ${profesor.apellidoMaterno}</td>
                                        <td>${profesor.nombre1} ${profesor.nombre2} ${profesor.nombre3}</td>
                                        <td>
                                            <a onclick="indicadorEditar('${profesor.carnet}', '${profesor.dui}', '${profesor.nit}', '${profesor.nombre1}', '${profesor.nombre2}', '${profesor.nombre3}', '${profesor.apellidoPaterno}', '${profesor.apellidoMaterno}', '${profesor.sexo}', '${profesor.fechaNacimiento}', '${profesor.id_departamento}', '${profesor.id_municipio}', '${profesor.direccion}')" 
                                               class="btn btn-warning" data-toggle="modal" data-target="#formMto">
                                                <i class="fas fa-edit"></i>
                                            </a> 
                                            <a class="btn btn-danger" onclick="indicadorBanear('${profesor.carnet}', '${profesor.nombre1}', '${profesor.apellidoPaterno}')" data-toggle="modal" data-target="#modalEliminar">
                                                <i class="fas fa-ban"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <c:set var="contador" value="${contador+1}"/>
                                </c:forEach>                                
                            </tbody>
                        </table>
                    </div>
                </c:when> 
                <c:otherwise>
                    <p class="alert alert-info" role="alert">
                        No hay ningún alumno registrado
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>

<!-- Modal formulario de mantenimientos-->
<section class="modal fade" id="formMto" tabindex="-1" role="dialog" aria-labelledby="modalMtoProfesor" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalMtoProfesor">Agregar Profesor</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="row needs-validation" name="formProfesor" id="formProfesor" method="post" action="actions/agregarProfesorDB.jsp" novalidate>
                    <input type="hidden" id="opIndicator" class="d-none" name="op" value="1"/>
                    <input type="hidden" id="cmbIndicator" class="d-none" name="cmb"/>
                    <div class="form-group col-12 col-md-6 d-none" id="cntcont">
                        <label for="cnt">Carnet</label>
                        <input type="text" name="cnt" class="form-control" id="cnt" readonly>
                    </div>
                    <div class="w-100"></div>
                    <div class="form-group col-12 col-md-6">
                        <label for="nie">DUI:</label>
                        <input type="number" name="dui" class="form-control" id="dui" placeholder="123..." value="" required>
                        <div class="invalid-feedback">
                            Ingrese el número de DUI
                        </div>
                    </div> 
                    <div class="form-group col-12 col-md-6">
                        <label for="nie">NIT:</label>
                        <input type="number" name="nit" class="form-control" id="nit" placeholder="123..." value="" required>
                        <div class="invalid-feedback">
                            Ingrese el número de NIT
                        </div>
                    </div> 
                    <div class="w-100"></div>
                    <div class="form-group col-12 col-lg">
                        <label for="nombre1">Primer nombre:</label>
                        <input type="text" class="form-control" name="nombre1" id="nombre1" placeholder="Alguien..." required>
                        <div class="invalid-feedback">
                            Ingrese un nombre válido
                        </div>
                    </div>
                    <div class="form-group col-12 col-lg">
                        <label for="nombre2">Segundo nombre:</label>
                        <input type="text" class="form-control" name="nombre2" id="nombre2" placeholder="Alguien...">
                        <div class="invalid-feedback">
                            Ingrese un nombre válido
                        </div>
                    </div>
                    <div class="form-group col-12 col-lg">
                        <label for="nombre3">Tercer nombre:</label>
                        <input type="text" class="form-control" name="nombre3" id="nombre3" placeholder="Alguien...">
                        <div class="invalid-feedback">
                            Ingrese un nombre válido
                        </div>
                    </div>                                    

                    <div class="col-12 col-md-12">
                        <div class="row">
                            <div class="form-group col-12 col-md-6">
                                <label for="apellidopaterno">Apellido paterno:</label>
                                <input type="text" class="form-control" name="apellidoP" id="apellidopaterno" placeholder="Alguien..." required>
                                <div class="invalid-feedback">
                                    Ingrese un apellido válido
                                </div>
                            </div>
                            <div class="form-group col-12 col-md">
                                <label for="apellidomaterno">Apellido materno:</label>
                                <input type="text" class="form-control" name="apellidoM" id="apellidomaterno" placeholder="Alguien..." required>
                                <div class="invalid-feedback">
                                    Ingrese un apellido válido
                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="w-100"></div>
                    <div class="form-group col-12 col-md-4 col-lg-4">
                        <label for="slcSexo">Sexo:</label>
                        <select class="form-control" name="s" id="slcSexo">
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>
                    <div class="form-group col-12 col-md-8 col-lg-8">
                        <label for="dtNacimiento">Fecha de nacimiento:</label>
                        <input type="date" class="form-control" name="fechaNac" id="dtNacimiento" required>
                        <div class="invalid-feedback">
                            Ingrese una fecha válida
                        </div>
                    </div>
                    <div class="form-group col-12 col-md">                                
                        <label for="slcDepartamento">Departamento:</label>
                        <select class="form-control" name="departamento" id="slcDepartamento" onchange="municipiosLoad()" required>
                            <option value="" selected="selected">--Seleccione una opción--</option>
                            <c:if test="${listadoDepartamentos.rowCount>0}">
                                <c:forEach var="departamento" items="${listadoDepartamentos.rows}">
                                    <option value="${departamento.id_departamento}">${departamento.nombre}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <input type="hidden" name="msel" id="msel"/>
                    <div class="form-group col-12 col-md">
                        <input type="hidden" name="munsel" id="munsel">
                        <label for="slcMunicipio">Municipio:</label>
                        <select class="form-control" name="municipio" id="slcMunicipio"  required>
                            <option value="" selected="selected">--Seleccione una opción--</option>
                        </select>
                    </div>
                    <div class="form-group col-12">
                        <label for="txtdireccion">Dirección:</label>
                        <input type="text" class="form-control" name="direccion" id="txtdireccion" placeholder="Un lugar..." required> 
                        <div class="invalid-feedback">
                            Ingrese una dirección
                        </div>
                    </div>
                    <div class="modal-footer col-12">
                        <button type="submit" class="btn btn-block btn-primary" id="btnsubmit">Agregar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>| 
</section>

<!-- Modal Advertencia eliminar -->
<section class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="modalEliminarLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEliminarLabel">ADVERTENCIA</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ¿Está seguro que desea dar de baja al profesor <b id="labelProfesor"></b>?
            </div>
            <div class="modal-footer">                        
                <button type="button" class="btn btn-danger" onclick="banearAlumno()">Si</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">no</button>
            </div>
        </div>
    </div>
</section>

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();

    function municipiosLoad() {
        $("#cmbIndicator").val("1");
        $.post("../actions/comboList.jsp", $("#formProfesor").serialize(), function (data) {
            $("#slcMunicipio").html(data);
        });
    }
</script>

<%@include file="../../WEB-INF/jspf/footer.jspf" %>
