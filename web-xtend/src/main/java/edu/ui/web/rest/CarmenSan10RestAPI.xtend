package edu.ui.web.rest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.Dummy.CarmenSan10Dummy

@Controller
class CarmenSan10RestAPI {
	extension JSONUtils = new JSONUtils
	
	CarmenSan10Dummy carmenSan10
	
	new (CarmenSan10Dummy dummy) {
		carmenSan10 = dummy
	}
	
	
	/**
	 * paises - devuelve todos los paises
	 */
	@Get("/paises")
	def getPaises() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(carmenSan10.mapamundi.paisesMini.toJson)
	}
	
	/**
	 * paises - devuelve todos los paises
	 */
	@Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(carmenSan10.expediente.toJson)
	}
}