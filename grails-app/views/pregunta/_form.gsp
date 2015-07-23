<%@ page import="com.climaescolar.Pregunta" %>



<div class="fieldcontain ${hasErrors(bean: preguntaInstance, field: 'textoPregunta', 'error')} ">
	<label for="textoPregunta">
		<g:message code="pregunta.textoPregunta.label" default="Texto Pregunta" />
		
	</label>
	<g:textField name="textoPregunta" value="${preguntaInstance?.textoPregunta}"/>
</div>

