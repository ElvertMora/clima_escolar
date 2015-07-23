
<%@ page import="com.climaescolar.HojaDeRespuestas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hojaDeRespuestas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hojaDeRespuestas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="codHR" title="${message(code: 'hojaDeRespuestas.codHR.label', default: 'Cod HR')}" />
					
						<g:sortableColumn property="consecutivo" title="${message(code: 'hojaDeRespuestas.consecutivo.label', default: 'Consecutivo')}" />
					
						<th><g:message code="hojaDeRespuestas.curso.label" default="Curso" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hojaDeRespuestasInstanceList}" status="i" var="hojaDeRespuestasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hojaDeRespuestasInstance.id}">${fieldValue(bean: hojaDeRespuestasInstance, field: "codHR")}</g:link></td>
					
						<td>${fieldValue(bean: hojaDeRespuestasInstance, field: "consecutivo")}</td>
					
						<td>${fieldValue(bean: hojaDeRespuestasInstance, field: "curso")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hojaDeRespuestasInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
