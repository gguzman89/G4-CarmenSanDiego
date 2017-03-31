package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	// cuando tiene informacion del malechor???
	
	Ocupante tipo
	// creo que debe conoces en todo momento quien es el villano para dar informacion
	
	new (){}
	
	new(Ocupante cual, String politica) {
		tipo = cual
	}
	
	def preguntarAlOcupante() {
		tipo.responderAlDetective(this)
	}
	
	def abstract String adicional()

}
