package com.climaescolar

class Accion {
	
	def springSecurityService
	
	enum TipoAccion {LLAMADA,CORREO, VISITA, EVENTO}
	
	String descripcion
	
	Date fecha
	
	Date fechaEvento
	
	String nombreEvento
	
	String responsable
	
        Cordinador delegadoUn
        
	TipoAccion tipo
	
	Boolean confirmacion
	
	static belongsTo = [colegio: Colegio]

    static constraints = {
		tipo(nullable: false)
		fecha(nullable:true)
		responsable(nullable:true)
    }
	
    def beforeInsert() {
      responsable = springSecurityService.getCurrentUser().username
      fecha = new Date()
    }
}
