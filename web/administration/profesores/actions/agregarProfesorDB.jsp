<%-- 
    Document   : agregarProfesorDB
    Created on : 05-27-2018, 12:35:28 AM
    Author     : ludie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${param.dui != null && param.nombre1 != '' && 
              param.apellidoP != '' && param.apellidoM != ''
              && param.s != '' && param.fechaNac !='' && 
              param.departamento != '' && param.municipio !='' && 
              param.direccion != ''}">

      <% /* OBTENIENDO CARNET */ %>

      <% /*Consultando existencia de carnet*/ %>
      <sql:query var="cuentaCarnet" dataSource="jdbc/cra">
          SELECT MAX(carnet) AS maximo FROM profesor
          WHERE carnet LIKE ?
          <sql:param value="${fn:substring(param.apellidoP,0,1)}${fn:substring(param.apellidoM,0,1)}%"/>
      </sql:query>
      <% /*Asignando correlativo*/ %>
      <c:set var="correlativo" value="${fn:substring(cuentaCarnet.rows[0].maximo,2,6)}"/>
      <c:set var="cadcorrelativo"></c:set>
      <c:if test="${correlativo>=0}">
          <c:set var="correlativo" value="${correlativo+1}"/>        
          <c:set var="cadcorrelativo">${correlativo}</c:set>
          <c:forEach var="i" begin="0" end="3">
              <c:if test="${fn:length(cadcorrelativo)<4}">
                  <c:set var="cadcorrelativo" value="0${cadcorrelativo}"/>  
              </c:if>
              <c:if test="${fn:length(cadcorrelativo)==4}">
                  <c:set var="cadcorrelativo" value="${cadcorrelativo}"/>  
              </c:if> 
          </c:forEach>
      </c:if>
      <% /*Asignando correlativo de año*/ %>
      <jsp:useBean id="now" class="java.util.Date" />
      <fmt:formatDate var="currentyear" value="${now}" pattern="yy" />
      <% /*Asignando valor a carnet*/%>
      <c:set var="carnet" value="${fn:substring(param.apellidoP,0,1)}"/>
      <c:set var="carnet" value="${carnet}${fn:substring(param.apellidoM,0,1)}"/>
      <c:set var="carnet" value="${carnet}${cadcorrelativo}"/>
      <c:set var="carnet" value="${carnet}${currentyear}"/>
      <c:set var="carnet" value="${fn:trim(fn:toUpperCase(carnet))}"/>

      <% //Operaciones %>
      <c:choose>
          <c:when test="${param.op==1}">
              <c:catch var="exception">
                  <sql:transaction dataSource="jdbc/cra">
                      <sql:update var="addProfesor">
                          INSERT INTO profesor(carnet, dui, nit, nombre1, nombre2, nombre3,
                          apellidoPaterno, apellidoMaterno, sexo, fechaNacimiento)
                          VALUES(?,?,?,?,?,?,?,?,?,?)
                          <sql:param value="${carnet}"/>
                          <sql:param value="${param.dui}"/>
                          <sql:param value="${param.nit}"/>
                          <sql:param value="${param.nombre1}"/>
                          <sql:param value="${param.nombre2}"/>
                          <sql:param value="${param.nombre3}"/>
                          <sql:param value="${param.apellidoP}"/>
                          <sql:param value="${param.apellidoM}"/>
                          <sql:param value="${param.s}"/>
                          <sql:param value="${param.fechaNac}"/>
                      </sql:update>
                      <sql:update var="addDireccion">
                          INSERT INTO direccion(
                          carnet_profesor, id_departamento, id_municipio, direccion)
                          VALUES(?,?,?,?)
                          <sql:param value="${carnet}"/>
                          <sql:param value="${param.departamento}"/>
                          <sql:param value="${param.municipio}"/>
                          <sql:param value="${param.direccion}"/>
                      </sql:update>
                  </sql:transaction>                
                  <c:redirect url="../index.jsp"/>
              </c:catch>
              <c:out value="${exception}"></c:out>
          </c:when>
          <c:when test="${param.op==2}">
              <c:catch var="exception2">
                  <sql:update var="updateProfesor" dataSource="jdbc/cra">
                      UPDATE profesor
                      SET dui = ?, nit = ?, nombre1 = ?, nombre2 = ?, nombre3 = ?,
                      apellidoPaterno = ?, apellidoMaterno = ?, sexo = ?,
                      fechaNacimiento = ?
                      WHERE carnet = ?
                      <sql:param value="${param.dui}"/>
                      <sql:param value="${param.nit}"/>
                      <sql:param value="${param.nombre1}"/>
                      <sql:param value="${param.nombre2}"/>
                      <sql:param value="${param.nombre3}"/>
                      <sql:param value="${param.apellidoP}"/>
                      <sql:param value="${param.apellidoM}"/>
                      <sql:param value="${param.s}"/>
                      <sql:param value="${param.fechaNac}"/>
                      <sql:param value="${param.cnt}"/>
                  </sql:update>
                  <sql:update var="updateDireccion" dataSource="jdbc/cra">
                      UPDATE direccion
                      SET id_departamento = ?, id_municipio = ?, direccion = ?
                      WHERE carnet_profesor = ?
                      <sql:param value="${param.departamento}"/>
                      <sql:param value="${param.municipio}"/>
                      <sql:param value="${param.direccion}"/>
                      <sql:param value="${param.cnt}"/>
                  </sql:update>
              </c:catch>
              <c:redirect url="../index.jsp"/>
          </c:when>
          <c:otherwise>
              <p>Error</p>
          </c:otherwise>
      </c:choose>
</c:if>
<c:if test="${param.op==3}">
    <c:catch var="exception3">
        <sql:update var="updateEstado" dataSource="jdbc/cra">
            UPDATE profesor
            SET estado = 0
            WHERE carnet = ?
            <sql:param value="${param.cnt}"/>
        </sql:update>
    </c:catch>
    <c:redirect url="../index.jsp"/>
</c:if>

