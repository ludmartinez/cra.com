<%-- 
    Document   : index
    Created on : 05-26-2018, 11:14:46 PM
    Author     : ACP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../WEB-INF/jspf/header.jspf" %>


<section class="container py-4">
    <h3 class="text-center"> Materias Impartidas </h3>
    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Materia 1
                    </button>
                </h5>
            </div>

            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                    <h4 class="text-center"> Cursos </h4>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action"> Grado 1.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 2.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 3.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 4.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 5.</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Materia 2
                    </button>
                </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                    <h4 class="text-center"> Cursos </h4>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action"> Grado 1.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 2.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 3.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 4.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 5.</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingThree">
                    <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Materia 3
                        </button>
                    </h5>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                    <div class="card-body">
                        <h4 class="text-center"> Cursos </h4>
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action"> Grado 1.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 2.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 3.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 4.</a>
                        <a href="#" class="list-group-item list-group-item-action"> Grado 5.</a>
                    </div>
                </div>
            </div>
        </div>
</section>

<%@include file="../WEB-INF/jspf/footer.jspf" %>

