package edu.ui.dominioXTrest

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Pais
import java.util.ArrayList

@Accessors
class MapamundiRest {
	
	List<Pais> paises
	
	new(List<Pais> domain) {
		paises = domain
	}
	
	def minificador() 
	{
		val paisesMini = new ArrayList<PaisRest>
		for(pais : paises)
		{
			paisesMini.add(new PaisRest(pais.id, pais.nombrePais))
		}
		paisesMini
	}
}