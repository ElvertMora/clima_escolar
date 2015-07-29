
<%@ page import="com.climaescolar.Jornada" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'jornada.label', default: 'Jornada')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-jornada" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-jornada" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list jornada">
			
				<g:if test="${jornadaInstance?.colegio}">
				<li class="fieldcontain">
					<span id="colegio-label" class="property-label"><g:message code="jornada.colegio.label" default="Colegio" /></span>
					
						<span class="property-value" aria-labelledby="colegio-label"><g:link controller="colegio" action="show" id="${jornadaInstance?.colegio?.id}">${jornadaInstance?.colegio?.nombreInstitucion}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${jornadaInstance?.grados}">
				<li class="fieldcontain">
					<span id="grados-label" class="property-label"><g:message code="jornada.grados.label" default="Grados" /></span>
					
						<g:each in="${jornadaInstance.grados}" var="g">
						<span class="property-value" aria-labelledby="grados-label"><g:link controller="grado" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${jornadaInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="jornada.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${jornadaInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
                                
                                <g:if test="${jornadaInstance?.sede}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="jornada.sede.label" default="Sede" /></span>					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${jornadaInstance}" field="sede"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${jornadaInstance?.id}" />
					<g:link class="edit" action="edit" id="${jornadaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
