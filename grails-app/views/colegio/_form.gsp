<%@ page import="com.climaescolar.Colegio" %>

<div class="datoscolegio" >
    <h1>Datos del colegio</h1>
<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'dane', 'error')} required">
	<label for="dane">
		<g:message code="colegio.dane.label" default="Dane" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dane" maxlength="30" required="" value="${colegioInstance?.dane}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'localidad', 'error')} required">
	<label for="localidad">
		<g:message code="colegio.localidad.label" default="Localidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombreLocalidad" id="localidad" name="localidad.id" from="${com.climaescolar.Localidad.list()}" optionKey="id" required="" value="${colegioInstance?.localidad?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'tipoInstitucion', 'error')} required">
	<label for="tipoInstitucion">
		<g:message code="colegio.tipoInstitucion.label" default="Tipo Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoInstitucion" from="${com.climaescolar.Colegio$TipoColegio?.values()}" keys="${com.climaescolar.Colegio$TipoColegio.values()*.name()}" required="" value="${colegioInstance?.tipoInstitucion?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'nombreInstitucion', 'error')} required">
	<label for="nombreInstitucion">
		<g:message code="colegio.nombreInstitucion.label" default="Nombre Institucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreInstitucion" maxlength="100" required="" value="${colegioInstance?.nombreInstitucion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'direccion', 'error')}">
	<label for="direccion">
		<g:message code="colegio.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" maxlength="100" value="${colegioInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'barrio', 'error')} ">
	<label for="barrio">
		<g:message code="colegio.barrio.label" default="Barrio" />
		
	</label>
	<g:textField name="barrio" maxlength="100"  value="${colegioInstance?.barrio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="colegio.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="35"  value="${colegioInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'email1', 'error')} ">
	<label for="email1">
		<g:message code="colegio.email1.label" default="Email1" />
		
	</label>
	<g:field type="email" name="email1" value="${colegioInstance?.email1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'email2', 'error')} ">
	<label for="email2">
		<g:message code="colegio.email2.label" default="Email2" />
		
	</label>
	<g:field type="email" name="email2" value="${colegioInstance?.email2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'nombreRector', 'error')} ">
	<label for="nombreRector">
		<g:message code="colegio.nombreRector.label" default="Nombre Rector" />
		
	</label>
	<g:textField name="nombreRector" maxlength="100"  value="${colegioInstance?.nombreRector}"/>
</div>

<h1>Jornadas del Colegio</h1>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'jornadas', 'error')} ">
	<label for="jornadas">
		<g:message code="colegio.jornadas.label" default="Jornadas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${colegioInstance?.jornadas?}" var="j">
    <li><g:link controller="jornada" action="show" id="${j.id}">${j?.tipo}</g:link></li>
</g:each>
<li class="add">
<g:link controller="jornada" action="create" params="['colegio.id': colegioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'jornada.label', default: 'Jornada')])}</g:link>
</li>
</ul>

</div>

</div>

<div calss="datsosens">

    <h1>Datos sensibilización</h1>


<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'contactoEnInstitucion', 'error')} ">
	<label for="contactoEnInstitucion">
		<g:message code="colegio.contactoEnInstitucion.label" default="Contacto En Institucion" />
		
	</label>
	<g:textField name="contactoEnInstitucion" maxlength="100" value="${colegioInstance?.contactoEnInstitucion}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'confirmacion', 'error')} ">
	<label for="confirmacion">
		<g:message code="colegio.confirmacion.label" default="Confirmacion" />
		
	</label>
	<g:checkBox name="confirmacion" value="${colegioInstance?.confirmacion}" />
</div>
<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'observacionesGenerales', 'error')} ">
	<label for="observacionesGenerales">
		<g:message code="colegio.observacionesGenerales.label" default="Observaciones Generales" />
		
	</label>
	<g:textField name="observacionesGenerales" maxlength="100" value="${colegioInstance?.observacionesGenerales}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'visitaPrevia', 'error')} ">
	<label for="visitaPrevia">
		<g:message code="colegio.visitaPrevia.label" default="Visita Previa" />
		
	</label>
	<g:checkBox name="visitaPrevia" value="${colegioInstance?.visitaPrevia}" />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'representanteUN', 'error')} ">
	<label for="representanteUN">
		<g:message code="colegio.representanteUN.label" default="Representante UN" />
		
	</label>
	<g:textField name="representanteUN" maxlength="100" value="${colegioInstance?.representanteUN}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'fechaVisita', 'error')} required">
	<label for="fechaVisita">
		<g:message code="colegio.fechaVisita.label" default="Fecha Visita" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaVisita" precision="day"  value="${colegioInstance?.fechaVisita}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'resultado', 'error')} ">
	<label for="resultado">
		<g:message code="colegio.resultado.label" default="Resultado" />
		
	</label>
	<g:checkBox name="resultado" value="${colegioInstance?.resultado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'observacionesFinales', 'error')} ">
	<label for="observacionesFinales">
		<g:message code="colegio.observacionesFinales.label" default="Observaciones Finales" />
		
	</label>
	<g:textField name="observacionesFinales" maxlength="100" value="${colegioInstance?.observacionesFinales}"/>
</div>


<h2>Datos de actualización</h2>
<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'fechaLlamada', 'error')} ">
	<label for="fechaLlamada">
		<g:message code="colegio.fechaLlamada.label" default="Fecha Llamada" />
		
	</label>
	<g:datePicker name="fechaLlamada" precision="day"  value="${colegioInstance?.fechaLlamada}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'horaLlamada', 'error')} ">
	<label for="horaLlamada">
		<g:message code="colegio.horaLlamada.label" default="Hora Llamada" />
		
	</label>
	<g:textField name="horaLlamada" value="${colegioInstance?.horaLlamada}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: colegioInstance, field: 'actualizo', 'error')} ">
	<label for="actualizo">
		<g:message code="colegio.actualizo.label" default="Actualizo" />
		
	</label>
	<g:textField name="actualizo" value="${colegioInstance?.actualizo}"/>
</div>
</div>
