package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Ocupante {

	String profesion
	// Es un STRATEGY

	new() {}
	
	def abstract String responderAlDetective(LugarInteres unLugar)
	
}