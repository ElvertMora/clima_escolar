
<%@ page import="com.climaescolar.Cordinador" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'cordinador.label', default: 'Cordinador')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-cordinador" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-cordinador" class="content scaffold-show" role="main">
                <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list cordinador">

                <g:if test="${cordinadorInstance?.username}">
                    <li class="fieldcontain">
                        <span id="username-label" class="property-label"><g:message code="cordinador.username.label" default="Username" /></span>

                        <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${cordinadorInstance}" field="username"/></span>

                    </li>
                </g:if>						

                <g:if test="${cordinadorInstance?.identificacion}">
                    <li class="fieldcontain">
                        <span id="identificacion-label" class="property-label"><g:message code="cordinador.identificacion.label" default="Identificacion" /></span>

                        <span class="property-value" aria-labelledby="identificacion-label"><g:fieldValue bean="${cordinadorInstance}" field="identificacion"/></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.nombres}">
                    <li class="fieldcontain">
                        <span id="nombres-label" class="property-label"><g:message code="cordinador.nombres.label" default="Nombres" /></span>

                        <span class="property-value" aria-labelledby="nombres-label"><g:fieldValue bean="${cordinadorInstance}" field="nombres"/></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.apellidos}">
                    <li class="fieldcontain">
                        <span id="apellidos-label" class="property-label"><g:message code="cordinador.apellidos.label" default="Apellidos" /></span>

                        <span class="property-value" aria-labelledby="apellidos-label"><g:fieldValue bean="${cordinadorInstance}" field="apellidos"/></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.genero}">
                    <li class="fieldcontain">
                        <span id="genero-label" class="property-label"><g:message code="cordinador.genero.label" default="Genero" /></span>

                        <span class="property-value" aria-labelledby="genero-label"><g:fieldValue bean="${cordinadorInstance}" field="genero"/></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.email}">
                    <li class="fieldcontain">
                        <span id="email-label" class="property-label"><g:message code="cordinador.email.label" default="Email" /></span>

                        <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${cordinadorInstance}" field="email"/></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.accountExpired}">
                    <li class="fieldcontain">
                        <span id="accountExpired-label" class="property-label"><g:message code="cordinador.accountExpired.label" default="Account Expired" /></span>

                        <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${cordinadorInstance?.accountExpired}" /></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.accountLocked}">
                    <li class="fieldcontain">
                        <span id="accountLocked-label" class="property-label"><g:message code="cordinador.accountLocked.label" default="Account Locked" /></span>

                        <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${cordinadorInstance?.accountLocked}" /></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.enabled}">
                    <li class="fieldcontain">
                        <span id="enabled-label" class="property-label"><g:message code="cordinador.enabled.label" default="Enabled" /></span>

                        <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${cordinadorInstance?.enabled}" /></span>

                    </li>
                </g:if>

                <g:if test="${cordinadorInstance?.passwordExpired}">
                    <li class="fieldcontain">
                        <span id="passwordExpired-label" class="property-label"><g:message code="cordinador.passwordExpired.label" default="Password Expired" /></span>

                        <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${cordinadorInstance?.passwordExpired}" /></span>

                    </li>
                </g:if>

            </ol>
            <g:form class="unal-form">
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${cordinadorInstance?.id}" />
                    <g:actionSubmit class="delete" action="edit" value="${message(code: 'default.button.edi.label', default: 'Edit')}" />

                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
