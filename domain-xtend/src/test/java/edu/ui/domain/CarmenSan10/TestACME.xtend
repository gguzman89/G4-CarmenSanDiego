package edu.ui.domain.CarmenSan10

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import static org.mockito.Mockito.*
import java.util.ArrayList
import java.util.List
import org.omg.CORBA.UserException
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException

class TestACME 
{
	Villano villanoMock1
	Villano villanoMock2
	Expediente expedienteMock
	
	@Before
	def void setUp() 
	{
		expedienteMock = mock(Expediente)
		villanoMock1 = mock(Villano)
		villanoMock2 = mock(Villano)
	}
	
	/**
	 * Dado ACME sin villanos registrados, agrega a "Carmen Sandiego" y...
	 * verifica si "Carmen Sandiego" ya esta registrado...
	 * devuelve True.
	 */
	@Test
	def void testAgregarVillano ()
	{	
		var acme = new ACME(expedienteMock, new Detective())
		acme.agregarVillano(villanoMock1)
		
		when(expedienteMock.elVillanoYaExiste(villanoMock1.nombre)).thenReturn(true)
		
		verify(expedienteMock).agregarVillano(villanoMock1)
		
		Assert.assertTrue(acme.elVillanoYaExiste(villanoMock1.nombre))
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, intenta agregar a "Ivan Igorovich" y...
	 * verifica que "Ivan Igorovich" fue agregado,
	 * y devuelve True.
	 */
	@Test
	def void testAgregarVillanoSiPuedeEnCasoPositivo ()
	{	
		var acme = new ACME(expedienteMock, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Ivan Igorovich")
		when(villanoMock2.tieneElMismoNombreQue("Ivan Igorovich")).thenReturn(true)
		when(expedienteMock.elVillanoYaExiste(villanoMock2.nombre)).thenReturn(true)
		
		acme.agregarVillanoSiPuede(villanoMock2)
		
		verify(expedienteMock).agregarVillanoSiPuede(villanoMock2)
		
		Assert.assertTrue(acme.elVillanoYaExiste(villanoMock2.nombre))
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, intenta agregar a "Carmen Sandiego" y...
	 * verifica que "Carmen Sandiego" ya fue agregado anteriormente,
	 * así que devuelve un Exception.
	 */
	@Test (expected = ElVillanoYaEstaCargadoException)
	def void testAgregarVillanoSiPuedeEnCasoNegativo ()
	{	
		var acme = new ACME(expedienteMock, new Detective())
		
		acme.agregarVillano(villanoMock1)
		verify(expedienteMock).agregarVillano(villanoMock1)
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue(villanoMock1.nombre)).thenReturn(true)
		when(expedienteMock.elVillanoYaExiste("Carmen Sandiego")).thenReturn(true)
		
		acme.agregarVillanoSiPuede(villanoMock2)
		
		//verify(expedienteMock).agregarVillanoSiPuede(villanoMock2)
		
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, busca a "Carmen Sandiego"...
	 * y pregunta si lo encontró...
	 * entonces, devuelve True
	 */
	@Test
	def void testBuscarVillanoCasoPositivo ()
	{	
		expedienteMock.agregarVillano(villanoMock1)
		verify(expedienteMock).agregarVillano(villanoMock1)
		var acme = new ACME(expedienteMock, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue(villanoMock1.nombre)).thenReturn(true)
		
		Assert.assertTrue(acme.buscarVillano(villanoMock1.nombre).contains(villanoMock1))
		verify(expedienteMock).buscarVillano(villanoMock1.nombre)
		
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, busca a "Ivan Igorovich"...
	 * y pregunta si no encontró a "Ivan Igorovich"...
	 * entonces, devuelve True
	 */
	@Test
	def void testBuscarVillanoCasoNegativo ()
	{	
		expedienteMock.agregarVillano(villanoMock1)
		verify(expedienteMock).agregarVillano(villanoMock1)
		var acme = new ACME(expedienteMock, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Ivan Igorovich")
		when(villanoMock1.tieneElMismoNombreQue(villanoMock2.nombre)).thenReturn(false)
		
		Assert.assertTrue(acme.buscarVillano(villanoMock2.nombre).empty)
		verify(expedienteMock).buscarVillano(villanoMock2.nombre)
	}
}