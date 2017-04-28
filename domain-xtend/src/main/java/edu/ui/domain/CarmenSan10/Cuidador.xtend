package edu.ui.domain.CarmenSan10

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class Cuidador extends Ocupante {
	
	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual) 
	{
		"Lo siento creo que se ha equivocado de cuidad, no hay nadie con esas caracteristicas"
	}
	
	override actualizar(Caso caso, Pais p) 
	{
		if (p.esElFinalDelRecorrido(caso.planDeEscape))
		{
			p.ocupante= caso.responsable
		}
		if (p.seEncuentraEnRecorridoSinElUltimoPais(caso.planDeEscape))
		{
			p.ocupante= new Informante()
		}
	}
	
	
	
}
