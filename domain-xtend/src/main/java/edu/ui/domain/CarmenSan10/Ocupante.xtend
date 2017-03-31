package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

//Clase abstracta que implementa al IOcupante
@Accessors
abstract class Ocupante implements IOcupante {

	String politicaDelLugar
	// Es un STRATEGY

	new() {}
	

	override responderAlDetective(LugarInteres ondeToi)		
	
	}
