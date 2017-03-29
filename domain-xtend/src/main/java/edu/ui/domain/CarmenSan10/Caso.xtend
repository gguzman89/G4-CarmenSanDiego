package edu.ui.domain.CarmenSan10

import java.util.List

class Caso {
	Villano responsable
	List<Pais> planDeEscape
	String reporteDelActoCriminal
	String objetoDelRobo
	Pais lugarDelRobo
	
	new (){}
	
	new (Villano quienFue, String queRobo, Pais dondeLoRobo){
		responsable = quienFue
		objetoDelRobo = queRobo
		lugarDelRobo = dondeLoRobo
	}
	
	def void setReporte (String reporte){
		reporteDelActoCriminal = reporte
	}
	
	def void posiblePlanDeEscape (List<Pais> rutaSugerida){
		planDeEscape = rutaSugerida
	}
	
	def void agregarUnPaisDeEscape (Pais ahiEsta){
		planDeEscape.add(ahiEsta)
	}
	
//	def Pais proximoPaisAVisitar(){
//		return planDeEscape.getFirst()
//	}
}