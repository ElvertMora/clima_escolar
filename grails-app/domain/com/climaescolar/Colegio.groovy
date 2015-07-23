package com.climaescolar

class Colegio implements Serializable {
    
    private static final long serialVersionUID = 1
    
    def springSecurityService
    
    private static final Date NULL_DATE = new Date(0)   
    
    enum TipoColegio{
        DISTRITAL,DISTRITAL_CONCESION,PRIVADO,PRIVADO_CONVENIO
    }
    
    //no modificable
    String dane
    String nombreLocalidad
    TipoColegio tipoInstitucion
    String nombreInstitucion
    //entregados puedenser modificados
    String direccion
    String barrio
    String telefono
    String email1
    String email2
    String nombreRector
    
    //para ser llenados durante la sensibilizacion
 
    String contactoEnInstitucion
    //si confirmacion no colocar colegio como critico
    Boolean confirmacion
    String observacionesGenerales
    
    Boolean visitaPrevia
    String representanteUN
    Date fechaVisita
    
    Boolean resultado
    String observacionesFinales
    
    Date fechaLlamada = NULL_DATE
    String actualizo
    String horaLlamada 
    Localidad localidad
    
    static hasMany = [jornadas : Jornada]
    
    static constraints = {
        email1 (email: true, nullable: false, blank: false)
        email2 (email: true, nullable: true, blank: true )
        telefono(nullable: false, blank: false, maxSize: 35)
        dane (nullable: false, blank: false, maxSize: 30)
        nombreInstitucion (nullable: false, blank: false, maxSize: 100)
        direccion (nullable: false, blank: false, maxSize: 100)
        barrio (nullable: false, blank: false, maxSize: 100)
        nombreRector (nullable: false, blank: false, maxSize: 100)
        contactoEnInstitucion (nullable: true, blank: true, maxSize: 100)
        observacionesGenerales (nullable: true, blank: true, maxSize: 100)
        representanteUN (nullable: true, blank: true, maxSize: 100)
        observacionesFinales (nullable: true, blank: true, maxSize: 100)
        fechaLlamada nullable: true
        horaLlamada nullable: true
    }
    
    def beforeUpdate() {
      actualizo = springSecurityService.getCurrentUser().username
      fechaLlamada = new Date()
      horaLlamada = (new Date().getHours()) + ':' + (new Date().getMinutes())
    }
}
