<%@ page import="com.climaescolar.Cordinador" %>



<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="cordinador.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${cordinadorInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="cordinador.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${cordinadorInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'identificacion', 'error')} required">
	<label for="identificacion">
		<g:message code="cordinador.identificacion.label" default="Identificacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identificacion" required="" value="${cordinadorInstance?.identificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'nombres', 'error')} ">
	<label for="nombres">
		<g:message code="cordinador.nombres.label" default="Nombres" />
		
	</label>
	<g:textField name="nombres" pattern="${cordinadorInstance.constraints.nombres.matches}" value="${cordinadorInstance?.nombres}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'apellidos', 'error')} ">
	<label for="apellidos">
		<g:message code="cordinador.apellidos.label" default="Apellidos" />
		
	</label>
	<g:textField name="apellidos" pattern="${cordinadorInstance.constraints.apellidos.matches}" value="${cordinadorInstance?.apellidos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'genero', 'error')} ">
	<label for="genero">
		<g:message code="cordinador.genero.label" default="Genero" />
		
	</label>
	<g:select name="genero" from="${cordinadorInstance.constraints.genero.inList}" value="${cordinadorInstance?.genero}" valueMessagePrefix="cordinador.genero" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="cordinador.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${cordinadorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="cordinador.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${cordinadorInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="cordinador.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${cordinadorInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="cordinador.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${cordinadorInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: cordinadorInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="cordinador.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${cordinadorInstance?.passwordExpired}" />
</div>

