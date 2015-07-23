<%@ page import="com.climaescolar.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'curso', 'error')} ">
	<label for="curso">
		<g:message code="curso.curso.label" default="Curso" />
		
	</label>
	<g:textField name="curso" value="${cursoInstance?.curso}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'grado', 'error')} required">
	<label for="grado">
		<g:message code="curso.grado.label" default="Grado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="grado" name="grado.id" from="${com.climaescolar.Grado.list()}" optionKey="id" required="" value="${cursoInstance?.grado?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'hojasDeRespuestas', 'error')} ">
	<label for="hojasDeRespuestas">
		<g:message code="curso.hojasDeRespuestas.label" default="Hojas De Respuestas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cursoInstance?.hojasDeRespuestas?}" var="h">
    <li><g:link controller="hojaDeRespuestas" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="hojaDeRespuestas" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'hojaDeRespuestas.label', default: 'HojaDeRespuestas')])}</g:link>
</li>
</ul>

</div>

