<%@ page import="com.climaescolar.Localidad" %>



<div class="fieldcontain ${hasErrors(bean: localidadInstance, field: 'nombreLocalidad', 'error')} ">
	<label for="nombreLocalidad">
		<g:message code="localidad.nombreLocalidad.label" default="Nombre Localidad" />
		
	</label>
	<g:textField name="nombreLocalidad" value="${localidadInstance?.nombreLocalidad}"/>
</div>

