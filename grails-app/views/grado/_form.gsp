<%@ page import="com.climaescolar.Grado" %>
<div class="container">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Grado</a></li>
        <li><a data-toggle="tab" href="#menu1">Cursos</a></li>
    </ul>
    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'grado', 'error')} required">
                <label for="grado">
                    <g:message code="grado.grado.label" default="Grado" />
                    <span class="required-indicator">*</span>
                </label>
                <g:field name="grado" type="number" value="${gradoInstance.grado}" required=""/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'jornada', 'error')} required">
                <label for="jornada">
                    <g:message code="grado.jornada.label" default="Jornada" />
                    <span class="required-indicator">*</span>
                </label>
                <g:select id="jornada" name="jornada.id" from="${com.climaescolar.Jornada.list()}" optionKey="id" required="" value="${gradoInstance?.jornada?.id}" class="many-to-one"/>
            </div>
        </div>
        <div id="menu1" class="tab-pane fade">

            <div class="fieldcontain ${hasErrors(bean: gradoInstance, field: 'cursos', 'error')} ">
                <label for="cursos">
                    <g:message code="grado.cursos.label" default="Cursos" />

                </label>
                <ul class="one-to-many">
                    <g:each in="${gradoInstance?.cursos}" var="c">
                        <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                        </g:each>
                    <li class="add">
                        <g:link controller="curso" action="create" params="['grado.id': gradoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>