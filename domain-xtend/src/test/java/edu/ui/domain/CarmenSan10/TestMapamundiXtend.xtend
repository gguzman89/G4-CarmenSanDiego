package edu.ui.domain.CarmenSan10

//import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import java.util.ArrayList

class TestMapamundiXtend {
	
	Pais azul
	Pais rojo
	
	Mapamundi teg
	
	
	@Before
	def void setUp() {
		
		/*
		 * 2 maneras de crear
		 * diferencias?
		 * new() {
			paises = new ArrayList<Pais> ()
		   }
		 * puedo instanciar a mi manera el objeto, 
		 */
		azul = new Pais("Argentina")
		
		rojo = new Pais => [
			nombrePais = "Chile"
		]
		
		teg = new Mapamundi => [
			paises = new ArrayList<Pais>()
		]
		
		
	}

	@Test
	def void testBuscarPaisArgentina() {

		teg.agregarPais(azul)
		teg.agregarPais(rojo)
		
		Assert.assertEquals(teg.buscarPais(azul).get(0).nombrePais,"Argentina")
		Assert.assertEquals(teg.buscarPais(rojo).get(0).nombrePais,"Chile")
		Assert.assertFalse(teg.paises.empty)
	}
}