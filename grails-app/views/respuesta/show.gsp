
<%@ page import="com.climaescolar.Respuesta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'respuesta.label', default: 'Respuesta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-respuesta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-respuesta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list respuesta">
			
				<g:if test="${respuestaInstance?.encuesta}">
				<li class="fieldcontain">
					<span id="encuesta-label" class="property-label"><g:message code="respuesta.encuesta.label" default="Encuesta" /></span>
					
						<span class="property-value" aria-labelledby="encuesta-label"><g:link controller="encuesta" action="show" id="${respuestaInstance?.encuesta?.id}">${respuestaInstance?.encuesta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${respuestaInstance?.hoja}">
				<li class="fieldcontain">
					<span id="hoja-label" class="property-label"><g:message code="respuesta.hoja.label" default="Hoja" /></span>
					
						<span class="property-value" aria-labelledby="hoja-label"><g:link controller="hojaDeRespuestas" action="show" id="${respuestaInstance?.hoja?.id}">${respuestaInstance?.hoja?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${respuestaInstance?.opcion}">
				<li class="fieldcontain">
					<span id="opcion-label" class="property-label"><g:message code="respuesta.opcion.label" default="Opcion" /></span>
					
						<span class="property-value" aria-labelledby="opcion-label"><g:link controller="opcion" action="show" id="${respuestaInstance?.opcion?.id}">${respuestaInstance?.opcion?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${respuestaInstance?.pregunta}">
				<li class="fieldcontain">
					<span id="pregunta-label" class="property-label"><g:message code="respuesta.pregunta.label" default="Pregunta" /></span>
					
						<span class="property-value" aria-labelledby="pregunta-label"><g:link controller="pregunta" action="show" id="${respuestaInstance?.pregunta?.id}">${respuestaInstance?.pregunta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${respuestaInstance?.id}" />
					<g:link class="edit" action="edit" id="${respuestaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
