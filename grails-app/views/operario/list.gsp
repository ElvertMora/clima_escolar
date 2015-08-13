
<%@ page import="com.climaescolar.Operario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'operario.label', default: 'Gestor UN')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-operario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-operario" class="content scaffold-list" role="main">
			<h1>Lista de Gestores UN</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'operario.username.label', default: 'Username')}" />
											
						<g:sortableColumn property="identificacion" title="${message(code: 'operario.identificacion.label', default: 'Identificacion')}" />
					
						<g:sortableColumn property="nombres" title="${message(code: 'operario.nombres.label', default: 'Nombres')}" />
					
						<g:sortableColumn property="apellidos" title="${message(code: 'operario.apellidos.label', default: 'Apellidos')}" />
					
						<g:sortableColumn property="genero" title="${message(code: 'operario.genero.label', default: 'Genero')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${operarioInstanceList}" status="i" var="operarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${operarioInstance.id}">${fieldValue(bean: operarioInstance, field: "username")}</g:link></td>										
					
						<td>${fieldValue(bean: operarioInstance, field: "identificacion")}</td>
					
						<td>${fieldValue(bean: operarioInstance, field: "nombres")}</td>
					
						<td>${fieldValue(bean: operarioInstance, field: "apellidos")}</td>
					
						<td>${fieldValue(bean: operarioInstance, field: "genero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${operarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
