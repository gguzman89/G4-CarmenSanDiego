package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class VillanoRest 
{
	Integer id
	String nombre
	
	new()
	{
		nombre = ""
	}
	
	new(Integer id, String nombre) 
	{
		this.id = id
		this.nombre = nombre
	}
	
}