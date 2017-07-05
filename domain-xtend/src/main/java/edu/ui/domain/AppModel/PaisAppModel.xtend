package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.LugarDeInteres
import edu.ui.domain.CarmenSan10.Caracteristicas
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class PaisAppModel implements Serializable{
	
	String textCaracteristica
	LugarDeInteres lugarSeleccionado
	Pais pais
	Caracteristicas carSeleccionada
	Pais paisDeConexSeleccionado
	
	new(Pais pais) {
		this.pais = pais
	}
	
	def eliminarCaracteristicaSelecionada() {
		pais.eliminarCaracteristica(carSeleccionada)
		carSeleccionada = null
		ObservableUtils.firePropertyChanged(this,"caracteristicaPais", pais)
	}
	
	def agregarCaracteristica() {
		pais.agregarCaracteristica(new Caracteristicas(textCaracteristica))
		textCaracteristica = ""
		ObservableUtils.firePropertyChanged(this,"caracteristicaPais", pais)
	}
	
}