package edu.ui.domain.CarmenSan10


class Informante extends Ocupante {
	

	override String responderAlDetective() {
		//si el ocupante es informante, es porque el villano se encuentra en el pais
		// entonces da una pista, de acuerdo al lugar donde se encuentre: Biblioteca, Bar...
		return this.darPista()
		
		// caracteristicaDelLugar == unLugar.politicaDelLugar
	}
	
	
}
