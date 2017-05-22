package edu.ui.domain.CarmenSan10

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Observable
@Accessors
class Cuidador extends Ocupante {
	
	new ()
	{
		nombre = "Cuidador"
	}
	
	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual) 
	{
		"Lo siento creo que se ha equivocado de cuidad, no hay nadie con esas caracteristicas"
	}
	
	override Ocupante actualizar(List<Pais> ps, Pais p, Villano v) 
	{
		if (p.esElFinalDelRecorrido(ps))
		{
			println("ahora soy el Villano")
			//p.ocupante = v
			return v
		}
		
		if (p.seEncuentraEnRecorridoSinElUltimoPais(ps))
		{
			println("ahora soy un Informante")
			//p.ocupante = new Informante()
			new Informante()
		}
		
	}
	
	
	
}
