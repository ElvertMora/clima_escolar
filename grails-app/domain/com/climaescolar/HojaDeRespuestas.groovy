package com.climaescolar

class HojaDeRespuestas implements Serializable {
    String consecutivo
    String codHR
    Curso curso
    static belongsTo = [curso:Curso]
    static hasMany = [respuestas:Respuesta]
    static constraints = {
    }
}
