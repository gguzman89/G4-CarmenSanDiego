package edu.ui.domain.CarmenSan10


class Informante extends Ocupante {
	
	//LugarInteres politicaPais  //
	
	override queSabesDe(Villano unVillano) {
		// metodo provisorio!
		if (unVillano.getLugar() == this.getLugar()){
			return "bueno te dire...."
		}
		else{
			return "no te puedo decir nada"
		}
	}
	
	/*
	 * si el villano está en el país, nos da la información según la política del lugar. como?
	 */
	
}
