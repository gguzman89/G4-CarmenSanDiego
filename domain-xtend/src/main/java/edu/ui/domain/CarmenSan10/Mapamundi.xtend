package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.ElPaisYaFueAgregadoException
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Accessors
@Observable
class Mapamundi {
	
	List<Pais> paises
	List<PaisMini> paisesMini = new ArrayList<PaisMini>
	
	new() {}	
	
	def buscarPais(String nombreDelPaisABuscar) {
		
		paises.filter[pais | pais.nombrePais == nombreDelPaisABuscar].toList
		// (PREGUNTAR) Otra manera de hacerlo...
		//paises.findFirst[pais | pais.nombrePais == nombreDelPaisABuscar]
		
	}
	
	def borrarPais(Pais paisABorrar) {
		paises.remove(paisABorrar)
	}
	
	def agregarPais(Pais paisAgregar) {
		paises.add(paisAgregar)
	}
	
	def agregarPaisSiPuede(Pais paisAgregar)
	{
		if (! elPaisYaEstaAgregado(paisAgregar))
			agregarPais(paisAgregar)
		else
			// ¿Por qué ocurrio una excepción? Porque...
			throw new ElPaisYaFueAgregadoException("No se puede agregar el mismo pais dos veces")
	}
	
	private def elPaisYaEstaAgregado(Pais paisAgregar) {
		paises.exists[pais | pais.nombrePais == paisAgregar.nombrePais]
	}
	
	def setPaisMini(PaisMini mini) {
		eliminarPaisMini(mini.id)
		paisesMini.add(mini)
	}
	
	def eliminarPaisMini(int id) {
		paisesMini.removeIf[ it.id == id ]
	}
	
}
