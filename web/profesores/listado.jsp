<%-- 
    Document   : listado
    Created on : 05-27-2018, 02:18:34 AM
    Author     : ACP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../WEB-INF/jspf/header.jspf" %>
<section class="container py-4">
    <div class="row">
        <div class="form-group col-12">
            <label for="slcEvaluacion">Evaluación:</label>
            <select class="form-control" id="slcEvaluacion">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
    </div>
</section>
<section class="container py-4">
      <div class="row justify-content-center">
<div class="card">
  <div class="card-header">
    Descripción de la Materia:
  </div>
  <div class="card-body">
    <blockquote class="blockquote mb-0">
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
    </blockquote>
  </div>
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
    <tr>
      <th scope="row"></th>
      <td class="p-0"></td>
      <td class="p-0"></td>
      <td class="p-0"><input type="number" value="0" class="form-control border-0"></td>
    </tr>
   
  </tbody>
  </table>
</div>
</section>
<section class="container py-4">
<button type="button" class="btn btn-primary btn-lg btn-block">Calificar</button>
</section>
<%@include file="../WEB-INF/jspf/footer.jspf" %>