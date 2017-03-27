package edu.ui.domain.CarmenSan10

abstract class Ocupante {

	String nombre
	LugarInteres ondeToi
	// Es un STRATEGY
	// podes resolver los getters y setters con @Accesors
	// check LugarInteres

	new() {
	}
	
	def void setNombre (String name){
		nombre = name
	}
	
	def String getNombre (){
		return nombre
	}
	
	def void setLugar (LugarInteres lugar){
		ondeToi = lugar
	}
	
	def LugarInteres getLugar(){
		return ondeToi
	}
	
	def abstract String queSabesDe(Villano unVillano)
	
	def abstract void politicaDelLugarSegun(LugarInteres unLugar)
	// deberias setear el lugar y agregar informacion segun el tipo de ocupante
	
}
