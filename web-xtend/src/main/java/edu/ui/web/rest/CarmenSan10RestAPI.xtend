package edu.ui.web.rest

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import edu.ui.domain.CarmenSan10.Mapamundi

@Controller
class CarmenSan10RestAPI {
	extension JSONUtils = new JSONUtils
	
	Mapamundi mapamundi
	
	new (Mapamundi mapa) {
		mapamundi = mapa
	}
	
	
	/**
	 * paises - devuelve todos los paises
	 */
	@Get("/paises")
	def getPaises() {
		response.contentType = ContentType.APPLICATION_JSON
		ok(mapamundi.paisesMini.toJson)
	}
}