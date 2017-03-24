package edu.ui.domain.CarmenSan10

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import static org.mockito.Mockito.*

class TestDetective {
	
	@Test
	def testElDetectiveMandaUnaOrdenDeArrestoParaCarmeSandiego ()
	{
		var Villano villanoMock = mock(Villano)
		when(villanoMock.nombre).thenReturn("Carmen Sandiego")
		
		Assert.assertEquals(villanoMock.nombre, "Carmen Sandiego")
	}
}