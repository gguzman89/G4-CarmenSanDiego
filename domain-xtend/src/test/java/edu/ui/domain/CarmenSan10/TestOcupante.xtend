package edu.ui.domain.CarmenSan10


import org.junit.Test
import static org.mockito.Mockito.*
import junit.framework.Assert
import java.util.ArrayList

class TestOcupante {


	@Test
	def void testAgregarOcupante ()
	{	
		var paisMock = mock(Pais)
		
		var planDeEscape = new ArrayList<Pais>()
		// Tambien puede usarse...
		//var planDeEscape = #[paisMock]
		
		planDeEscape.add(paisMock)
		
		var lugarAsignado = new Banco ()
		var Informante informanteMock = mock(Informante)
		when(informanteMock.profesion).thenReturn("Cajero")
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
			lugarAsignado.getPoliticaDelLugar ==(informanteMock.responderAlDetective(lugarAsignado))
		)
	}
	
	def void testNoDarInformacion ()
	{	
		var lugarAsignado = new Banco ()
		var Cuidador cuidadorMock = mock(Cuidador)
		lugarAsignado.setTipo(cuidadorMock)
		lugarAsignado.setPoliticaDelLugar("solo se que intercambio su dinero a dolares")
		Assert.assertFalse(
			lugarAsignado.getPoliticaDelLugar ==(cuidadorMock.responderAlDetective(lugarAsignado))
		)
	}
	
}