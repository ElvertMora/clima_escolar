
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
		<div id="list-colegio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="email1" title="${message(code: 'colegio.email1.label', default: 'Email1')}" />
					
						<g:sortableColumn property="email2" title="${message(code: 'colegio.email2.label', default: 'Email2')}" />
					
						<g:sortableColumn property="telefono" title="${message(code: 'colegio.telefono.label', default: 'Telefono')}" />
					
						<g:sortableColumn property="dane" title="${message(code: 'colegio.dane.label', default: 'Dane')}" />
					
						<g:sortableColumn property="nombreLocalidad" title="${message(code: 'colegio.nombreLocalidad.label', default: 'Nombre Localidad')}" />
					
						<g:sortableColumn property="clase" title="${message(code: 'colegio.clase.label', default: 'Clase')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${colegioInstanceList}" status="i" var="colegioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${colegioInstance.id}">${fieldValue(bean: colegioInstance, field: "email1")}</g:link></td>
					
						<td>${fieldValue(bean: colegioInstance, field: "email2")}</td>
					
						<td>${fieldValue(bean: colegioInstance, field: "telefono")}</td>
					
						<td>${fieldValue(bean: colegioInstance, field: "dane")}</td>
					
						<td>${fieldValue(bean: colegioInstance, field: "nombreLocalidad")}</td>
					
						<td>${fieldValue(bean: colegioInstance, field: "clase")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${colegioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
