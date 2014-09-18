package com.sigi

class Clima {

    enum TipoClima{
        TEMPERATURA, LLUVIA, CONTAMINACION
    }

    double latitud
    double longitud
    double valor
    TipoClima tipo

    static constraints = {
    }
}
