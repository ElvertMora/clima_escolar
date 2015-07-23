package com.climaescolar

class Aplicacion {

    String nombreAplicacion
    static hasMany = [encuestas:Encuesta]
    static constraints = {
    }
}
