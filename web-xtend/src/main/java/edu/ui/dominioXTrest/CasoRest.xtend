package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import edu.ui.domain.CarmenSan10.Caso
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.Pais

@Accessors
class CasoRest {
	
	Integer id
	PaisConID pais
	List<String> paisesVisitados
	List<String> paisesFallidos
	
	new() {}
	
	new(Caso caso, Detective detective, MapamundiRest minificador, List<PaisRest> restCntc) {
		id = caso.id
		pais = minificador.miniPais(caso.paisDelRobo, restCntc)
		paisesVisitados = nombrePaises(detective.recorrido)
		paisesFallidos = nombrePaises(detective.destinosFallidos(caso.planDeEscape))
	}
	
	def nombrePaises(List<Pais> paises) {
		
		var nombres = paises.map[p|p.nombrePais] // public -> Pais
		
		nombres
	}
	
	
}