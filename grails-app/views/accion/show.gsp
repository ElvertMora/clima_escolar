
<%@ page import="com.climaescolar.Accion" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'accion.label', default: 'Accion')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-accion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-accion" class="content scaffold-show container" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list accion">

                <g:if test="${accionInstance?.fecha}">
                    <li class="fieldcontain">
                        <span id="fecha-label" class="property-label"><g:message code="accion.fecha.label" default="Fecha" /></span>

                        <span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${accionInstance?.fecha}" /></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.responsable}">
                    <li class="fieldcontain">
                        <span id="responsable-label" class="property-label"><g:message code="accion.responsable.label" default="Responsable" /></span>

                        <span class="property-value" aria-labelledby="responsable-label"><g:fieldValue bean="${accionInstance}" field="responsable"/></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.colegio}">
                    <li class="fieldcontain">
                        <span id="colegio-label" class="property-label"><g:message code="accion.colegio.label" default="Colegio" /></span>

                        <span class="property-value" aria-labelledby="colegio-label"><g:link controller="colegio" action="show" id="${accionInstance?.colegio?.id}">${accionInstance?.colegio?.encodeAsHTML()}</g:link></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.confirmacion}">
                    <li class="fieldcontain">
                        <span id="confirmacion-label" class="property-label"><g:message code="accion.confirmacion.label" default="Confirmacion" /></span>

                        <span class="property-value" aria-labelledby="confirmacion-label"><g:formatBoolean boolean="${accionInstance?.confirmacion}" /></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.descripcion}">
                    <li class="fieldcontain">
                        <span id="descripcion-label" class="property-label"><g:message code="accion.descripcion.label" default="Descripcion" /></span>

                        <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${accionInstance}" field="descripcion"/></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.fechaEvento}">
                    <li class="fieldcontain">
                        <span id="fechaEvento-label" class="property-label"><g:message code="accion.fechaEvento.label" default="Fecha Evento" /></span>

                        <span class="property-value" aria-labelledby="fechaEvento-label"><g:formatDate date="${accionInstance?.fechaEvento}" /></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.nombreEvento}">
                    <li class="fieldcontain">
                        <span id="nombreEvento-label" class="property-label"><g:message code="accion.nombreEvento.label" default="Nombre Evento" /></span>

                        <span class="property-value" aria-labelledby="nombreEvento-label"><g:fieldValue bean="${accionInstance}" field="nombreEvento"/></span>

                    </li>
                </g:if>

                <g:if test="${accionInstance?.tipo}">
                    <li class="fieldcontain">
                        <span id="tipo-label" class="property-label"><g:message code="accion.tipo.label" default="Tipo" /></span>

                        <span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${accionInstance}" field="tipo"/></span>

                    </li>
                </g:if>

            </ol>
            <g:form class="unal-form">
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${accionInstance?.id}" />
                    <g:link class="edit" action="edit" id="${accionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
  <g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Editar')}"/>         
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
