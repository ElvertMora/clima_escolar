<%@ page import="com.climaescolar.HojaDeRespuestas" %>



<div class="fieldcontain ${hasErrors(bean: hojaDeRespuestasInstance, field: 'codHR', 'error')} ">
	<label for="codHR">
		<g:message code="hojaDeRespuestas.codHR.label" default="Cod HR" />
		
	</label>
	<g:textField name="codHR" value="${hojaDeRespuestasInstance?.codHR}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hojaDeRespuestasInstance, field: 'consecutivo', 'error')} ">
	<label for="consecutivo">
		<g:message code="hojaDeRespuestas.consecutivo.label" default="Consecutivo" />
		
	</label>
	<g:textField name="consecutivo" value="${hojaDeRespuestasInstance?.consecutivo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hojaDeRespuestasInstance, field: 'curso', 'error')} required">
	<label for="curso">
		<g:message code="hojaDeRespuestas.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="curso" name="curso.id" from="${com.climaescolar.Curso.list()}" optionKey="id" required="" value="${hojaDeRespuestasInstance?.curso?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hojaDeRespuestasInstance, field: 'respuestas', 'error')} ">
	<label for="respuestas">
		<g:message code="hojaDeRespuestas.respuestas.label" default="Respuestas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${hojaDeRespuestasInstance?.respuestas?}" var="r">
    <li><g:link controller="respuesta" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="respuesta" action="create" params="['hojaDeRespuestas.id': hojaDeRespuestasInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'respuesta.label', default: 'Respuesta')])}</g:link>
</li>
</ul>

</div>

