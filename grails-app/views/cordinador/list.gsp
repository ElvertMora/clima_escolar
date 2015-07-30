
<%@ page import="com.climaescolar.Cordinador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cordinador.label', default: 'Cordinador')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cordinador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cordinador" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'cordinador.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'cordinador.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="identificacion" title="${message(code: 'cordinador.identificacion.label', default: 'Identificacion')}" />
					
						<g:sortableColumn property="nombres" title="${message(code: 'cordinador.nombres.label', default: 'Nombres')}" />
					
						<g:sortableColumn property="apellidos" title="${message(code: 'cordinador.apellidos.label', default: 'Apellidos')}" />
					
						<g:sortableColumn property="genero" title="${message(code: 'cordinador.genero.label', default: 'Genero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cordinadorInstanceList}" status="i" var="cordinadorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cordinadorInstance.id}">${fieldValue(bean: cordinadorInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: cordinadorInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: cordinadorInstance, field: "identificacion")}</td>
					
						<td>${fieldValue(bean: cordinadorInstance, field: "nombres")}</td>
					
						<td>${fieldValue(bean: cordinadorInstance, field: "apellidos")}</td>
					
						<td>${fieldValue(bean: cordinadorInstance, field: "genero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cordinadorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
