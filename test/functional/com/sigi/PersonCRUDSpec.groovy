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
   
}