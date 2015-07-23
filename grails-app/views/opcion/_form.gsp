<%@ page import="com.climaescolar.Opcion" %>



<div class="fieldcontain ${hasErrors(bean: opcionInstance, field: 'label', 'error')} ">
	<label for="label">
		<g:message code="opcion.label.label" default="Label" />
		
	</label>
	<g:textField name="label" value="${opcionInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: opcionInstance, field: 'textoOpcion', 'error')} ">
	<label for="textoOpcion">
		<g:message code="opcion.textoOpcion.label" default="Texto Opcion" />
		
	</label>
	<g:textField name="textoOpcion" value="${opcionInstance?.textoOpcion}"/>
</div>

