
<%@ page import="com.climaescolar.Grado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grado.label', default: 'Grado')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-grado" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grado">
			
				<g:if test="${gradoInstance?.cursos}">
				<li class="fieldcontain">
					<span id="cursos-label" class="property-label"><g:message code="grado.cursos.label" default="Cursos" /></span>
					
						<g:each in="${gradoInstance.cursos}" var="c">
						<span class="property-value" aria-labelledby="cursos-label"><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${gradoInstance?.grado}">
				<li class="fieldcontain">
					<span id="grado-label" class="property-label"><g:message code="grado.grado.label" default="Grado" /></span>
					
						<span class="property-value" aria-labelledby="grado-label"><g:fieldValue bean="${gradoInstance}" field="grado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradoInstance?.jornada}">
				<li class="fieldcontain">
					<span id="jornada-label" class="property-label"><g:message code="grado.jornada.label" default="Jornada" /></span>
					
						<span class="property-value" aria-labelledby="jornada-label"><g:link controller="jornada" action="show" id="${gradoInstance?.jornada?.id}">${gradoInstance?.jornada?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gradoInstance?.id}" />
					<g:link class="edit" action="edit" id="${gradoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
