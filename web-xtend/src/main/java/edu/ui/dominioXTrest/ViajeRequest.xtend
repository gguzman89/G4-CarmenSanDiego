package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ViajeRequest 
{
	Integer destinoId
	Integer casoId
	
	new()
	{
		destinoId = 0
		casoId = 0
	}
	
	new(Integer idDestino, Integer idCaso)
	{
		this.destinoId = idDestino
		this.casoId = idCaso
	}	
}