package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

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
	
	
	def visitarLugar(LugarInteres unLugar) {
		if (lugares.contains(unLugar)) {
			// los lugares deben ser exactamente 3 
			// y no pueden estar repetidos
			lugares.get(lugares.indexOf(unLugar))
		} else {
			// exeption objeto no creado
		}
	}
	
	def viajarA(Pais conexionAerea) {
		// creo que no es necesario, quien sabe viajar?
		// el Caso o el Detective saben viajarA()
		// aqui solo sabe sus paises con conexion aerea
		// mucho peso cargarle los paises? o solo los nombres?
		paisesConexionAerea.get(paisesConexionAerea.indexOf(conexionAerea))
	}
	
	
}
