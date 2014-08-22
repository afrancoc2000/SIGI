package com.sigi

import geb.spock.GebReportingSpec

import spock.lang.*

import pages.*

@Stepwise
class LoginSpec extends GebReportingSpec {
	
   def "go to login"() {
       when:
	   def urlAmbiente = ""
	   def ambiente = System.getProperty("ambiente")
	   if (ambiente == "jenkinsTest"){
	   		urlAmbiente = "http://sigi-test.herokuapp.com"
	   }
	   else if (ambiente == "jenkinsProd"){
		   urlAmbiente = "http://sigi-app.herokuapp.com"
	   }
	   else{
		   urlAmbiente = "/SIGI"
	   }
       browser.go (urlAmbiente + "/base/index") //"http://sigi-test.herokuapp.com/SIGI/login/auth"

       then:
       browser.page.title == "Login"
   }
   
   def "equivocar login"() {
	   when:
	   j_username = "admin"
	   j_password = "password.malo"
	   $("#submit").click()

	   then:
	   browser.page.title == "Login"
  }
  
  def "realizar login"() {
	   when:
	   j_username = "admin"
	   j_password = "ana.franco.43159262"
	   $("#submit").click()

	   then:
	   browser.page.title == "SIGI"
  }
   
}