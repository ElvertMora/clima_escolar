package com.climaescolar

class Jornada implements Serializable{

    enum TipoJornada{
        UNICA,MAÑANA,TARDE,NOCTURNA
    }
    TipoJornada tipo
    Colegio colegio
    static belongsTo = [colegio:Colegio]
    static hasMany = [grados:Grado]
    static constraints = {
    }
}
