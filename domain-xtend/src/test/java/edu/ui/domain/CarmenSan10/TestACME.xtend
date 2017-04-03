package edu.ui.domain.CarmenSan10

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import static org.mockito.Mockito.*
import java.util.ArrayList
import java.util.List
import org.omg.CORBA.UserException

class TestACME 
{
	Villano villanoMock1
	Villano villanoMock2
	
	@Before
	def void setUp() 
	{
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
		var acme = new ACME(new ArrayList(), new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue("Carmen Sandiego")).thenReturn(true)
		acme.agregarVillano(villanoMock1)
		
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
		var List<Villano> expediente = new ArrayList();
		expediente.add(villanoMock1)
		
		var acme = new ACME(expediente, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Ivan Igorovich")
		when(villanoMock2.tieneElMismoNombreQue("Ivan Igorovich")).thenReturn(true)
		
		acme.agregarVillanoSiPuede(villanoMock2)
		
		Assert.assertTrue(acme.elVillanoYaExiste(villanoMock2.nombre))
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, intenta agregar a "Carmen Sandiego" y...
	 * verifica que "Carmen Sandiego" ya fue agregado anteriormente,
	 * así que devuelve un Exception.
	 */
	@Test (expected = UserException)
	def void testAgregarVillanoSiPuedeEnCasoNegativo ()
	{	
		var List<Villano> expediente = new ArrayList();
		expediente.add(villanoMock1)
		
		var acme = new ACME(expediente, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue("Carmen Sandiego")).thenReturn(true)
		
		acme.agregarVillanoSiPuede(villanoMock2)
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, busca a "Carmen Sandiego"...
	 * y pregunta si lo encontró...
	 * entonces, devuelve True
	 */
	@Test
	def void testBuscarVillanoCasoPositivo ()
	{	
		var List<Villano> expediente = new ArrayList();
		expediente.add(villanoMock1)
		
		var acme = new ACME(expediente, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue("Carmen Sandiego")).thenReturn(true)
		
		Assert.assertTrue(acme.buscarVillano(villanoMock1.nombre).contains(villanoMock1))
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, busca a "Ivan Igorovich"...
	 * y pregunta si no encontró a "Ivan Igorovich"...
	 * entonces, devuelve True
	 */
	@Test
	def void testBuscarVillanoCasoNegativo ()
	{	
		var List<Villano> expediente = new ArrayList();
		expediente.add(villanoMock1)
		
		var acme = new ACME(expediente, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		
		Assert.assertTrue(acme.buscarVillano(villanoMock2.nombre).empty)
	}
}