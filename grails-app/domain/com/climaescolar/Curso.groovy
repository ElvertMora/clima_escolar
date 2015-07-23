package com.climaescolar

class Curso implements Serializable{
    String curso
    Grado grado
    static belongsTo = [grado:Grado]
    static hasMany = [hojasDeRespuestas:HojaDeRespuestas]
    static constraints = {
    }
}
