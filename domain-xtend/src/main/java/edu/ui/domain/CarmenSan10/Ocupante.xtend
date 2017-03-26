package edu.ui.domain.CarmenSan10

abstract class Ocupante {

	String nombre
	LugarInteres ondeToi

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
}
