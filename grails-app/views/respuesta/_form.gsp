<%@ page import="com.climaescolar.Respuesta" %>



<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'encuesta', 'error')} required">
	<label for="encuesta">
		<g:message code="respuesta.encuesta.label" default="Encuesta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="encuesta" name="encuesta.id" from="${com.climaescolar.Encuesta.list()}" optionKey="id" required="" value="${respuestaInstance?.encuesta?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'hoja', 'error')} required">
	<label for="hoja">
		<g:message code="respuesta.hoja.label" default="Hoja" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="hoja" name="hoja.id" from="${com.climaescolar.HojaDeRespuestas.list()}" optionKey="id" required="" value="${respuestaInstance?.hoja?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'opcion', 'error')} required">
	<label for="opcion">
		<g:message code="respuesta.opcion.label" default="Opcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="opcion" name="opcion.id" from="${com.climaescolar.Opcion.list()}" optionKey="id" required="" value="${respuestaInstance?.opcion?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: respuestaInstance, field: 'pregunta', 'error')} required">
	<label for="pregunta">
		<g:message code="respuesta.pregunta.label" default="Pregunta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pregunta" name="pregunta.id" from="${com.climaescolar.Pregunta.list()}" optionKey="id" required="" value="${respuestaInstance?.pregunta?.id}" class="many-to-one"/>
</div>

