package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException

@Accessors
class ACME 
{
	private var List<Villano> expedientes;
	private var Detective resolvedorDeCasos;
	
	new() {}
	
	/**
	 * @Propósito Crea a ACME con villlanos y un resolvedor de casos.
	 * @param villanos Son todos los villanos registrados en ACME.
	 * @param resolvedor Es el Detective encargado de perseguir a los villanos.
	 */
	new (List<Villano> villanos, Detective resolvedor) 
	{
		expedientes = villanos
		resolvedorDeCasos = resolvedor
	}
	
	/**
	 * @Propósito Agrega un Villano a la base de datos de ACME solo si no fue cargado anteriormente.
	 * @param VillanoAAgregar Es el Villano que se intenta agrega a la base de datos de ACME.
	 */
	def void agregarVillanoSiPuede (Villano villanoAAgregar)
	{
		if (! elVillanoYaExiste(villanoAAgregar))
			agregarVillano (villanoAAgregar)
		else
			throw new ElVillanoYaEstaCargadoException ("El villano ya existe en la base de datos de ACME")
			
	}
	
	/**
	 * @Propósito Pregunta si el villano existe en la base de datos de ACME.
	 * @param villano Es el Villano por el que se hace la verificacion.
	 */
	def elVillanoYaExiste (Villano villano) 
	{
		expedientes.exists[v | v.nombre == villano.nombre]
		// expedientes.exists[| it.nombre == villano.nombre]
	}
	
	/**
	 * @Propósito Agrega un villano a la base de datos de ACME.
	 * @param villanoAAgregar Es el Villano que se agrega a la base de datos de ACME.
	 */
	def void agregarVillano (Villano villanoAAgregar)
	{
		expedientes.add(villanoAAgregar)
	}
	
}