package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
abstract class PaisMini {
	
	String nombrePais
	
	new(String nombre) {
		nombrePais = nombre
	}
	
	abstract def int getId()
	
	abstract def void setID(int identi) 
}

@Accessors
class PaisSimple extends PaisMini {
	
	int id
	
	new(int identi, String nombre) {
		super(nombre)
		id = identi
	}
	
	override setID(int identi) {}
	
}

@Accessors
class PaisConId extends PaisMini {
	
	int id //puede ser subclass tambien
	List<LugarDeInteres> lugares
	List<PaisSimple> conexiones
	
	new(String nombre, int identi, List<LugarDeInteres> interes, List<PaisSimple> simples) {
		super(nombre)
		id = identi
		lugares = interes
		conexiones = simples
	}
	
	override setID(int identi) {}
	
	
	
}