package edu.ui.domain.CarmenSan10

//import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import java.util.ArrayList
import static org.mockito.Mockito.*
import org.omg.CORBA.UserException

class TestMapamundiXtend {

	Pais azulMock
	Pais rojoMock
	
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
		 
		azulMock = mock(Pais)
		rojoMock = mock(Pais)
		
		when(azulMock.nombrePais).thenReturn("Argentina")
		when(rojoMock.nombrePais).thenReturn("Chile")
		
		teg = new Mapamundi => [
			paises = new ArrayList<Pais>()
		]
		
		
	}

	@Test
	def void testBuscarPaisArgentina() {

		teg.agregarPais(azulMock)
		teg.agregarPais(rojoMock)
		
		Assert.assertTrue(teg.buscarPais("Argentina").contains(azulMock))
		// (PREGUNTAR) Otra manera de hacerlo...
		//Assert.assertEquals(teg.buscarPais("Argentina"), azulMock)
	}
	
	@Test
	def void testBuscarPaisChileSinChile() {
		
		teg.agregarPais(azulMock)
		
		Assert.assertFalse(teg.buscarPais("Chile").contains(rojoMock))
		
		// (PREGUNTAR) OTRA MANERA DE HACERLO....
		//Assert.assertEquals(teg.buscarPais("Chile"), null)
	}
	
	@Test (expected = UserException)
	def void testAgregarPaisSiPuedeArgentina() {
		
		teg.agregarPais(azulMock)
		teg.agregarPais(rojoMock)
		
		teg.agregarPaisSiPuede(azulMock)
	}
	
}