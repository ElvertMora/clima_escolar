
<%@ page import="com.climaescolar.HojaDeRespuestas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hojaDeRespuestas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hojaDeRespuestas" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hojaDeRespuestas">
			
				<g:if test="${hojaDeRespuestasInstance?.codHR}">
				<li class="fieldcontain">
					<span id="codHR-label" class="property-label"><g:message code="hojaDeRespuestas.codHR.label" default="Cod HR" /></span>
					
						<span class="property-value" aria-labelledby="codHR-label"><g:fieldValue bean="${hojaDeRespuestasInstance}" field="codHR"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hojaDeRespuestasInstance?.consecutivo}">
				<li class="fieldcontain">
					<span id="consecutivo-label" class="property-label"><g:message code="hojaDeRespuestas.consecutivo.label" default="Consecutivo" /></span>
					
						<span class="property-value" aria-labelledby="consecutivo-label"><g:fieldValue bean="${hojaDeRespuestasInstance}" field="consecutivo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${hojaDeRespuestasInstance?.curso}">
				<li class="fieldcontain">
					<span id="curso-label" class="property-label"><g:message code="hojaDeRespuestas.curso.label" default="Curso" /></span>
					
						<span class="property-value" aria-labelledby="curso-label"><g:link controller="curso" action="show" id="${hojaDeRespuestasInstance?.curso?.id}">${hojaDeRespuestasInstance?.curso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hojaDeRespuestasInstance?.respuestas}">
				<li class="fieldcontain">
					<span id="respuestas-label" class="property-label"><g:message code="hojaDeRespuestas.respuestas.label" default="Respuestas" /></span>
					
						<g:each in="${hojaDeRespuestasInstance.respuestas}" var="r">
						<span class="property-value" aria-labelledby="respuestas-label"><g:link controller="respuesta" action="show" id="${r.id}">${r?.pregunta?.textoPregunta}  --- ${r?.opcion?.label}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hojaDeRespuestasInstance?.id}" />
					<g:link class="edit" action="edit" id="${hojaDeRespuestasInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
