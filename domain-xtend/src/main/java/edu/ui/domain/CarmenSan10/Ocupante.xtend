package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.TransactionalAndObservable
import java.util.List

@TransactionalAndObservable
@Accessors
abstract class Ocupante extends Entity implements Cloneable {

	/**
	 * State -> actualizar
	 * Strategy -> responderAlDetective
	 */
	 String nombre 
	
	new() {}
	
	def abstract String responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual)
	
	def Ocupante actualizar (List<Pais> ps, Pais p, Villano v)
	
	
}