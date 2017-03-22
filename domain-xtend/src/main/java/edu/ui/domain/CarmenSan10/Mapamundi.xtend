package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Mapamundi {
	
	List<Pais> paises
	
	new() {
		paises = new ArrayList<Pais>()
	}
	
	def buscarPais(Pais paisABuscar) {
		
		/*
		 * deberia encontrar un unico pais
		 * como diferencias un pais de otros?
		 * los paises deberian ser univocos
		 */
		var encontrados = new ArrayList<Pais>()
		
		for (Pais p : paises) {
			if(p.nombrePais == paisABuscar.nombrePais)
				encontrados.add(p)
		}
		return encontrados
	}
	
	def borrarPais(Pais paisABorrar) {
		paises.remove(paisABorrar)
	}
	
	def agregarPais(Pais paisAgregar) {
		paises.add(paisAgregar)
	}
}
