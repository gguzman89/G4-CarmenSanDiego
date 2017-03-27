package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Villano extends Ocupante {
	
	//String nombre// ya lo hereda de ocupante
	String sexo
	List<String> seniasParticulares
	List<String> hobbies
	
	def void setSexo(String sex){
		sexo = sex
	}
	
	def String getSexo(){
		return sexo
	}
	
	def void setSeniasParticulares(List<String> senias){
		seniasParticulares = senias
	}
	
	def List<String> getSeniasParticulares (){
		return seniasParticulares
	}
	
	def void setOtraSeniaMas (String senia){
		seniasParticulares.add(senia)
	}
	
	override queSabesDe(Villano unVillano) {
		//metodo provisorio
		if (unVillano.getNombre()== this.getNombre()){
			return "pum pum pum, rayos! falle!!"
		}
		else{
			return "?"
		}
	}
	
	override politicaDelLugarSegun(LugarInteres unLugar) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	/*
	 * si es su destino final. quien?
	 * Los villanos si están en el país pero no en el lugar al que visitamos intentan matarnos y fallan.
	 */
}
