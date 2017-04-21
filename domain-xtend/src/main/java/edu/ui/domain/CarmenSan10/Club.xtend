package edu.ui.domain.CarmenSan10

import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Club extends LugarInteres {
	
	String infoHobbies
	
	override getNombre()
	{
		"Club"
	}
	
	def pistaSobreHobbies() {
		var Random soloTalves = new Random
		var int rnd = soloTalves.nextInt(75)
		rnd
	}
	
	def pistaAdicional() {
		
		pistaSobreHobbies <= 70
	}
	
	override adicional() {
		if(pistaAdicional)
		infoHobbies
	}
	
	/*
	 * cuando tiene información del malechor da dos pistas sobre las señas particulares y 
	 * el 70% de las veces agrega información de sus hobbies (adicional a las dos señas particulares).
	 */
}
