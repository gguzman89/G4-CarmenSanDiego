package edu.ui.domain.CarmenSan10

import org.junit.Test
import static org.mockito.Mockito.*
import java.util.ArrayList
import junit.framework.Assert
import java.util.List
import org.omg.CORBA.UserException
import org.junit.Before

class TestCaso 
{
	Pais paisMock1
	Pais paisMock2
	
	@Before
	def void setUp() {
		paisMock1 = mock(Pais)
		paisMock2 = mock(Pais)
	}
	
	/**
	 * Dado un Caso, le agrega un nuevo Pais al plan de escape,
	 * verifica si el mismo ya esta registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarPaisDeEscape ()
	{	
		var caso = new Caso (new Villano(), new ArrayList<Pais>(), "", "", new Pais())
		var Pais paisMock = mock(Pais)
		
		when(paisMock.nombrePais).thenReturn("Italia")
		caso.agregarPaisDeEscape(paisMock)
		
		Assert.assertTrue(caso.estaIncluidoEnElPlanDeEscape(paisMock))
	}
	
	/**
	 * Dado un Caso con un plan de escape a "Italia", intenta agregar a "Rusia"...
	 * verifica que "Rusia" se haya registrado...
	 * y devuelve True.
	 */
	@Test
	def void testAgregarPaisDeEscapeSiPuedeEnCasoPositivo ()
	{	
		var List<Pais> plan = new ArrayList()
		plan.add(paisMock1)
		var caso = new Caso (new Villano(), plan, "", "", new Pais())
		
		when(paisMock1.nombrePais).thenReturn("Italia")
		when(paisMock2.nombrePais).thenReturn("Rusia")
		
		caso.agregarPaisDeEscapeSiPuede(paisMock2)
		
		Assert.assertTrue(caso.estaIncluidoEnElPlanDeEscape(paisMock2))
	}
	
	/**
	 * Dado un Caso con un plan de escape a "Italia", intenta agregar a "Italia"...
	 * verifica que "Italia" ya está registrado...
	 * y devuelve un Exception.
	 */
	@Test (expected = UserException)
	def void testAgregarPaisDeEscapeSiPuedeEnCasoNegativo ()
	{	
		var List<Pais> plan = new ArrayList()
		plan.add(paisMock1)
		var caso = new Caso (new Villano(), plan, "", "", new Pais())
		
		when(paisMock1.nombrePais).thenReturn("Italia")
		when(paisMock2.nombrePais).thenReturn("Italia")
		
		caso.agregarPaisDeEscapeSiPuede(paisMock2)
		
	}
}