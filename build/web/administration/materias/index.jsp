<%-- 
    Document   : index
    Created on : 05-27-2018, 10:07:19 AM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../WEB-INF/jspf/header.jspf" %>
<section class="container py-4">
    <h3 class="text-center">Listado Materias</h3>
    <div class="row no-gutters">
        <div class="col-12">
            <input class="form-control" type="text" placeholder="Buscar materia...">
        </div>

        <div class="col-12 col-md-3 mt-4 ml-auto">
            <a class="btn btn-success btn-block text-white" data-toggle="modal" data-target="#modalMto"><i class="fas fa-plus-square"></i> Agregar</a>
        </div>
        <div class="col-12">
            <table class="table table-responsive-sm table-striped table-hover mt-4">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Codigo</th>
                        <th scope="col">Materia</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>
                            <a class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                            <a class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>        
    </div>
</section>

<!-- Modal -->
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
                <form>
                    <div class="form-group">
                        <label for="codigo">Codigo Materia</label>
                        <input type="text" class="form-control" id="codigo" aria-describedby="codigoHelp" placeholder="Ejemplo: CSMB">
                        <small id="codigoHelp" class="form-text text-muted">Ingrese un código de 4 caracteres que identifique la materia.</small>
                    </div>
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" placeholder="Ejemplo: Ciencias Salud y Medio Ambiente">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-block btn-primary">Agregar</button>
                    </div>
                </form>
            </div>            
        </div>
    </div>
</section>
<%@include file="../../WEB-INF/jspf/footer.jspf" %>