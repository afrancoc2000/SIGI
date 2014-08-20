package com.sigi

import org.openqa.selenium.firefox.FirefoxDriver

driver = { 
	def driverInstance = new FirefoxDriver() 
	driverInstance.manage().window().maximize() 
	driverInstance
}