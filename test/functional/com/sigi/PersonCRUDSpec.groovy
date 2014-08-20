package com.sigi

import geb.spock.GebReportingSpec

import spock.lang.*

import pages.*

@Stepwise
class PersonCRUDSpec extends GebReportingSpec {
	
   def "go to login"() {
       when:
       browser.go "/SIGI/login/auth"

       then:
       browser.page.title == "Login"
   }
   
   def "equivocar login"() {
	when:
	j_username = "admin"
	j_password = "password.malo"
	submitInput.click()
	then:
	at "login/auth?login_error=1&format="
   }
   
   def "realizar login"() {
	when:
	j_username = "admin"
	j_password = "ana.franco.43159262"
	submitInput.click()
	then:
	at "base/index"
   }
   
}
