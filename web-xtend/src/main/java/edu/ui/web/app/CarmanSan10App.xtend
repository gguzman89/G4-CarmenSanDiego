package edu.ui.web.app

import org.uqbar.xtrest.api.XTRest
import edu.ui.web.rest.CarmenSan10RestAPI

class CarmanSan10App {
	
	def static void main(String[] args) {
		
		XTRest.startInstance(new CarmenSan10RestAPI(), 9000)
	}
}