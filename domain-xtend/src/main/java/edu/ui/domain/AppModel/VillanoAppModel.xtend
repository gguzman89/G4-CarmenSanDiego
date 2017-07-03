package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import org.uqbar.commons.model.ObservableUtils

class VillanoAppModel {
	
	Villano villano
	Caracteristicas seniaSelected
	Caracteristicas hobbieSelected
	
	String textCaracteristica
	
	String textSenia
	
	new() {	}
	
	new(Villano vilSelected) {
		villano = vilSelected
	}
	
	def agregarCaracteristicaHobbie() {
		villano.agregarHobbie(new Caracteristicas(textCaracteristica))
		textCaracteristica = ""
		ObservableUtils.firePropertyChanged(this, "hobbies", villano)
	}
	
	def eliminarHobbie() {
		villano.eliminarHobbie(hobbieSelected)
		hobbieSelected = null
		ObservableUtils.firePropertyChanged(this, "hobbies", villano)
	}
	
	def eliminarSenia() {
		villano.eliminarSenia(seniaSelected)
		seniaSelected = null
		ObservableUtils.firePropertyChanged(this,"seniasParticulares", villano)
	}
	
	def agregarCaracteristicaSenia() {
		villano.agregarSenia(new Caracteristicas(textSenia))
		textSenia = ""
		ObservableUtils.firePropertyChanged(this, "seniasParticulares", villano)
	}
	
}