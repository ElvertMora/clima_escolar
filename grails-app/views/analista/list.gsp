
<%@ page import="com.climaescolar.Analista" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analista.label', default: 'Analista')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-analista" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-analista" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'analista.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'analista.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="identificacion" title="${message(code: 'analista.identificacion.label', default: 'Identificacion')}" />
					
						<g:sortableColumn property="nombres" title="${message(code: 'analista.nombres.label', default: 'Nombres')}" />
					
						<g:sortableColumn property="apellidos" title="${message(code: 'analista.apellidos.label', default: 'Apellidos')}" />
					
						<g:sortableColumn property="genero" title="${message(code: 'analista.genero.label', default: 'Genero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${analistaInstanceList}" status="i" var="analistaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${analistaInstance.id}">${fieldValue(bean: analistaInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: analistaInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: analistaInstance, field: "identificacion")}</td>
					
						<td>${fieldValue(bean: analistaInstance, field: "nombres")}</td>
					
						<td>${fieldValue(bean: analistaInstance, field: "apellidos")}</td>
					
						<td>${fieldValue(bean: analistaInstance, field: "genero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${analistaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
