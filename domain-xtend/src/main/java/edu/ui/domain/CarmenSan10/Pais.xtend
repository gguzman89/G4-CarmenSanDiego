package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import edu.ui.domain.Exceptions.YaEstaAgregadaEsaConexion

@Accessors
class Pais {
	
	String nombrePais
	List<String> caracteristicaPais
	List<LugarInteres> lugares
	List<Pais> paisesConexionAerea
	
	new (){}
	
	new(String nombre) {
		nombrePais = nombre
		caracteristicaPais = new ArrayList<String>()
		lugares = new ArrayList<LugarInteres>()
		paisesConexionAerea = new ArrayList<Pais>()
	}

//	def visitarLugar(LugarInteres unLugar) {
//		if (lugares.contains(unLugar)) {
//			// los lugares deben ser exactamente 3 
//			// y no pueden estar repetidos
//			lugares.get(lugares.indexOf(unLugar))
//		} else {
//			// exeption objeto no creado
//		}
//	}
	
	// y todo lo que se pueda jugar con una lista
	
	def tieneConexionAereaCon(Pais pais) {
		paisesConexionAerea.exists[p | p.nombrePais == pais.nombrePais]
	}
	
	def agregarConexionesAerea(Pais unPais) {
			paisesConexionAerea.add(unPais)
	}
	
	def agregarConexionSiPuede(Pais unPais) {
		if (! paisesConexionAerea.contains(unPais)) { // Returns true if this list contains the specified element.
			agregarConexionesAerea
		} else {
			throw new YaEstaAgregadaEsaConexion("Tenes un conexion/pais ya definida")
		}
	}
	
	def borrarConexionAerea(Pais unPais) {
		paisesConexionAerea.remove(unPais)
	}
	
}