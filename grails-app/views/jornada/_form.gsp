<%@ page import="com.climaescolar.Jornada" %>
<div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Jornada</a></li>
        <li><a data-toggle="tab" href="#menu1">Grados</a></li>
    </ul>
    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'colegio', 'error')} required">
                <label for="colegio">
                    <g:message code="jornada.colegio.label" default="Colegio" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select optionValue="nombreInstitucion" id="colegio" name="colegio.id" from="${com.climaescolar.Colegio.list()}" optionKey="id" required="" value="${jornadaInstance?.colegio?.id}" class="many-to-one"/>
            </div>
            <div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'sede', 'error')}">
                <label for="sede">
                    <g:message code="jornada.sede.label" default="Sede" />
                </label>
                <g:textField name="sede" maxlength="100" required="" value="${jornadaInstance?.sede}"/>
            </div>
            <div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'tipo', 'error')} required">
                <label for="tipo">
                    <g:message code="jornada.tipo.label" default="Tipo" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select name="tipo" from="${com.climaescolar.Jornada$TipoJornada?.values()}" keys="${com.climaescolar.Jornada$TipoJornada.values()*.name()}" required="" value="${jornadaInstance?.tipo?.name()}"/>
            </div>
        </div>
        <div id="menu1" class="tab-pane fade">
            <div class="fieldcontain ${hasErrors(bean: jornadaInstance, field: 'grados', 'error')} ">
                <label for="grados">
                    <g:message code="jornada.grados.label" default="Grados" />
                </label>

                <ul class="one-to-many">
                    <g:each in="${jornadaInstance?.grados}" var="g">
                        <li><g:link controller="grado" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    <li class="add">
                        <g:link controller="grado" action="create" params="['jornada.id': jornadaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'grado.label', default: 'Grado')])}</g:link>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>