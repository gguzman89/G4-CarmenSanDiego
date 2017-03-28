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
	
	override politicaDelLugarSegun(LugarInteres unLugar) {
		//ondeToi = unLugar
		
		return "Vi a alguien como describe " + unLugar.getPoliticaDelLugar()
	}
	
	/*
	 * si el villano está en el país, nos da la información según la política del lugar. como?
	 */
	
}
