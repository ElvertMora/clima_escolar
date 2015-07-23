<%@ page import="com.climaescolar.Encuesta" %>



<div class="fieldcontain ${hasErrors(bean: encuestaInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="encuesta.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${encuestaInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: encuestaInstance, field: 'fechaFin', 'error')} required">
	<label for="fechaFin">
		<g:message code="encuesta.fechaFin.label" default="Fecha Fin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFin" precision="day"  value="${encuestaInstance?.fechaFin}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: encuestaInstance, field: 'fechaInicio', 'error')} required">
	<label for="fechaInicio">
		<g:message code="encuesta.fechaInicio.label" default="Fecha Inicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicio" precision="day"  value="${encuestaInstance?.fechaInicio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: encuestaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="encuesta.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${encuestaInstance?.nombre}"/>
</div>

