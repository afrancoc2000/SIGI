package com.sigi

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

class BaseController {

	@Secured(["hasAnyRole('ROL_USER', 'ROL_ADMIN')"])
    def index() { }

    @Secured(["hasAnyRole('ROL_USER', 'ROL_ADMIN')"])
    def climas(){

        log.info(request.JSON)
        def dataJSON = request
        log.info(dataJSON)
        def lat = dataJSON.lat
        def lon = dataJSON.lon

        log.info("posiciones: LAT: ${lat}, LON:${lon}")

    	//def climas = Clima.findAllByLatitudBetweenAndLongitudBetween(posActualX - 10, posActualX + 10, posActualY - 10, posActualY + 10)
        def climas = Clima.findAll()

        def climasJSON = []
        climas.each { clima ->
            def climaJSON = [:]
            climaJSON['id'] = clima.id
            climaJSON['latitud'] = clima.latitud
            climaJSON['longitud'] = clima.longitud
            climaJSON['tipo'] = clima.tipo.toString()
            climaJSON['valor'] = clima.valor

            climasJSON.add(climaJSON)
        }

        render climasJSON as JSON
    }
}
