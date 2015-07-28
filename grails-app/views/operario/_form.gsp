<%@ page import="com.climaescolar.Operario" %>



<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="operario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${operarioInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="operario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${operarioInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'identificacion', 'error')} required">
	<label for="identificacion">
		<g:message code="operario.identificacion.label" default="Identificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identificacion" required="" value="${operarioInstance?.identificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'nombres', 'error')} ">
	<label for="nombres">
		<g:message code="operario.nombres.label" default="Nombres" />
		
	</label>
	<g:textField name="nombres" pattern="${operarioInstance.constraints.nombres.matches}" value="${operarioInstance?.nombres}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'apellidos', 'error')} ">
	<label for="apellidos">
		<g:message code="operario.apellidos.label" default="Apellidos" />
		
	</label>
	<g:textField name="apellidos" pattern="${operarioInstance.constraints.apellidos.matches}" value="${operarioInstance?.apellidos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'genero', 'error')} ">
	<label for="genero">
		<g:message code="operario.genero.label" default="Genero" />
		
	</label>
	<g:select name="genero" from="${operarioInstance.constraints.genero.inList}" value="${operarioInstance?.genero}" valueMessagePrefix="operario.genero" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="operario.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${operarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="operario.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${operarioInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="operario.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${operarioInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="operario.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${operarioInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: operarioInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="operario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${operarioInstance?.passwordExpired}" />
</div>

