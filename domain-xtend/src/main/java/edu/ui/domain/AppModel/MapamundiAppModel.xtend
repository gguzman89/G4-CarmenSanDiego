package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.Mapamundi

@Accessors
@Observable
class MapamundiAppModel {
	
	Mapamundi mapa
	Pais paisSeleccionado
	
	def caracteristicasPaisSeleccionado () 
	{
		paisSeleccionado.caracteristicaPais
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