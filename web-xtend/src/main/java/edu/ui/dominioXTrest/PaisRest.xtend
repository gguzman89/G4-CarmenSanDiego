package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors

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