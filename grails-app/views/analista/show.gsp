
<%@ page import="com.climaescolar.Analista" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'analista.label', default: 'Analista')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-analista" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-analista" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list analista">
			
				<g:if test="${analistaInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="analista.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${analistaInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="analista.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${analistaInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.identificacion}">
				<li class="fieldcontain">
					<span id="identificacion-label" class="property-label"><g:message code="analista.identificacion.label" default="Identificacion" /></span>
					
						<span class="property-value" aria-labelledby="identificacion-label"><g:fieldValue bean="${analistaInstance}" field="identificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.nombres}">
				<li class="fieldcontain">
					<span id="nombres-label" class="property-label"><g:message code="analista.nombres.label" default="Nombres" /></span>
					
						<span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${analistaInstance}" field="nombres"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.apellidos}">
				<li class="fieldcontain">
					<span id="apellidos-label" class="property-label"><g:message code="analista.apellidos.label" default="Apellidos" /></span>
					
						<span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${analistaInstance}" field="apellidos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.genero}">
				<li class="fieldcontain">
					<span id="genero-label" class="property-label"><g:message code="analista.genero.label" default="Genero" /></span>
					
						<span class="property-value" aria-labelledby="genero-label"><g:fieldValue bean="${analistaInstance}" field="genero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="analista.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${analistaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="analista.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${analistaInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="analista.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${analistaInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="analista.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${analistaInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${analistaInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="analista.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${analistaInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${analistaInstance?.id}" />
					<g:link class="edit" action="edit" id="${analistaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
