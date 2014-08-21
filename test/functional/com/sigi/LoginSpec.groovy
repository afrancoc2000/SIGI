package com.sigi

import geb.spock.GebReportingSpec

import spock.lang.*

import pages.*

@Stepwise
class LoginSpec extends GebReportingSpec {
	
   def "go to login"() {
       when:
	   //def urlAmbiente = System.getenv("RUTA_AMBIENTE")
	   def urlAmbiente = "http://sigi-test.herokuapp.com"
       browser.go (urlAmbiente + "/SIGI/login/auth") //"http://sigi-test.herokuapp.com/SIGI/login/auth"

       then:
       browser.page.title == "Login"
   }
   
}