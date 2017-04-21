package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

@Accessors
abstract class Ocupante extends Entity{

	String profesion
	// Es un STRATEGY
	// ... parece q nos mudamos a un STATE

	new() {}
	
	def abstract String responderAlDetective(LugarInteres unLugar)
	
}