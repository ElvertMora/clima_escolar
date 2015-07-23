
<%@ page import="com.climaescolar.Colegio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'colegio.label', default: 'Colegio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-colegio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-colegio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list colegio">
			
				<g:if test="${colegioInstance?.email1}">
				<li class="fieldcontain">
					<span id="email1-label" class="property-label"><g:message code="colegio.email1.label" default="Email1" /></span>
					
						<span class="property-value" aria-labelledby="email1-label"><g:fieldValue bean="${colegioInstance}" field="email1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.email2}">
				<li class="fieldcontain">
					<span id="email2-label" class="property-label"><g:message code="colegio.email2.label" default="Email2" /></span>
					
						<span class="property-value" aria-labelledby="email2-label"><g:fieldValue bean="${colegioInstance}" field="email2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="colegio.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${colegioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.dane}">
				<li class="fieldcontain">
					<span id="dane-label" class="property-label"><g:message code="colegio.dane.label" default="Dane" /></span>
					
						<span class="property-value" aria-labelledby="dane-label"><g:fieldValue bean="${colegioInstance}" field="dane"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.nombreLocalidad}">
				<li class="fieldcontain">
					<span id="nombreLocalidad-label" class="property-label"><g:message code="colegio.nombreLocalidad.label" default="Nombre Localidad" /></span>
					
						<span class="property-value" aria-labelledby="nombreLocalidad-label"><g:fieldValue bean="${colegioInstance}" field="nombreLocalidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.clase}">
				<li class="fieldcontain">
					<span id="clase-label" class="property-label"><g:message code="colegio.clase.label" default="Clase" /></span>
					
						<span class="property-value" aria-labelledby="clase-label"><g:fieldValue bean="${colegioInstance}" field="clase"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.nombreInstitucion}">
				<li class="fieldcontain">
					<span id="nombreInstitucion-label" class="property-label"><g:message code="colegio.nombreInstitucion.label" default="Nombre Institucion" /></span>
					
						<span class="property-value" aria-labelledby="nombreInstitucion-label"><g:fieldValue bean="${colegioInstance}" field="nombreInstitucion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="colegio.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${colegioInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.barrio}">
				<li class="fieldcontain">
					<span id="barrio-label" class="property-label"><g:message code="colegio.barrio.label" default="Barrio" /></span>
					
						<span class="property-value" aria-labelledby="barrio-label"><g:fieldValue bean="${colegioInstance}" field="barrio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.nombreRector}">
				<li class="fieldcontain">
					<span id="nombreRector-label" class="property-label"><g:message code="colegio.nombreRector.label" default="Nombre Rector" /></span>
					
						<span class="property-value" aria-labelledby="nombreRector-label"><g:fieldValue bean="${colegioInstance}" field="nombreRector"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.nombreProResponsable}">
				<li class="fieldcontain">
					<span id="nombreProResponsable-label" class="property-label"><g:message code="colegio.nombreProResponsable.label" default="Nombre Pro Responsable" /></span>
					
						<span class="property-value" aria-labelledby="nombreProResponsable-label"><g:fieldValue bean="${colegioInstance}" field="nombreProResponsable"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="colegio.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${colegioInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.representanteUN}">
				<li class="fieldcontain">
					<span id="representanteUN-label" class="property-label"><g:message code="colegio.representanteUN.label" default="Representante UN" /></span>
					
						<span class="property-value" aria-labelledby="representanteUN-label"><g:fieldValue bean="${colegioInstance}" field="representanteUN"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.observaciones2}">
				<li class="fieldcontain">
					<span id="observaciones2-label" class="property-label"><g:message code="colegio.observaciones2.label" default="Observaciones2" /></span>
					
						<span class="property-value" aria-labelledby="observaciones2-label"><g:fieldValue bean="${colegioInstance}" field="observaciones2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.lastUpdatedBy}">
				<li class="fieldcontain">
					<span id="lastUpdatedBy-label" class="property-label"><g:message code="colegio.lastUpdatedBy.label" default="Last Updated By" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${colegioInstance}" field="lastUpdatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.confirmacion}">
				<li class="fieldcontain">
					<span id="confirmacion-label" class="property-label"><g:message code="colegio.confirmacion.label" default="Confirmacion" /></span>
					
						<span class="property-value" aria-labelledby="confirmacion-label"><g:formatBoolean boolean="${colegioInstance?.confirmacion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="colegio.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${colegioInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.fechaLlamada}">
				<li class="fieldcontain">
					<span id="fechaLlamada-label" class="property-label"><g:message code="colegio.fechaLlamada.label" default="Fecha Llamada" /></span>
					
						<span class="property-value" aria-labelledby="fechaLlamada-label"><g:formatDate date="${colegioInstance?.fechaLlamada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.hourUpdate}">
				<li class="fieldcontain">
					<span id="hourUpdate-label" class="property-label"><g:message code="colegio.hourUpdate.label" default="Hour Update" /></span>
					
						<span class="property-value" aria-labelledby="hourUpdate-label"><g:fieldValue bean="${colegioInstance}" field="hourUpdate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.jornadas}">
				<li class="fieldcontain">
					<span id="jornadas-label" class="property-label"><g:message code="colegio.jornadas.label" default="Jornadas" /></span>
					
						<g:each in="${colegioInstance.jornadas}" var="j">
						<span class="property-value" aria-labelledby="jornadas-label"><g:link controller="jornada" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.resultado}">
				<li class="fieldcontain">
					<span id="resultado-label" class="property-label"><g:message code="colegio.resultado.label" default="Resultado" /></span>
					
						<span class="property-value" aria-labelledby="resultado-label"><g:formatBoolean boolean="${colegioInstance?.resultado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.signupDate}">
				<li class="fieldcontain">
					<span id="signupDate-label" class="property-label"><g:message code="colegio.signupDate.label" default="Signup Date" /></span>
					
						<span class="property-value" aria-labelledby="signupDate-label"><g:formatDate date="${colegioInstance?.signupDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.visitaPrevia}">
				<li class="fieldcontain">
					<span id="visitaPrevia-label" class="property-label"><g:message code="colegio.visitaPrevia.label" default="Visita Previa" /></span>
					
						<span class="property-value" aria-labelledby="visitaPrevia-label"><g:formatBoolean boolean="${colegioInstance?.visitaPrevia}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${colegioInstance?.id}" />
					<g:link class="edit" action="edit" id="${colegioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
