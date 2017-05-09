package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PaisMini {
	
	int id
	String nombrePais
	
	new(int identi, String nombre) {
		id = identi
		nombrePais = nombre
	}
}