package edu.ui.domain.CarmenSan10

import org.junit.Test
import org.junit.Before
import org.junit.Assert
import static org.mockito.Mockito.*
import org.uqbar.commons.model.UserException
import java.util.ArrayList
import edu.ui.domain.Exceptions.ElVillanoYaEstaCargadoException

class TestExpediente 
{
	Villano villanoMock1
	Villano villanoMock2
	Expediente expediente
	
	@Before
	def void setUp() 
	{
		expediente = new Expediente()
		villanoMock1 = mock(Villano)
		villanoMock2 = mock(Villano)
	}
	
	/**
	 * Dado un Expediente sin villanos, agrega a "Carmen Sandiego" y...
	 * verifica si "Carmen Sandiego" ya esta registrado...
	 * devuelve True.
	 */
	@Test
	def void testAgregarVillano ()
	{	
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue("Carmen Sandiego")).thenReturn(true)
		
		expediente.agregarVillano(villanoMock1)
		
		Assert.assertTrue(expediente.elVillanoYaExiste(villanoMock1.nombre))
	}
	
	/**
	 * Dado un Expediente con un villano "Carmen Sandiego", intenta agregar a "Ivan Igorovich" y...
	 * verifica que "Ivan Igorovich" fue agregado,
	 * y devuelve True.
	 */
	@Test
	def void testAgregarVillanoSiPuedeEnCasoPositivo ()
	{	
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Ivan Igorovich")
		when(villanoMock2.tieneElMismoNombreQue("Ivan Igorovich")).thenReturn(true)
		
		expediente.agregarVillano(villanoMock1)
		expediente.agregarVillanoSiPuede(villanoMock2)
		
		Assert.assertTrue(expediente.elVillanoYaExiste(villanoMock2.nombre))
	}
	
	/**
	 * Dado un Expediente con un villano "Carmen Sandiego", intenta agregar a "Carmen Sandiego" y...
	 * verifica que "Carmen Sandiego" ya fue agregado anteriormente,
	 * así que devuelve un Exception.
	 */
	@Test (expected = ElVillanoYaEstaCargadoException)
	def void testAgregarVillanoSiPuedeEnCasoNegativo ()
	{	
		expediente.agregarVillanoSiPuede(villanoMock1)
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue("Carmen Sandiego")).thenReturn(true)
		
		expediente.agregarVillanoSiPuede(villanoMock2)
	}
	
	/**
	 * Dado un Expediente con un villano "Carmen Sandiego"... 
	 * busca a "Carmen Sandiego" y pregunta si lo encontró...
	 * entonces, devuelve True
	 */
	@Test
	def void testBuscarVillanoCasoPositivo ()
	{	
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.tieneElMismoNombreQue("Carmen Sandiego")).thenReturn(true)
		expediente.agregarVillano(villanoMock1)
		
		Assert.assertTrue(expediente.buscarVillano(villanoMock1.nombre).contains(villanoMock1))
	}
	
	/**
	 * Dado un Expediente con un villano "Carmen Sandiego", busca a "Ivan Igorovich"...
	 * y pregunta si no encontró a "Ivan Igorovich"...
	 * entonces, devuelve True
	 */
	@Test
	def void testBuscarVillanoCasoNegativo ()
	{	
		expediente.agregarVillano(villanoMock1)
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		
		Assert.assertTrue(expediente.buscarVillano(villanoMock2.nombre).empty)
	}
}