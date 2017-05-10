package edu.ui.dominioXTrest

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Villano

@Accessors
class ExpedienteRest 
{
	List<Villano> villanos
	
	new()
	{
		villanos = new ArrayList<Villano>
	}
	
	new (List<Villano> villanos)
	{
		this.villanos = villanos
	}
	
	def minificador() 
	{
		val villanosMini = new ArrayList<VillanoRest>
		for(villano: villanos)
		{
			villanosMini.add(new VillanoRest(villano.id, villano.nombre))
		}
		villanosMini
	}
}