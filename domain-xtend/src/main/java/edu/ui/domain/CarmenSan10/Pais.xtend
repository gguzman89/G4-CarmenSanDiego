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
	//String politicaPais // move LugaresInteres
	
	new (){}
	
	new(String nombre) {
		nombrePais = nombre
		caracteristicaPais = new ArrayList<String>()
		lugares = new ArrayList<LugarInteres>()
		paisesConexionAerea = new ArrayList<Pais>()
	}
	
}
