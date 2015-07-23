<%@ page import="com.climaescolar.Colegio" %>



<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'email1', 'error')} required">
	<label for="email1">
		<g:message code="colegio.email1.label" default="Email1" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email1" required="" value="${colegioInstance?.email1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'email2', 'error')} ">
	<label for="email2">
		<g:message code="colegio.email2.label" default="Email2" />
		
	</label>
	<g:field type="email" name="email2" value="${colegioInstance?.email2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="colegio.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" maxlength="15" required="" value="${colegioInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'dane', 'error')} required">
	<label for="dane">
		<g:message code="colegio.dane.label" default="Dane" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dane" maxlength="30" required="" value="${colegioInstance?.dane}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'nombreLocalidad', 'error')} required">
	<label for="nombreLocalidad">
		<g:message code="colegio.nombreLocalidad.label" default="Nombre Localidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreLocalidad" maxlength="30" required="" value="${colegioInstance?.nombreLocalidad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'clase', 'error')} required">
	<label for="clase">
		<g:message code="colegio.clase.label" default="Clase" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clase" maxlength="15" required="" value="${colegioInstance?.clase}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'nombreInstitucion', 'error')} required">
	<label for="nombreInstitucion">
		<g:message code="colegio.nombreInstitucion.label" default="Nombre Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreInstitucion" maxlength="100" required="" value="${colegioInstance?.nombreInstitucion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="colegio.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" maxlength="100" required="" value="${colegioInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'barrio', 'error')} required">
	<label for="barrio">
		<g:message code="colegio.barrio.label" default="Barrio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barrio" maxlength="100" required="" value="${colegioInstance?.barrio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'nombreRector', 'error')} required">
	<label for="nombreRector">
		<g:message code="colegio.nombreRector.label" default="Nombre Rector" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreRector" maxlength="100" required="" value="${colegioInstance?.nombreRector}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'nombreProResponsable', 'error')} ">
	<label for="nombreProResponsable">
		<g:message code="colegio.nombreProResponsable.label" default="Nombre Pro Responsable" />
		
	</label>
	<g:textField name="nombreProResponsable" maxlength="100" value="${colegioInstance?.nombreProResponsable}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="colegio.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" maxlength="100" value="${colegioInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'representanteUN', 'error')} ">
	<label for="representanteUN">
		<g:message code="colegio.representanteUN.label" default="Representante UN" />
		
	</label>
	<g:textField name="representanteUN" maxlength="100" value="${colegioInstance?.representanteUN}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'observaciones2', 'error')} ">
	<label for="observaciones2">
		<g:message code="colegio.observaciones2.label" default="Observaciones2" />
		
	</label>
	<g:textField name="observaciones2" maxlength="100" value="${colegioInstance?.observaciones2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'lastUpdatedBy', 'error')} ">
	<label for="lastUpdatedBy">
		<g:message code="colegio.lastUpdatedBy.label" default="Last Updated By" />
		
	</label>
	<g:textField name="lastUpdatedBy" value="${colegioInstance?.lastUpdatedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'confirmacion', 'error')} ">
	<label for="confirmacion">
		<g:message code="colegio.confirmacion.label" default="Confirmacion" />
		
	</label>
	<g:checkBox name="confirmacion" value="${colegioInstance?.confirmacion}" />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="colegio.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${colegioInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'fechaLlamada', 'error')} required">
	<label for="fechaLlamada">
		<g:message code="colegio.fechaLlamada.label" default="Fecha Llamada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaLlamada" precision="day"  value="${colegioInstance?.fechaLlamada}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'hourUpdate', 'error')} ">
	<label for="hourUpdate">
		<g:message code="colegio.hourUpdate.label" default="Hour Update" />
		
	</label>
	<g:textField name="hourUpdate" value="${colegioInstance?.hourUpdate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'jornadas', 'error')} ">
	<label for="jornadas">
		<g:message code="colegio.jornadas.label" default="Jornadas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${colegioInstance?.jornadas?}" var="j">
    <li><g:link controller="jornada" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="jornada" action="create" params="['colegio.id': colegioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'jornada.label', default: 'Jornada')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'resultado', 'error')} ">
	<label for="resultado">
		<g:message code="colegio.resultado.label" default="Resultado" />
		
	</label>
	<g:checkBox name="resultado" value="${colegioInstance?.resultado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'signupDate', 'error')} required">
	<label for="signupDate">
		<g:message code="colegio.signupDate.label" default="Signup Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="signupDate" precision="day"  value="${colegioInstance?.signupDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'visitaPrevia', 'error')} ">
	<label for="visitaPrevia">
		<g:message code="colegio.visitaPrevia.label" default="Visita Previa" />
		
	</label>
	<g:checkBox name="visitaPrevia" value="${colegioInstance?.visitaPrevia}" />
</div>

