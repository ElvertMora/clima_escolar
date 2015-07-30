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
                                <li><g:link class="search" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></li>
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
                                        <th>${message(code: 'colegio.dane.label', default: 'Dane')}</th>
					
					<th>${message(code: 'colegio.nombreInstitucion.label', default: 'Nombre Institucion')}</th>
					
					<th>${message(code: 'colegio.direccion.label', default: 'Direccion')}</th>                                         
					
					<th>${message(code: 'colegio.telefono.label', default: 'Telefono')}</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${colegioInstanceList}" status="i" var="colegioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">										
						<td>${fieldValue(bean: colegioInstance, field: "dane")}</td>
					
						<td><g:link action="show" id="${colegioInstance.id}">${fieldValue(bean: colegioInstance, field: "nombreInstitucion")}</g:link></td>
					
						<td>${fieldValue(bean: colegioInstance, field: "direccion")}</td>						
					
						<td>${fieldValue(bean: colegioInstance, field: "telefono")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
</html>
