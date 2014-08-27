package com.sigi

import grails.plugin.springsecurity.annotation.Secured

class BaseController {

	@Secured(["hasAnyRole('ROL_USER', 'ROL_ADMIN')"])
    def index() { }
    
    def climas(){

	def ubicacionJSON = request.JSON
	def posActualX = ubicacionJSON.posX
	def posActualY = ubicacionJSON.posY
	
    	def climas = Clima.findAllByPosXBetweenAndPosYBetween(posXActual - 10, posXActual + 10, posYActual - 10, posYActual + 10)

	def climasJSON = []
	climas.each { clima ->
		def climaJSON = [:]
		climaJSON['id'] = clima.id
		climaJSON['posX'] = clima.posX
		climaJSON['posY'] = clima.posY
		climaJSON['tipo'] = clima.tipo
		climaJSON['valor'] = clima.valor

		climasJSON.add(climaJSON)
	}
	
	render climasJSON as JSON
    }
}
