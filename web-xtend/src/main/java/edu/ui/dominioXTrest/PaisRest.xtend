package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import edu.ui.domain.CarmenSan10.LugarDeInteres

@Accessors
class PaisRest {
	
	String nombre
	Integer id
	
	new() {
		nombre = "" //ver si lo necesitamos
	}
	
	new(Integer identi, String name) {
		id = identi
		nombre = name
	}
}

@Accessors
class PaisConID {
	
	Integer id
	String nombre
	List<LugarDeInteres> lugares
	List<PaisRest> mini_conexiones
	
	new() {		
	}
	
	new(String nombrePais, List<LugarDeInteres> interes, Integer identi, List<PaisRest> rests) {
		id = identi
		nombre = nombrePais
		lugares = interes
		mini_conexiones = rests
	}
	
}