package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException

@Accessors
class ACME 
{
	// Es necesario poner Private usando el Accessors?
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
	
	/*
	new(Detective resolvedor) { Preungtaar
		expedientes = new ArrayList<Villano>()
		resolvedorDeCasos = resolvedor
	}
	 */
	 
	/**
	 * @Propósito Agrega un Villano a la base de datos de ACME solo si no fue cargado anteriormente.
	 * @param VillanoAAgregar Es el Villano que se intenta agrega a la base de datos de ACME.
	 */
	def void agregarVillanoSiPuede (Villano villanoAAgregar)
	{
		if (! elVillanoYaExiste(villanoAAgregar.nombre))
			agregarVillano (villanoAAgregar)
		else
			// Preguntar como mostrar en pantalla el String del error.
			throw new ElVillanoYaEstaCargadoException ("El villano ya existe en la base de datos de ACME")
			
	}
	
	/**
	 * @Propósito Pregunta si el villano existe en la base de datos de ACME.
	 * @param unNombre Es el nombre del Villano por el que se hace la verificacion.
	 */
	def elVillanoYaExiste (String unNombre) 
	{
		expedientes.exists[v | v.tieneElMismoNombreQue (unNombre)]
		// Que es lo mismo que escribir...
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
	
	/**
	 * @Propósito Busca un villano a la base de datos de ACME.
	 * @param unNombre Es el nombre del Villano que se quiere buscar en la base de datos de ACME.
	 */
	def buscarVillano (String unNombre)
	{
		expedientes.filter[v | v.tieneElMismoNombreQue(unNombre)].toList
	}
	
}