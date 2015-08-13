<%@ page import="com.climaescolar.Accion" %>
<div class="container">
    <g:hiddenField name="colegio.id" value="${accionInstance?.colegio?.id}"/>
    <p>${accionInstance?.colegio?.nombreInstitucion}</p>
    <div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'tipo', 'error')} required">
        <label for="tipo">
            <g:message code="accion.tipo.label" default="Tipo" />
            <span class="required-indicator">*</span>
        </label>
        <g:select onChange="valueOnChange(this)" name="tipo" from="${com.climaescolar.Accion$TipoAccion?.values()}" keys="${com.climaescolar.Accion$TipoAccion.values()*.name()}" required="" value="${accionInstance?.tipo?.name()}"/>
    </div>
    <div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'nombreEvento', 'error')} ">
        <label for="nombreEvento" id="llamada" >
            <g:message code="accion.nombreEvento.label" default="Telefono" />
        </label>
        <label for="nombreEvento" id="evento" style="display: none">
            <g:message code="accion.nombreEvento.label" default="Nombre del Evento" />
        </label>
        <label for="nombreEvento" id="email" style="display: none">
            <g:message code="accion.nombreEvento.label" default="E-mail" />
        </label>
        <label for="nombreEvento" id="visita" style="display: none">
            <g:message code="accion.nombreEvento.label" default="Dirección" />
        </label>
        <g:textField name="nombreEvento" value="${accionInstance?.nombreEvento}"/>
    </div>
    
    <div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'fechaEvento', 'error')} required">
        <label for="fechaEvento" id="fllamada" >
            <g:message code="accion.fechaEvento.label" default="Fecha de llamada" />
            <span class="required-indicator">*</span>
        </label>
        <label for="fechaEvento" id="fevento" style="display: none">
            <g:message code="accion.fechaEvento.label" default="Fecha del Evento" />
            <span class="required-indicator">*</span>
        </label>
        <label for="fechaEvento" id="femail" style="display: none">
            <g:message code="accion.fechaEvento.label" default="Fecha de envio" />
            <span class="required-indicator">*</span>
        </label>
        <label for="fechaEvento" id="fvisita" style="display: none">
            <g:message code="accion.fechaEvento.label" default="Fecha de visita" />
            <span class="required-indicator">*</span>
        </label>
        <g:datePicker name="fechaEvento" precision="minute"  value="${accionInstance?.fechaEvento}"  />
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
    
    <div class="fieldcontain ${hasErrors(bean: accionInstance, field: 'delegadoUn', 'error')} required">
	<label for="delegadoUn">
		<g:message code="accion.delegadoUn.label" default="delegado UN" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="nombres" id="delegadoUn" name="delegadoUn.id" from="${com.climaescolar.Cordinador.list()}" optionKey="id" required="" value="${accionInstance?.delegadoUn?.id}" class="many-to-one"/>
</div>
    
</div>

<script type="text/javascript">
function valueOnChange(sel) {
      if (sel.value=="LLAMADA"){
           divL = document.getElementById("llamada");
           divL.style.display = "";

           divT = document.getElementById("evento");
           divT.style.display = "none";
           
           divE = document.getElementById("email");
           divE.style.display = "none";
           
           divV = document.getElementById("visita");
           divV.style.display = "none";
           
           divfL = document.getElementById("fllamada");
           divfL.style.display = "";

           divfT = document.getElementById("fevento");
           divfT.style.display = "none";
           
           divfE = document.getElementById("femail");
           divfE.style.display = "none";
           
           divfV = document.getElementById("fvisita");
           divfV.style.display = "none";

      }else if (sel.value=="CORREO"){

           divL = document.getElementById("llamada");
           divL.style.display = "none";

           divT = document.getElementById("evento");
           divT.style.display = "none";
           
           divE = document.getElementById("email");
           divE.style.display = "";
           
           divV = document.getElementById("visita");
           divV.style.display = "none";
           
           divfL = document.getElementById("fllamada");
           divfL.style.display = "none";

           divfT = document.getElementById("fevento");
           divfT.style.display = "none";
           
           divfE = document.getElementById("femail");
           divfE.style.display = "";
           
           divfV = document.getElementById("fvisita");
           divfV.style.display = "none";
      }else if (sel.value=="VISITA"){

           divL = document.getElementById("llamada");
           divL.style.display = "none";

           divT = document.getElementById("evento");
           divT.style.display = "none";
           
           divE = document.getElementById("email");
           divE.style.display = "none";
           
           divV = document.getElementById("visita");
           divV.style.display = "";
                      divfL = document.getElementById("fllamada");
           divfL.style.display = "none";

           divfT = document.getElementById("fevento");
           divfT.style.display = "none";
           
           divfE = document.getElementById("femail");
           divfE.style.display = "none";
           
           divfV = document.getElementById("fvisita");
           divfV.style.display = "";
      }else if (sel.value=="EVENTO"){
           divL = document.getElementById("llamada");
           divL.style.display = "none";

           divT = document.getElementById("evento");
           divT.style.display = "";
           
           divE = document.getElementById("email");
           divE.style.display = "none";
           
           divV = document.getElementById("visita");
           divV.style.display = "none";
                      divfL = document.getElementById("fllamada");
           divfL.style.display = "none";

           divfT = document.getElementById("fevento");
           divfT.style.display = "";
           
           divfE = document.getElementById("femail");
           divfE.style.display = "none";
           
           divfV = document.getElementById("fvisita");
           divfV.style.display = "none";
      }
}
</script>