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
        def posActualX = 30
        def posActualY = 50

        log.info("posiciones: ${posActualX}, Y:${posActualY}")
        log.info("posiciones: X: " + posActualX)
        log.info("posiciones: Y: " + posActualY)

    	def climas = Clima.findAllByPosXBetweenAndPosYBetween(posActualX - 10, posActualX + 10, posActualY - 10, posActualY + 10)
        //def climas = Clima.findAll()

        def climasJSON = []
        climas.each { clima ->
            def climaJSON = [:]
            climaJSON['id'] = clima.id
            climaJSON['posX'] = clima.posX
            climaJSON['posY'] = clima.posY
            climaJSON['tipo'] = clima.tipo.toString()
            climaJSON['valor'] = clima.valor

            climasJSON.add(climaJSON)
        }

        render climasJSON as JSON
    }
}
