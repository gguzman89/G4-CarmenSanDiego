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
	/**
	 * Dado ACME sin villanos registrados, agrega a "Carmen Sandiego" y...
	 * verifica si "Carmen Sandiego" ya esta registrado...
	 * devuelve True.
	 */
	@Test
	def void testAgregarVillano ()
	{	
		var acme = new ACME(new ArrayList(), new Detective())
		
		var Villano villanoMock = mock(Villano)
		
		when(villanoMock.nombre).thenReturn("Carmen Sandiego")
		
		acme.agregarVillano(villanoMock)
		
		Assert.assertTrue(acme.elVillanoYaExiste(villanoMock))
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, intenta agregar a "Ivan Noseque" y...
	 * verifica que "Ivan Noseque" fue agregado,
	 * y devuelve True.
	 */
	@Test
	def void testAgregarVillanoSiPuedeEnCasoPositivo ()
	{	
		var Villano villanoMock1 = mock(Villano)
		var Villano villanoMock2 = mock(Villano)
		
		var List<Villano> expediente = new ArrayList();
		expediente.add(villanoMock1)
		
		var acme = new ACME(expediente, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock1.nombre).thenReturn("Ivan Noseque")
		
		acme.agregarVillanoSiPuede(villanoMock2)
		
		Assert.assertTrue(acme.elVillanoYaExiste(villanoMock2))
	}
	
	/**
	 * Dado ACME con un villano "Carmen Sandiego" registrado, intenta agregar a "Carmen Sandiego" y...
	 * verifica que "Carmen Sandiego" ya fue agregado anteriormente,
	 * así que devuelve un Exception.
	 */
	@Test (expected = UserException)
	def void testAgregarVillanoSiPuedeEnCasoNegativo ()
	{	
		var Villano villanoMock1 = mock(Villano)
		var List<Villano> expediente = new ArrayList();
		expediente.add(villanoMock1)
		
		var Villano villanoMock2 = mock(Villano)
		
		var acme = new ACME(expediente, new Detective())
		
		when(villanoMock1.nombre).thenReturn("Carmen Sandiego")
		when(villanoMock2.nombre).thenReturn("Carmen Sandiego")
		
		acme.agregarVillanoSiPuede(villanoMock2)
	}
}