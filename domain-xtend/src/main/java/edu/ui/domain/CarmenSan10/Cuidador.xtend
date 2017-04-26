package edu.ui.domain.CarmenSan10

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class Cuidador extends Ocupante {
	
	override crearMiTipo(Pais p, Caso c) {
		if (p.estaFueraDelRecorrido(c.planDeEscape)){
			return this
		}
	}
	
	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual) 
	{
		"Lo siento creo que se ha equivocado de cuidad, no hay nadie con esas caracteristicas"
	}
	
	
	
}
