package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	// cuando tiene informacion del malechor???
	
	Ocupante tipo
	String politicaDelLugar
	// creo que debe conoces en todo momento quien es el villano para dar informacion
	
	new (){}
	
	new(Ocupante cual, String politica) {
		tipo = cual
		politicaDelLugar = politica //new ArrayList<String> ()
	}
	
	def politicaDelLugar() {
	 	// las pistas/informacion ya vienen cargadas solo creo que hay q saber el tipo de ocupante
	 	// como y donde contemplar las pistas???
	 	
	 	//tipo.politicaDelLugarSegun(this)
	 	tipo.responderAlDetective
	 }
	
	def Ocupante quienEsta() {
		tipo
	}
}
