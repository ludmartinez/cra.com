function indicadorAgregar() {
    document.getElementById("modalMtoAlumno").innerHTML = "Agregar Alumno";
    document.getElementById("btnsubmit").innerHTML = "Agregar";
    document.getElementById("btnsubmit").classList.add("btn-primary");
    document.getElementById("btnsubmit").classList.remove("btn-warning");
    document.getElementById("opIndicator").value = 1;
    document.getElementById("cntcont").classList.add("d-none");
    resetear();    
}
function resetear(){
    //Reiniciando valores
    document.getElementById("cnt").value = "";
    document.getElementById("nie").value = "";
    document.getElementById("nombre1").value = "";
    document.getElementById("nombre2").value = "";
    document.getElementById("nombre3").value = "";
    document.getElementById("apellidopaterno").value = "";
    document.getElementById("apellidomaterno").value = "";
    document.getElementById("slcSexo").value = "M";
    document.getElementById("dtNacimiento").value = "";
    document.getElementById("lugarNac").value = "";
    document.getElementById("slcDepartamento").value = "";
    document.getElementById("slcMunicipio").value = "";
    document.getElementById("txtdireccion").value = "";
    document.getElementById("munsel").value = "";
    municipiosLoad();
}
function indicadorEditar(carnet, nie, n1, n2, n3, ap, am, s, fn, ln, dp, mn, di) {
    document.getElementById("modalMtoAlumno").innerHTML = "Editar Alumno";
    document.getElementById("btnsubmit").innerHTML = "Editar";
    document.getElementById("btnsubmit").classList.remove("btn-primary");
    document.getElementById("btnsubmit").classList.add("btn-warning");
    document.getElementById("opIndicator").value = 2;
    document.getElementById("cntcont").classList.remove("d-none");
    //asignando valores
    document.getElementById("cnt").value = carnet;
    document.getElementById("nie").value = nie;
    document.getElementById("nombre1").value = n1;
    document.getElementById("nombre2").value = n2;
    document.getElementById("nombre3").value = n3;
    document.getElementById("apellidopaterno").value = ap;
    document.getElementById("apellidomaterno").value = am;
    document.getElementById("slcSexo").value = s;
    document.getElementById("dtNacimiento").value = fn;
    document.getElementById("lugarNac").value = ln;        
    document.getElementById("slcDepartamento").value = dp;
    document.getElementById("txtdireccion").value = di;
    document.getElementById("munsel").value = mn;
    municipiosLoad();
}
