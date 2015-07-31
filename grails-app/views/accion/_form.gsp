<%@ page import="com.climaescolar.Accion" %>


<g:hiddenField name="colegio.id" value="${accionInstance?.colegio?.id}"/>


<div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="accion.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo" from="${com.climaescolar.Accion$TipoAccion?.values()}" keys="${com.climaescolar.Accion$TipoAccion.values()*.name()}" required="" value="${accionInstance?.tipo?.name()}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'confirmacion', 'error')} ">
	<label for="confirmacion">
		<g:message code="accion.confirmacion.label" default="Confirmacion" />
		
	</label>
	<g:checkBox name="confirmacion" value="${accionInstance?.confirmacion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="accion.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${accionInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'fechaEvento', 'error')} required">
	<label for="fechaEvento">
		<g:message code="accion.fechaEvento.label" default="Fecha Evento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaEvento" precision="day"  value="${accionInstance?.fechaEvento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'nombreEvento', 'error')} ">
	<label for="nombreEvento">
		<g:message code="accion.nombreEvento.label" default="Nombre Evento" />
		
	</label>
	<g:textField name="nombreEvento" value="${accionInstance?.nombreEvento}"/>
</div>



