package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Caso
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.LugarDeInteres

@Observable
@Accessors
class LugarInteresAppModel 
{
	LugarDeInteres lugar
	Caso caso
	Detective detective
	
	new(){}
	
	new(LugarDeInteres lugar, Caso caso)
	{
		this.lugar = lugar
		this.caso = caso
	}
	
	def nombreDelCaso()
	{
		caso.objetoDelRobo
	}
	
	def nombreDelLugar()
	{
		lugar.nombre
	}
	
	def preguntarAlOcupante()
	{
		//lugar.responderAlDetective(detective.ubicacionActual)
	}

	def ordenDeArresto()
	{
		detective.ordenDeArresto
	}
	
	def esElFinDelJuego() 
	{
		// Implementarlo bien
		//caso.esElFinDelCaso(detective.ubicacionActual) && lugar.seEncuentraElVillano()
	}
	
	
}