package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors
class Biblioteca extends LugarInteres {
	
	String infoAdicional
	
	def pistaSobreHobbies() {
		var Random soloTalves = new Random
		var int rnd = soloTalves.nextInt(99)
		rnd
	}
	
	def pistaAdicional() {
		
		pistaSobreHobbies >= 49
	}
	
	override adicional() {
		if(pistaAdicional)
		infoAdicional
	}
	
	/*
	 * cuando tiene información del malechor da una pista relacionada con el país de destino y otra con las señas particulares. 
	 * Además el 50% de las veces da una pista más sobre los hobbies.
	 */
	static class HelloWorld {
		  def static void main(String[] args) {
		    println("Hello World")
		    println(pistaSobreHobbies())
		}
		  
		  def static pistaSobreHobbies() {
			var Random soloTalves = new Random
			var int rnd = soloTalves.nextInt(1)
			soloTalves.nextBoolean
			rnd
		}
	}
	
	
}
