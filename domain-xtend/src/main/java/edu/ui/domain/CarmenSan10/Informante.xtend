package edu.ui.domain.CarmenSan10

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class Informante extends Ocupante {
	

	override String responderAlDetective(LugarInteres unLugar) {
		//si el ocupante es informante, es porque el villano paso por el pais

		unLugar.politicaDelLugar + unLugar.adicional
	}
	
	override crearMiTipo(Pais p, Caso c) {
		if(p.estaDentroDelRecorrido(c.planDeEscape)){
			return this
		}
	}
	
	
}
