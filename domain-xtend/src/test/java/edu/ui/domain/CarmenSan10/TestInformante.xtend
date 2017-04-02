package edu.ui.domain.CarmenSan10


import org.junit.Test
import static org.mockito.Mockito.*
import junit.framework.Assert

class TestInformante {
	/**
	 * Dado un Informante, lo asigna a un  Pais,
	 * verifica si el mismo ya esta registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarOcupante ()
	{	
		var lugarAsignado = new Banco ()
		var Informante informanteMock = mock(Informante)
		when(informanteMock.profesion).thenReturn("Cajero")
		//var lugarAsignado = new Banco(informanteMock, "comproDolares")//no toma la herencia de constructores??
		lugarAsignado.setTipo(informanteMock)
		
		Assert.assertTrue(
			lugarAsignado.getTipo ==(informanteMock)
		)
	}
	
	def void testDarInformacion ()
	{	
		var lugarAsignado = new Banco ()
		var Informante informanteMock = mock(Informante)
		lugarAsignado.setTipo(informanteMock)
		lugarAsignado.setPoliticaDelLugar("solo se que intercambio su dinero a dolares")
		Assert.assertTrue(
			lugarAsignado.getPoliticaDelLugar ==(informanteMock.responderAlDetective())
		)
	}
	
	def void testNoDarInformacion ()
	{	
		var lugarAsignado = new Banco ()
		var Cuidador cuidadorMock = mock(Cuidador)
		lugarAsignado.setTipo(cuidadorMock)
		lugarAsignado.setPoliticaDelLugar("solo se que intercambio su dinero a dolares")
		Assert.assertFalse(
			lugarAsignado.getPoliticaDelLugar ==(cuidadorMock.responderAlDetective())
		)
	}
	
}