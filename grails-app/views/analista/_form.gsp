<%@ page import="com.climaescolar.Analista" %>



<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="analista.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${analistaInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="analista.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${analistaInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'identificacion', 'error')} required">
	<label for="identificacion">
		<g:message code="analista.identificacion.label" default="Identificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identificacion" required="" value="${analistaInstance?.identificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'nombres', 'error')} ">
	<label for="nombres">
		<g:message code="analista.nombres.label" default="Nombres" />
		
	</label>
	<g:textField name="nombres" pattern="${analistaInstance.constraints.nombres.matches}" value="${analistaInstance?.nombres}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'apellidos', 'error')} ">
	<label for="apellidos">
		<g:message code="analista.apellidos.label" default="Apellidos" />
		
	</label>
	<g:textField name="apellidos" pattern="${analistaInstance.constraints.apellidos.matches}" value="${analistaInstance?.apellidos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'genero', 'error')} ">
	<label for="genero">
		<g:message code="analista.genero.label" default="Genero" />
		
	</label>
	<g:select name="genero" from="${analistaInstance.constraints.genero.inList}" value="${analistaInstance?.genero}" valueMessagePrefix="analista.genero" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="analista.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${analistaInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="analista.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${analistaInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="analista.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${analistaInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="analista.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${analistaInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: analistaInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="analista.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${analistaInstance?.passwordExpired}" />
</div>

