package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	
	Ocupante tipo
	
	new (){}
	
	new(Ocupante cual, String politica) {
		tipo = cual
	}
	
	def preguntarAlOcupante() {
		tipo.responderAlDetective(this)
	}
	
	def abstract String adicional()

}
