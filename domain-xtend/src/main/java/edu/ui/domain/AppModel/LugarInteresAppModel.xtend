package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.LugarInteres
import edu.ui.domain.CarmenSan10.Caso
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.Detective

@Observable
@Accessors
class LugarInteresAppModel 
{
	LugarInteres lugar
	Caso caso
	Detective detective
	
	new(){}
	
	new(LugarInteres lugar, Caso caso)
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
		caso.esElFinDelCaso(detective.ubicacionActual)
	}
	
}