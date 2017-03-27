package edu.ui.domain.CarmenSan10

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class LugarInteres {
	
	Ocupante tipo
	List<String> politicaDelLugar
	
	new (){}
	
	new(Ocupante cual) {
		tipo = cual
		politicaDelLugar = new ArrayList<String> ()
	}
	
	def politicaDelLugar() {
	 	var hoyEsta = tipo // quienEsta()
	 	// las pistas/informacion ya vienen cargadas solo creo que hay q saber el tipo de ocupante
	 	// como y donde conteplar las pistas???
	 	
	 	hoyEsta.politicaDelLugarSegun(this)
	 }
	
	def Ocupante quienEsta() {
		tipo
	}
}
