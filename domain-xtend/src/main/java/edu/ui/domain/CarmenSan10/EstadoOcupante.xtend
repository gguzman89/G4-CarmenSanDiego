package edu.ui.domain.CarmenSan10

class EstadoOcupante 
{	
	Ocupante tipoOcupante;
	new()
	{
		tipoOcupante = new Cuidador()
	}
	
	def ocupanteActual(Pais paisActual, Caso caso)
	{
		if (paisActual.estaFueraDelRecorrido(caso.planDeEscape)){
			new Cuidador
		}
		if (paisActual.perteneceAlRecorrido(caso.planDeEscape)) { 
			new Informante
		}
		if (paisActual.esElFinalDelRecorrido(caso.planDeEscape)) { 
			new Villano()
		}
	}
}