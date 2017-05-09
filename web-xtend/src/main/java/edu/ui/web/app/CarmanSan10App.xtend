package edu.ui.web.app

import org.uqbar.xtrest.api.XTRest
import edu.ui.web.rest.CarmenSan10RestAPI
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.PaisMini

class CarmanSan10App {
	
	def static void main(String[] args) {
		var mapamundi = new Mapamundi
		
		mapamundi.setPaisMini(new PaisMini(1, "Venezuela"))
		mapamundi.setPaisMini(new PaisMini(6, "Brazil"))
		mapamundi.setPaisMini(new PaisMini(7, "Argentina"))
		
		
		XTRest.startInstance(new CarmenSan10RestAPI(mapamundi), 9000)
	}
}