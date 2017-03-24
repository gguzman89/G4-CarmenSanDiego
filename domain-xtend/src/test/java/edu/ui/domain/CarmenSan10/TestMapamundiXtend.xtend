package edu.ui.domain.CarmenSan10

//import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert

class TestMapamundiXtend {
	
	var Pais azul
	var Mapamundi teg
	
	@Before
	def void setUp() {
		azul = new Pais("Argentina")
		
		teg = new Mapamundi()
		
		
	}

	@Test
	def void testBuscarPaisArgentina() {

		teg.agregarPais(azul)
		
		Assert.assertEquals(teg.buscarPais(azul).get(0).nombrePais,"Argentina")
	}
}