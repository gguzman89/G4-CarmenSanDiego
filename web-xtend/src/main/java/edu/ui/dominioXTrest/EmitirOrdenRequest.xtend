package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class EmitirOrdenRequest 
{
	Integer villanoId
	Integer casoId
	
	new ()
	{
		villanoId = 0
		casoId = 0
	}
	
	new(Integer idVillano, Integer idCaso)
	{
		this.villanoId = idVillano
		this.casoId = idCaso
	}
}