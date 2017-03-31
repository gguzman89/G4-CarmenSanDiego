package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

//Clase abstracta que inplementa al IOcupante
@Accessors
abstract class Ocupante implements IOcupante {

	String nombre
	LugarInteres ondeToi
	// Es un STRATEGY
	// podes resolver los getters y setters con @Accesors
	// check LugarInteres

	new() {}
	

	override String responderAlDetective()
	
	}
