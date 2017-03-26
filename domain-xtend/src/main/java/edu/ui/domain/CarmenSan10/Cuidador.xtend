package edu.ui.domain.CarmenSan10


class Cuidador extends Ocupante {
	
	override queSabesDe(Villano unVillano) {
		//metodo propuesto: solo borrador
		if (unVillano.getLugar() == this.getLugar()){
			return ""
		}
		else{
			return "se equivocaron de pais, vayase de aqui"
		}
	}
	
	/*
	 * si el villano no se encuentra en el país
	 * Los cuidadores nos informan que nos hemos equivocado de país y mejor volvemos por donde vinimos.
	 * cuando???
	 */
	 
}
