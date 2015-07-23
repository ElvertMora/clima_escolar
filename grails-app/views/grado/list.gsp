
<%@ page import="com.climaescolar.Grado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grado.label', default: 'Grado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-grado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-grado" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="grado" title="${message(code: 'grado.grado.label', default: 'Grado')}" />
					
						<th><g:message code="grado.jornada.label" default="Jornada" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gradoInstanceList}" status="i" var="gradoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gradoInstance.id}">${fieldValue(bean: gradoInstance, field: "grado")}</g:link></td>
					
						<td>${fieldValue(bean: gradoInstance, field: "jornada")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gradoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
