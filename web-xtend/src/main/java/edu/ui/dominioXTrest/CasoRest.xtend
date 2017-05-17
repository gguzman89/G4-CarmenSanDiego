package edu.ui.dominioXTrest

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class CasoRest {
	
	Integer id
	PaisConID pais
	List<String> nombrePaisesVisitados
	List<String> nombrePaisesFallidos
	
	new() {}
	
	
}