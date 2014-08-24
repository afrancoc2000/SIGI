package com.sigi

class Clima {

    enum TipoClima{
        TEMPERATURA, LLUVIA, CONTAMINACION
    }

    double ubicacionX
    double ubicacionY
    double valor
    TipoClima tipoClima

    static constraints = {
    }
}
