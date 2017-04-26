package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import java.util.List

@Accessors
abstract class Ocupante extends Entity implements Cloneable {

	// Es un STRATEGY
	
	new() 
	{}
	
	def abstract Ocupante crearMiTipo(Pais p, Caso c)
	
	def abstract String responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual)
	
}