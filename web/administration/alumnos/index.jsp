<%-- 
    Document   : index
    Created on : 05-14-2018, 05:35:59 PM
    Author     : ludie
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:transaction dataSource="jdbc/cra">
    <sql:query var="listadoAlumnos">
        SELECT 
        a.carnet, a.nie, a.fotografia, a.nombre1, a.nombre2, a.nombre3, a.apellidoPaterno, a.apellidoMaterno, a.sexo, a.fechaNacimiento, a.lugarNacimiento, a.fechaIngreso,
        d.cod_direccion, d.id_departamento, d.id_municipio, d.direccion
        FROM alumno AS a
        INNER JOIN direccion AS d
        ON a.carnet = d.carnet
        WHERE a.estado = 1
    </sql:query>
    <sql:query var="listadoDepartamentos">
        SELECT *
        FROM departamento
    </sql:query>
</sql:transaction>
<%@include file="../../WEB-INF/jspf/header.jspf" %>
<script src="js/alumnosadmin.js"></script>
<section class="container">
    <form class="row my-4 mx-0">
        <input class="form-control col-8" type="search" placeholder="Buscar" aria-label="Buscar">
        <button class="btn btn-success col" type="button" onclick="indicadorAgregar()" data-toggle="modal" data-target="#formMto">Agregar</button> 
    </form>                                    
    <div class="row my-4">
        <div class="col">
            <c:choose>
                <c:when test="${listadoAlumnos.rowCount > 0}">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Carnet</th>
                                    <th scope="col">NIE</th>
                                    <th scope="col">Apellidos</th>
                                    <th scope="col">Nombres</th>
                                    <th scope="col">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="contador" value="1"/>
                                <c:forEach var="alumno" items="${listadoAlumnos.rows}">
                                    <tr>
                                        <th scope="row">${contador}</th>
                                        <td>${alumno.carnet}</td>
                                        <td>${alumno.nie}</td>
                                        <td>${alumno.apellidoPaterno} ${alumno.apellidoMaterno}</td>
                                        <td>${alumno.nombre1} ${alumno.nombre2} ${alumno.nombre3}</td>
                                        <td>
                                            <a onclick="indicadorEditar('${alumno.carnet}', '${alumno.nie}', '${alumno.nombre1}', '${alumno.nombre2}', '${alumno.nombre3}', '${alumno.apellidoPaterno}', '${alumno.apellidoMaterno}', '${alumno.sexo}', '${alumno.fechaNacimiento}', '${alumno.lugarNacimiento}', '${alumno.id_departamento}', '${alumno.id_municipio}', '${alumno.direccion}')" 
                                               class="btn btn-warning" data-toggle="modal" data-target="#formMto">
                                                <i class="fas fa-edit"></i>
                                            </a> 
                                            <a class="btn btn-danger" onclick="indicadorBanear('${alumno.carnet}', '${alumno.nombre1}', '${alumno.apellidoPaterno}')" data-toggle="modal" data-target="#modalEliminar">
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
<section class="modal fade" id="formMto" tabindex="-1" role="dialog" aria-labelledby="modalMtoAlumno" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalMtoAlumno">Agregar Alumno</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="row needs-validation" name="formAlumno" id="formAlumno" method="post" action="actions/agregarAlumnoDB.jsp" novalidate>
                    <input type="hidden" id="opIndicator" class="d-none" name="op" value="1"/>
                    <input type="hidden" id="cmbIndicator" class="d-none" name="cmb"/>
                    <div class="col-12 col-md-6 col-lg-4">
                        <img class="card-img-top w-100" src="../../img/default-user-image.png" alt="Card image cap">
                        <input type="file" class="form-control" id="fileImagen" placeholder="Alguien...">
                    </div>
                    <div class="col-12 col-md-6 col-lg-8">
                        <div class="row">
                            <div class="form-group col-12 col-md d-none" id="cntcont">
                                <label for="cnt">Carnet</label>
                                <input type="text" name="cnt" class="form-control" id="cnt" readonly>
                            </div>
                            <div class="form-group col-12 col-md-6">
                                <label for="nie">NIE:</label>
                                <input type="number" name="nie" class="form-control" id="nie" placeholder="123..." value="" required>
                                <div class="invalid-feedback">
                                    Ingrese el número de NIE
                                </div>
                            </div>    
                            <div class="w-100"></div>
                            <div class="form-group col-12 col-lg-6">
                                <label for="nombre1">Primer nombre:</label>
                                <input type="text" class="form-control" name="nombre1" id="nombre1" placeholder="Alguien..." required>
                                <div class="invalid-feedback">
                                    Ingrese un nombre válido
                                </div>
                            </div>
                            <div class="form-group col-12 col-lg-6">
                                <label for="nombre2">Segundo nombre:</label>
                                <input type="text" class="form-control" name="nombre2" id="nombre2" placeholder="Alguien...">
                                <div class="invalid-feedback">
                                    Ingrese un nombre válido
                                </div>
                            </div>
                            <div class="form-group col-12 col-lg-6">
                                <label for="nombre3">Tercer nombre:</label>
                                <input type="text" class="form-control" name="nombre3" id="nombre3" placeholder="Alguien...">
                                <div class="invalid-feedback">
                                    Ingrese un nombre válido
                                </div>
                            </div>                                    
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
                    <div class="form-group col-12 col-md col-lg-12">
                        <label for="lugarNac">Lugar de nacimiento:</label>
                        <input type="text" class="form-control" name="lugarNac" id="lugarNac" placeholder="Un lugar..." required> 
                        <div class="invalid-feedback">
                            Ingrese un lugar
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
                    <input type="hidden" name="csel" id="csel"/>
                    <div class="form-group col-12 col-md">
                        <input type="hidden" name="munsel" id="munsel">
                        <label for="slcMunicipio">Municipio:</label>
                        <select class="form-control" name="municipio" id="slcMunicipio" onchange="ciudadesLoad()"  required>
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
                ¿Está seguro que desea dar de baja el alumno <b id="labelAlumno"></b>?
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
        $.post("actions/comboList.jsp", $("#formAlumno").serialize(), function (data) {
            $("#slcMunicipio").html(data);
        });
    }
</script>
<%@include file="../../WEB-INF/jspf/footer.jspf" %>