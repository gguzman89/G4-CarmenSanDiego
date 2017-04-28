package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
abstract class Ocupante extends Entity implements Cloneable {

	/**
	 * State -> actualizar
	 * Strategy -> responderAlDetective
	 */
	
	new() 
	{}
	
	def abstract String responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual)
	
	def void actualizar (Caso caso, Pais p)
	
	
}