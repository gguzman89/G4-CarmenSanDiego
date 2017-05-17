package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ViajeRequest 
{
	Integer destinoId
	Integer casoId
	
	new(Integer idDestino, Integer idCaso)
	{
		this.destinoId = idDestino
		this.casoId = idCaso
	}	
}