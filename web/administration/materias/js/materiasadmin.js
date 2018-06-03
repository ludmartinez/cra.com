/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function agregar() {
    document.getElementById("lblModalMto").innerHTML = "Agregar Materia";
    document.getElementById("btnsubmit").innerHTML = "Agregar";
    document.getElementById("btnsubmit").classList.add("btn-primary");
    document.getElementById("btnsubmit").classList.remove("btn-warning");
    document.getElementById("opIndicator").value = 1;
    resetear();
}
function resetear() {
    //Reiniciando valores
    document.getElementById("codigo").value = "";
    document.getElementById("nombre").value = "";
}
function editar(codigo, nombre) {
    document.getElementById("lblModalMto").innerHTML = "Editar Materia";
    document.getElementById("btnsubmit").innerHTML = "Editar";
    document.getElementById("btnsubmit").classList.add("btn-warning");
    document.getElementById("btnsubmit").classList.remove("btn-primary");
    document.getElementById("opIndicator").value = 2;
    //asignando valores
    document.getElementById("codigo").value = codigo;
    document.getElementById("nombre").value = nombre;
}
function indicadorBanear(codigo, nombre) {
    document.getElementById("opIndicator").value = 3;
    //asignando valores
    document.getElementById("codigo").value = codigo;
    document.getElementById("labelMateria").innerHTML = nombre;
}

function banear() {
    document.getElementById("formMto").submit();
}