package edu.ui.dominioXTrest

class EmitirOrdenRequest 
{
	Integer villanoId
	Integer casoId
	
	new(Integer idVillano, Integer idCaso)
	{
		this.villanoId = idVillano
		this.casoId = idCaso
	}
}