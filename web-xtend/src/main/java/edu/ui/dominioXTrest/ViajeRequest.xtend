package edu.ui.dominioXTrest

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