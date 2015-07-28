
<%@ page import="com.climaescolar.Operario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'operario.label', default: 'Operario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-operario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-operario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list operario">
			
				<g:if test="${operarioInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="operario.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${operarioInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="operario.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${operarioInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.identificacion}">
				<li class="fieldcontain">
					<span id="identificacion-label" class="property-label"><g:message code="operario.identificacion.label" default="Identificacion" /></span>
					
						<span class="property-value" aria-labelledby="identificacion-label"><g:fieldValue bean="${operarioInstance}" field="identificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.nombres}">
				<li class="fieldcontain">
					<span id="nombres-label" class="property-label"><g:message code="operario.nombres.label" default="Nombres" /></span>
					
						<span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${operarioInstance}" field="nombres"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.apellidos}">
				<li class="fieldcontain">
					<span id="apellidos-label" class="property-label"><g:message code="operario.apellidos.label" default="Apellidos" /></span>
					
						<span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${operarioInstance}" field="apellidos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.genero}">
				<li class="fieldcontain">
					<span id="genero-label" class="property-label"><g:message code="operario.genero.label" default="Genero" /></span>
					
						<span class="property-value" aria-labelledby="genero-label"><g:fieldValue bean="${operarioInstance}" field="genero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="operario.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${operarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="operario.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${operarioInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="operario.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${operarioInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.enabled}">
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><g:message code="operario.enabled.label" default="Enabled" /></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${operarioInstance?.enabled}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${operarioInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="operario.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${operarioInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${operarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${operarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
