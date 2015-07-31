
<%@ page import="com.climaescolar.Accion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accion.label', default: 'Accion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-accion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-accion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'accion.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="responsable" title="${message(code: 'accion.responsable.label', default: 'Responsable')}" />
					
						<th><g:message code="accion.colegio.label" default="Colegio" /></th>
					
						<g:sortableColumn property="confirmacion" title="${message(code: 'accion.confirmacion.label', default: 'Confirmacion')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'accion.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="fechaEvento" title="${message(code: 'accion.fechaEvento.label', default: 'Fecha Evento')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${accionInstanceList}" status="i" var="accionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${accionInstance.id}">${fieldValue(bean: accionInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: accionInstance, field: "responsable")}</td>
					
						<td>${fieldValue(bean: accionInstance, field: "colegio")}</td>
					
						<td><g:formatBoolean boolean="${accionInstance.confirmacion}" /></td>
					
						<td>${fieldValue(bean: accionInstance, field: "descripcion")}</td>
					
						<td><g:formatDate date="${accionInstance.fechaEvento}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
