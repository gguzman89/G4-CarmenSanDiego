package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PistaRest {
	
	String pista
	
	new() {}
	
	new(String calculada) {
		pista = calculada
	}
}