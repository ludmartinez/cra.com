
function indicadorAgregar() {
    document.getElementById("modalMtoProfesor").innerHTML = "Agregar Profesor";
    document.getElementById("btnsubmit").innerHTML = "Agregar";
    document.getElementById("btnsubmit").classList.add("btn-primary");
    document.getElementById("btnsubmit").classList.remove("btn-warning");
    document.getElementById("opIndicator").value = 1;
    document.getElementById("cntcont").classList.add("d-none");
    document.getElementById("ProfTabNav").classList.add("d-none");
    document.getElementById("informacion-tab").click();
    resetear();
}
function resetear() {
    //Reiniciando valores
    document.getElementById("cnt").value = "";
    document.getElementById("dui").value = "";
    document.getElementById("nit").value = "";
    document.getElementById("nombre1").value = "";
    document.getElementById("nombre2").value = "";
    document.getElementById("nombre3").value = "";
    document.getElementById("apellidopaterno").value = "";
    document.getElementById("apellidomaterno").value = "";
    document.getElementById("slcSexo").value = "M";
    document.getElementById("dtNacimiento").value = "";
    document.getElementById("slcDepartamento").value = "";
    document.getElementById("slcMunicipio").value = "";
    document.getElementById("txtdireccion").value = "";
    document.getElementById("munsel").value = "";
    document.getElementById("inpProfesores").value = "";
    municipiosLoad();
}
function indicadorEditar(carnet, dui, nit, n1, n2, n3, ap, am, s, fn, dp, mn, di) {
    document.getElementById("modalMtoProfesor").innerHTML = "Editar Profesor";
    document.getElementById("btnsubmit").innerHTML = "Editar";
    document.getElementById("btnsubmit").classList.remove("btn-primary");
    document.getElementById("btnsubmit").classList.add("btn-warning");
    document.getElementById("opIndicator").value = 2;
    document.getElementById("cntcont").classList.remove("d-none");
    document.getElementById("ProfTabNav").classList.remove("d-none");
    document.getElementById("informacion-tab").click();
    //asignando valores
    document.getElementById("cnt").value = carnet;
    document.getElementById("dui").value = dui;
    document.getElementById("nit").value = nit;
    document.getElementById("nombre1").value = n1;
    document.getElementById("nombre2").value = n2;
    document.getElementById("nombre3").value = n3;
    document.getElementById("apellidopaterno").value = ap;
    document.getElementById("apellidomaterno").value = am;
    document.getElementById("slcSexo").value = s;
    document.getElementById("dtNacimiento").value = fn;
    document.getElementById("slcDepartamento").value = dp;
    document.getElementById("txtdireccion").value = di;
    document.getElementById("munsel").value = mn;
    document.getElementById("slcMateria").value = "";
    document.getElementById("inpProfesores").value = carnet;    
    municipiosLoad();
    gradosLoad();
    listadosAsignacionesLoad();
}
function indicadorBanear(carnet, nombre1, apellidoP) {
    document.getElementById("opIndicator").value = 3;
    //asignando valores
    document.getElementById("cnt").value = carnet;
    document.getElementById("labelProfesor").innerHTML = nombre1 + " " + apellidoP;
}

function banearAlumno() {
    document.getElementById("formProfesor").submit();
}
