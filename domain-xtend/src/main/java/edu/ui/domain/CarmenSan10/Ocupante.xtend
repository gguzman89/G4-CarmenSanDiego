package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

//Clase abstracta que inplementa al IOcupante
@Accessors
abstract class Ocupante implements IOcupante {

	//LugarInteres ondeToi
	String politicaDelLugar
	// Es un STRATEGY

	new() {}
	

	override responderAlDetective(LugarInteres ondeToi)	
	
	//def abstract String adicional()
	
	
	}
