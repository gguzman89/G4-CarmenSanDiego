package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException
import java.util.ArrayList

@Accessors
class Expediente 
{
	private var List<Villano> villanos;
	
	new()
	{
		villanos = new ArrayList<Villano>()
	}
	
	/**
	 * @Propósito Agrega un Villano solo si no fue cargado anteriormente.
	 * @param VillanoAAgregar Es el Villano que se intenta agregar.
	 */
	def void agregarVillanoSiPuede (Villano villanoAAgregar)
	{
		if (! elVillanoYaExiste(villanoAAgregar.nombre))
			agregarVillano (villanoAAgregar)
		else
			// Preguntar como mostrar en pantalla el String del error.
			throw new ElVillanoYaEstaCargadoException ("El villano ya existe en la base de datos")
	}
	
	/**
	 * @Propósito Pregunta si el villano existe.
	 * @param unNombre Es el nombre del Villano por el que se hace la verificacion.
	 */
	def elVillanoYaExiste (String unNombre) 
	{
		villanos.exists[v | v.tieneElMismoNombreQue (unNombre)]
		// Que es lo mismo que escribir...
		// expedientes.exists[| it.nombre == villano.nombre]
	}
	
	/**
	 * @Propósito Agrega un villano.
	 * @param villanoAAgregar Es el Villano que se agrega.
	 */
	def agregarVillano (Villano villanoAAgregar)
	{
		villanos.add(villanoAAgregar)
	}
	
	/**
	 * @Propósito Busca un villano.
	 * @param unNombre Es el nombre del Villano que se busca.
	 */
	def buscarVillano (String unNombre)
	{
		villanos.filter[v | v.tieneElMismoNombreQue(unNombre)].toList
	}
}