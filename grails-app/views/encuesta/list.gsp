
<%@ page import="com.climaescolar.Encuesta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'encuesta.label', default: 'Encuesta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-encuesta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-encuesta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'encuesta.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fechaFin" title="${message(code: 'encuesta.fechaFin.label', default: 'Fecha Fin')}" />
					
						<g:sortableColumn property="fechaInicio" title="${message(code: 'encuesta.fechaInicio.label', default: 'Fecha Inicio')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'encuesta.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${encuestaInstanceList}" status="i" var="encuestaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${encuestaInstance.id}">${fieldValue(bean: encuestaInstance, field: "descripcion")}</g:link></td>
					
						<td><g:formatDate date="${encuestaInstance.fechaFin}" /></td>
					
						<td><g:formatDate date="${encuestaInstance.fechaInicio}" /></td>
					
						<td>${fieldValue(bean: encuestaInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${encuestaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
