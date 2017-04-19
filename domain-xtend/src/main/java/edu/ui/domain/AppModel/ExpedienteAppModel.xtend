package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Expediente
import edu.ui.domain.CarmenSan10.Villano
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ExpedienteAppModel 
{
	private Expediente expediente
	private Villano selectedVillano
	
	new(){}
	
	new (Expediente villanos, Villano selected)
	{
		expediente = villanos
		selectedVillano = selected
	}
	
	def getVillanos()
	{
		expediente.villanos
	}
}