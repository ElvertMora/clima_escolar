package com.climaescolar

class Grado implements Serializable {
    int grado
    Jornada jornada
    static belongsTo = [jornada:Jornada]
    static hasMany = [cursos:Curso]
    static constraints = {
    }
}
