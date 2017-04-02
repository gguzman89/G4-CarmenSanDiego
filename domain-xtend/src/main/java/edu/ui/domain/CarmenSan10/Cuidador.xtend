package edu.ui.domain.CarmenSan10


class Cuidador extends Ocupante {
	
	override String responderAlDetective() {
		//si el ocupante es cuidador, es porque el villano no se encuentra en el pais, entonces
		//le dice al detective que vuelva por donde vino
		return "se equivoco de pais, vuelva por donde vino"
	}
	
	
	/*
	 * si el villano no se encuentra en el país
	 * Los cuidadores nos informan que nos hemos equivocado de país y mejor volvemos por donde vinimos.
	 * cuando???
	 */
	 
}
