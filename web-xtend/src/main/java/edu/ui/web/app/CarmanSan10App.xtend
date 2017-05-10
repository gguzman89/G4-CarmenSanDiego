package edu.ui.web.app

import org.uqbar.xtrest.api.XTRest
import edu.ui.web.rest.CarmenSan10RestAPI
import edu.ui.domain.Dummy.CarmenSan10Dummy

class CarmanSan10App {
	
	def static void main(String[] args) {
		
		var dummy = new CarmenSan10Dummy
		
		XTRest.startInstance(new CarmenSan10RestAPI(dummy), 9000)
	}
}