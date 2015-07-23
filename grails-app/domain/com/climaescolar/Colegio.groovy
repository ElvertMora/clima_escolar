package com.climaescolar

class Colegio implements Serializable {
    def springSecurityService
    private static final Date NULL_DATE = new Date(0)
    //no modificable
    String dane
    String nombreLocalidad
    String clase
    String nombreInstitucion
    //entregados puedenser modificados
    String direccion
    String barrio
    String telefono
    String email1
    String email2
    String nombreRector
    //para ser llenados durante la sensibilizacion
    Date fechaLlamada
    String nombreProResponsable
    //si confirmacion no colocar colegio como critico
    Boolean confirmacion
    String observaciones
    
    Boolean visitaPrevia
    String representanteUN
    Date fecha
    
    Boolean resultado
    String observaciones2
    
    Date signupDate = NULL_DATE
    String lastUpdatedBy
    String hourUpdate 
    
    static hasMany = [jornadas:Jornada]
    static constraints = {
        email1 (email: true, nullable: false, blank: false)
        email2 (email: true, nullable: true, blank: true )
        telefono(nullable: false, blank: false, maxSize: 15)
        dane (nullable: false, blank: false, maxSize: 30)
        nombreLocalidad (nullable: false, blank: false, maxSize: 30)
        clase (nullable: false, blank: false, maxSize: 15)
        nombreInstitucion (nullable: false, blank: false, maxSize: 100)
        direccion (nullable: false, blank: false, maxSize: 100)
        barrio (nullable: false, blank: false, maxSize: 100)
        nombreRector (nullable: false, blank: false, maxSize: 100)
        nombreProResponsable (nullable: true, blank: true, maxSize: 100)
        observaciones (nullable: true, blank: true, maxSize: 100)
        representanteUN (nullable: true, blank: true, maxSize: 100)
        observaciones2 (nullable: true, blank: true, maxSize: 100)
        lastUpdatedBy nullable: true
        hourUpdate nullable: true
    }
    
    def beforeUpdate() {
      lastUpdatedBy = springSecurityService.getCurrentUser().username
      signupDate = new Date()
      hourUpdate = (new Date().getHours()) + ':' + (new Date().getMinutes())
    }
}
