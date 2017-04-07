package edu.ui.domain.CarmenSan10


class Cuidador extends Ocupante {
	
	override String responderAlDetective(LugarInteres unLugar) {
		//si el ocupante es cuidador, es porque el villano no se encuentra en el pais
		return	"Lo siento creo que se ha equivocado de cuidad, no hay nadie con esas caracteristicas"
	}
	
}
