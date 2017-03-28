package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ACME 
{
	private var List<Villano> expedientes;
	private var Detective resolvedorDeCasos;
	
	new() {}
	
	new (List<Villano> villanos, Detective resolvedor) 
	{
		expedientes = villanos
		resolvedorDeCasos = resolvedor
	}
	
	def void agregarUnVillano (Villano v)
	{
		expedientes.add(v)
	}
	
}