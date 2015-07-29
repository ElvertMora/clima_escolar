
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
			
                                <g:if test="${colegioInstance?.dane}">
				<li class="fieldcontain">
					<span id="dane-label" class="property-label"><g:message code="colegio.dane.label" default="Dane" /></span>
					
						<span class="property-value" aria-labelledby="dane-label"><g:fieldValue bean="${colegioInstance}" field="dane"/></span>
					
				</li>
				</g:if>
			
                                <g:if test="${colegioInstance?.localidad}">
				<li class="fieldcontain">
					<span id="localidad-label" class="property-label"><g:message code="colegio.localidad.label" default="Localidad" /></span>
					
						<span class="property-value" aria-labelledby="localidad-label">${colegioInstance?.localidad?.nombreLocalidad}</span>
					
				</li>
				</g:if>
                                
                                 <g:if test="${colegioInstance?.tipoInstitucion}">
				<li class="fieldcontain">
					<span id="tipoInstitucion-label" class="property-label"><g:message code="colegio.tipoInstitucion.label" default="Tipo Institucion" /></span>
					
						<span class="property-value" aria-labelledby="tipoInstitucion-label"><g:fieldValue bean="${colegioInstance}" field="tipoInstitucion"/></span>
					
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
                                
                                <g:if test="${colegioInstance?.telefono}">
				<li class="fieldcontain">
					<span id="telefono-label" class="property-label"><g:message code="colegio.telefono.label" default="Telefono" /></span>
					
						<span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${colegioInstance}" field="telefono"/></span>
					
				</li>
				</g:if>
                                
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
						
				<g:if test="${colegioInstance?.nombreRector}">
				<li class="fieldcontain">
					<span id="nombreRector-label" class="property-label"><g:message code="colegio.nombreRector.label" default="Nombre Rector" /></span>
					
						<span class="property-value" aria-labelledby="nombreRector-label"><g:fieldValue bean="${colegioInstance}" field="nombreRector"/></span>
					
				</li>
				</g:if>
			
                                
                                
				<g:if test="${colegioInstance?.contactoEnInstitucion}">
				<li class="fieldcontain">
					<span id="contactoEnInstitucion-label" class="property-label"><g:message code="colegio.contactoEnInstitucion.label" default="Contacto En Institucion" /></span>
					
						<span class="property-value" aria-labelledby="contactoEnInstitucion-label"><g:fieldValue bean="${colegioInstance}" field="contactoEnInstitucion"/></span>
					
				</li>
				</g:if>
			
                                <g:if test="${colegioInstance?.confirmacion}">
				<li class="fieldcontain">
					<span id="confirmacion-label" class="property-label"><g:message code="colegio.confirmacion.label" default="Confirmacion" /></span>
					
						<span class="property-value" aria-labelledby="confirmacion-label"><g:formatBoolean boolean="${colegioInstance?.confirmacion}" /></span>
					
				</li>
				</g:if>
                                
				<g:if test="${colegioInstance?.observacionesGenerales}">
				<li class="fieldcontain">
					<span id="observacionesGenerales-label" class="property-label"><g:message code="colegio.observacionesGenerales.label" default="Observaciones Generales" /></span>
					
						<span class="property-value" aria-labelledby="observacionesGenerales-label"><g:fieldValue bean="${colegioInstance}" field="observacionesGenerales"/></span>
					
				</li>
				</g:if>
			
                                <g:if test="${colegioInstance?.visitaPrevia}">
				<li class="fieldcontain">
					<span id="visitaPrevia-label" class="property-label"><g:message code="colegio.visitaPrevia.label" default="Visita Previa" /></span>
					
						<span class="property-value" aria-labelledby="visitaPrevia-label"><g:formatBoolean boolean="${colegioInstance?.visitaPrevia}" /></span>
					
				</li>
				</g:if>
                                
				<g:if test="${colegioInstance?.representanteUN}">
				<li class="fieldcontain">
					<span id="representanteUN-label" class="property-label"><g:message code="colegio.representanteUN.label" default="Representante UN" /></span>
					
						<span class="property-value" aria-labelledby="representanteUN-label"><g:fieldValue bean="${colegioInstance}" field="representanteUN"/></span>
					
				</li>
				</g:if>
			
                                <g:if test="${colegioInstance?.fechaVisita}">
				<li class="fieldcontain">
					<span id="fechaVisita-label" class="property-label"><g:message code="colegio.fechaVisita.label" default="Fecha Visita" /></span>
					
						<span class="property-value" aria-labelledby="fechaVisita-label"><g:formatDate date="${colegioInstance?.fechaVisita}" /></span>
					
				</li>
				</g:if>
                                
				<g:if test="${colegioInstance?.observacionesFinales}">
				<li class="fieldcontain">
					<span id="observacionesFinales-label" class="property-label"><g:message code="colegio.observacionesFinales.label" default="Observaciones Finales" /></span>
					
						<span class="property-value" aria-labelledby="observacionesFinales-label"><g:fieldValue bean="${colegioInstance}" field="observacionesFinales"/></span>
					
				</li>
				</g:if>
			
                                <g:if test="${colegioInstance?.resultado}">
				<li class="fieldcontain">
					<span id="resultado-label" class="property-label"><g:message code="colegio.resultado.label" default="Resultado" /></span>
					
						<span class="property-value" aria-labelledby="resultado-label"><g:formatBoolean boolean="${colegioInstance?.resultado}" /></span>
					
				</li>
				</g:if>
			
                                
				<g:if test="${colegioInstance?.fechaLlamada}">
				<li class="fieldcontain">
					<span id="fechaLlamada-label" class="property-label"><g:message code="colegio.fechaLlamada.label" default="Fecha Llamada" /></span>
					
						<span class="property-value" aria-labelledby="fechaLlamada-label"><g:formatDate date="${colegioInstance?.fechaLlamada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.horaLlamada}">
				<li class="fieldcontain">
					<span id="horaLlamada-label" class="property-label"><g:message code="colegio.horaLlamada.label" default="Hora Llamada" /></span>
					
						<span class="property-value" aria-labelledby="horaLlamada-label"><g:fieldValue bean="${colegioInstance}" field="horaLlamada"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${colegioInstance?.actualizo}">
				<li class="fieldcontain">
					<span id="actualizo-label" class="property-label"><g:message code="colegio.actualizo.label" default="Actualizo" /></span>
					
						<span class="property-value" aria-labelledby="actualizo-label"><g:fieldValue bean="${colegioInstance}" field="actualizo"/></span>
					
				</li>
				</g:if>														
			
				<g:if test="${colegioInstance?.jornadas}">
				<li class="fieldcontain">
					<span id="jornadas-label" class="property-label"><g:message code="colegio.jornadas.label" default="Jornadas" /></span>
					
						<g:each in="${colegioInstance.jornadas}" var="j">
						<span class="property-value" aria-labelledby="jornadas-label"><g:link controller="jornada" action="show" id="${j.id}">${j?.tipo} - Sede ${j?.sede}</g:link></span>
						</g:each>
					
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
