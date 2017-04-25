package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Pais
import java.io.Serializable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.LugarInteres

@Accessors
@Observable
class PaisAppModel implements Serializable{
	
	String featureSelected
	LugarInteres lugarSelected
	Pais paisSelected
	//String nombrePais
	
	/**
	 * String nombrePais
	 * List<String> caracteristicaPais	
	 * List<LugarInteres> lugares	
	 * List<Pais> paisesConexionAerea
	 */
	
	new(Pais pais) {
		paisSelected = pais
	}
	
	def paisesConexionAerea() {
		paisSelected.paisesConexionAerea
	}
	
	def lugares() {
		paisSelected.lugares
	}
	
	def nombrePais() {
		paisSelected.nombrePais
	}
	
}