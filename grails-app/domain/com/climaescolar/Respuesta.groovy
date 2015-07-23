package com.climaescolar

class Respuesta implements Serializable{
    private static final long serialVersionUID = 1
    HojaDeRespuestas hoja
    Encuesta encuesta
    Pregunta pregunta
    Opcion opcion
    static belongsTo = [hoja:HojaDeRespuestas]
    static constraints = {
    }
    static mapping = {
		id composite: ['hoja','encuesta', 'pregunta','opcion']
		version false
	}
}
