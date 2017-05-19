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
	
	/////////////////////////////////////////////////////////////////////////
	
	Pais argentina
	Pais bolivia
	Pais mexico
	Pais venezuela
	Pais brazil
	
	Villano expo
	////////////////////////////////////////////////////////////////////////
	
	Caso casoFeliz
	
	@Before
	def void setUp() {
		paisMock1 = mock(Pais)
		paisMock2 = mock(Pais)
		
		////////////////////////////////////////////////////////////////////////
		
		argentina = new Pais("Argentina")
		bolivia = new Pais("Bolivia")
		mexico = new Pais("Mexico")
		venezuela = new Pais("Venezuela")
		brazil = new Pais("Brazil")
		
		val planDeEscape = new ArrayList<Pais>()
		planDeEscape.add(argentina)
		planDeEscape.add(bolivia)
		planDeEscape.add(mexico)
		planDeEscape.add(venezuela)
		
		//////////////////////////////////////////////////////////////////////
		
		val reporteCrimen = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del faltante de gran valor! El sarcófago del faraón Usermaatra-Meriamón Ramsés-Heqaiunu, mejor conocido como Ramsés III. El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su misión como detective es desifrar el responsable de tal crímen y apresarlo."
		val objetoRobado = "Tumba del faraón"
		
		expo = new Villano()
		
		casoFeliz = new Caso(expo, planDeEscape, reporteCrimen, objetoRobado, brazil)
		
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
		
		Assert.assertFalse(caso.estaIncluidoEnElPlanDeEscape(paisMock))
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