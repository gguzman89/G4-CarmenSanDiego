package edu.ui.dominioXTrest

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.Pais
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi

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
	
	def minificador(List<Pais> conexiones) 
	{
		val paisesMini = new ArrayList<PaisRest>
		for(pais : conexiones)
		{
			paisesMini.add(new PaisRest(pais.id, pais.nombrePais))
		}
		paisesMini
	}
	
	def miniPais(Pais pais, List<PaisRest> paisesRest) {
		
		val rest = new PaisConID(pais.nombrePais, pais.lugares, pais.id, paisesRest)
		rest
	}
	
	def maximizar(PaisSinID pais, Mapamundi mapa) {
		
		var conexionesMaxi = pais.mini_conexiones.map[p| p.maximizar(mapa, pais.nombre)].toList
		
		val rest = new Pais(pais.nombre, pais.lugares, conexionesMaxi)
		
		rest
	}
	
	def maximizar(List<PaisRest> conexiones) {
		
		val paisesMaxi = new ArrayList<Pais>
		for(pais : conexiones)
		{
			
		}
		paisesMaxi
	}
	
}