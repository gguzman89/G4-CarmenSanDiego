package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
<<<<<<< HEAD
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
=======
>>>>>>> f1a86029289c1211200bc4fa3e9283c6f2cd2ae2
import edu.ui.domain.CarmenSan10.Mapamundi

@Accessors
@Observable
class MapamundiAppModel {
	
	Mapamundi mapa
	Pais itemSeleccionado
	
	def caracteristicasPaisSeleccionado () 
	{
		itemSeleccionado.caracteristicaPais
	}
	
	def String getNombreCaso() {
		
	}
	
	def String getNombreVillano() {
	}
	
	def String getNombrePais() {
	}
	
	def void getViajar() {
	}
	
	def String getNombreLugar() {
	}
	
	def void validacionContinuar() {
	}
	
	def String getObjetoRobado() {
	}
	
}