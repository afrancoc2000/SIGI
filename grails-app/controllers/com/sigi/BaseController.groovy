package com.sigi

import grails.plugin.springsecurity.annotation.Secured

class BaseController {

	@Secured(["hasAnyRole('ROL_USER', 'ROL_ADMIN')"])
    def index() { }
}
