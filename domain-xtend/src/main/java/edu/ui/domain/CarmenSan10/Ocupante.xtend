package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

//Clase abstracta que implementa al IOcupante
@Accessors
abstract class Ocupante implements IOcupante {

	String profesion
	// en el juego aparece como Guardia de Seguridad, Guia Turistica, Embajador... 
	LugarInteres ondeToi
	// Es un STRATEGY

	new() {}
	
	def setLugar(LugarInteres ciudad){
		ondeToi = ciudad
	}
	
	def String darPista(){
		//devuelve la pista de acuerdo a la politica del lugar: Biblioteca, Club....
		return ondeToi.getPoliticaDelLugar()
	}
			
	
}