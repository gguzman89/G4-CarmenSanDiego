package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	
	//el lugar de interes deberia saber a que pais pertenece,
	// ya que necesito preguntar si esta el villano en el pais
	Pais perteneceA

	String politicaDelLugar
	//segun el lugar sabe una pista
	
	Ocupante tipo
	
	new (){}
	
	new(Ocupante cual) {
		tipo = cual
	}
	
	def Ocupante quienEsta() {
		tipo
	}

	def preguntarAlOcupante() {
		tipo.responderAlDetective(this)// + adicional() AQUÍ NO VA
		}
	
	def abstract String adicional()

}
