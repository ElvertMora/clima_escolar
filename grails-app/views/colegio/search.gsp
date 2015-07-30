<%@ page import="com.climaescolar.Colegio" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'colegio.label', default: 'Colegio')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-colegio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
<ul>
<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
</ul>
</div>


<g:form action="resultados" >
    
<div class="fieldcontain">
<label for="dane">
    <g:message code="colegio.dane.label" default="Codigo Dane" />
</label>
<g:textField name="dane" maxlength="30" 
value="${colegioInstance?.dane}"/>
</div>

<div class="fieldcontain">
<label for="localidad">
    <g:message code="colegio.localidad.label" default="Localidad" />
</label>
<g:select optionValue="nombreLocalidad" id="localidad" name="localidad.id" 
from="${com.climaescolar.Localidad.list()}" optionKey="id" 
value="${colegioInstance?.localidad?.id}" class="many-to-one" 
noSelection="${['null':'Select One...']}"/>
</div>

<div class="fieldcontain">
<label for="tipoInstitucion">
    <g:message code="colegio.tipoInstitucion.label" default="tipo Institucion" />
</label>
<g:select name="tipoInstitucion" 
from="${com.climaescolar.Colegio$TipoColegio?.values()}" 
keys="${com.climaescolar.Colegio$TipoColegio.values()*.name()}" 
value="${colegioInstance?.tipoInstitucion?.name()}"
noSelection="${['null':'Select One...']}"/>
</div>

<div class="fieldcontain">
<label for="nombreInstitucion">
<g:message code="colegio.nombreInstitucion.label" default="Nombre del Colegio" />
</label>
<g:textField name="nombreInstitucion" 
maxlength="100"
value="${colegioInstance?.nombreInstitucion}"/>
</div>

<div class="fieldcontain">
<label for="direccion">
<g:message code="colegio.direccion.label" default="Dirección" />
</label>
<g:textField name="direccion" 
maxlength="100" value="${colegioInstance?.direccion}"/>
</div>

<div class="fieldcontain ">
<label for="barrio">
<g:message code="colegio.barrio.label" default="Barrio" />
</label>
<g:textField name="barrio" maxlength="100"  value="${colegioInstance?.barrio}"/>
</div>

<div class="fieldcontain">
<label for="telefono">
<g:message code="colegio.telefono.label" default="Telefono" />
</label>
<g:textField name="telefono" maxlength="35"  value="${colegioInstance?.telefono}"/>
</div>

<fieldset class="buttons">
<g:submitButton name="resultados" class="resultados" value="${message(code: 'default.button.find.label', default: 'Buscar')}" />
</fieldset>
</g:form>

</body>
</html>
