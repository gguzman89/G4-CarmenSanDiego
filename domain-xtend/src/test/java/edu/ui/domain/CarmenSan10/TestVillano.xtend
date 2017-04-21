package edu.ui.domain.CarmenSan10

import org.junit.Test
import org.junit.Before
import static org.mockito.Mockito.*
import org.junit.Assert
import java.util.ArrayList
import org.uqbar.commons.model.UserException

class TestVillano 
{
	Villano villano
	Club clubMock
	Biblioteca bibliotecaMock
	Detective detectiveMock
	
	@Before
	def void setUp() 
	{
		var hobbies = new ArrayList<String>()
		hobbies.add("Juega tenis")
		
		var senias = new ArrayList<String>()
		senias.add("Pelo rojo")
		
		clubMock = mock(Club)
		bibliotecaMock = mock(Biblioteca)
		detectiveMock = mock (Detective)
		
		villano = new Villano ("Carmen Sandiego", "Femenino", senias, hobbies, clubMock)
		
		detectiveMock.ordenarArresto(villano)
		
	}
	
	/**
	 * Dado un villano con el nombre "Carmen Sandiego"...
	 * pregunta si su nombre es igual a "Carmen Sandiego"... 
	 * devuelve True.
	 */
	@Test
	def void testTieneElMismoNombreQueEnCasoPositivo ()
	{
		Assert.assertTrue(villano.tieneElMismoNombreQue("Carmen Sandiego"))
	}
	
	/**
	 * Dado un villano con el nombre "Carmen Sandiego"...
	 * pregunta si su nombre es igual a "Ivan Igorovich"... 
	 * devuelve False.
	 */
	@Test
	def void testTieneElMismoNombreQueEnCasoNegativo ()
	{
		Assert.assertFalse(villano.tieneElMismoNombreQue("Ivan Igorovich"))
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se agrega el hobbie "Cocina"...
	 * y cuando verifica que está agregada devuelve True.
	 */
	@Test
	def void testAgregarHobbieEnCasoPositivo ()
	{
		villano.agregarHobbie("Cocina")
		Assert.assertTrue(villano.hobbies.contains("Cocina"))
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se intenta agregar el hobbie "Juega tenis"...
	 * pero devuelve una excepción.
	 */
	@Test (expected = UserException)
	def void testAgregarHobbieSiPuededEnCasoNegativo ()
	{
		villano.agregarHobbieSiPuede("Juega tenis")
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se intenta agregar el hobbie "Cocina"...
	 * y cuando verifica que está agregada devuelve True.
	 */
	@Test
	def void testAgregarHobbieSiPuededEnCasoPositivo ()
	{
		villano.agregarHobbieSiPuede("Cocina")
		
		Assert.assertTrue(villano.hobbies.contains("Cocina"))
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se pregunta si tiene el hobbie "Juega tenis"...
	 * devuelve True.
	 */
	@Test
	def void testTieneElHobbieEnCasoPositivo ()
	{
		Assert.assertTrue(villano.tieneElHobbie("Juega tenis"))
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se pregunta si tiene el hobbie "Cocina"...
	 * devuelve False.
	 */
	@Test
	def void testTieneElHobbieEnCasoNegativo ()
	{
		Assert.assertFalse(villano.tieneElHobbie("Cocina"))
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se le borra el hobbie "Juega tenis"...
	 * cuando se pregunta si tiene el hobbie "Juega tenis", devuelve True.
	 */
	@Test
	def void testBorrarHobbieEnCasoPositivo ()
	{
		villano.borrarHobbie("Juega tenis")
		Assert.assertFalse(villano.tieneElHobbie("Juega tenis"))
	}
	
	/**
	 * Dado un villano con el hobbie "Juega tenis"... 
	 * se le borra el hobbie "Cocina"...
	 * cuando se pregunta si tiene el hobbie "Juega tenis", devuelve True.
	 */
	@Test
	def void testBorrarHobbieEnCasoNegativo ()
	{
		villano.borrarHobbie("Cocina")
		Assert.assertTrue(villano.tieneElHobbie("Juega tenis"))
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"... 
	 * se agrega la seña "Posee un collar de rubies"...
	 * y cuando verifica que está agregada devuelve True.
	 */
	@Test
	def void testAgregarSeniaEnCasoPositivo ()
	{
		villano.agregarSenia("Posee un collar de rubies")
		Assert.assertTrue(villano.seniasParticulares.contains("Posee un collar de rubies"))
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"...
	 * se intenta agregar la seña "Posee un collar de rubies"...
	 * pero devuelve una excepción.
	 */
	@Test (expected = UserException)
	def void testAgregarSeniaSiPuededEnCasoNegativo ()
	{
		villano.agregarSeniaSiPuede("Pelo rojo")
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"...
	 * se intenta agregar la seña "Posee un collar de rubies"...
	 * y cuando verifica que está agregada devuelve True.
	 */
	@Test
	def void testAgregarSeniaSiPuededEnCasoPositivo ()
	{
		villano.agregarHobbieSiPuede("Posee un collar de rubies")
		Assert.assertTrue(villano.hobbies.contains("Posee un collar de rubies"))
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"...
	 * se pregunta si tiene la seña "Pelo rojo"...
	 * devuelve True.
	 */
	@Test
	def void testExisteLaSeniaEnCasoPositivo ()
	{
		Assert.assertTrue(villano.existeLaSenia("Pelo rojo"))
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"...
	 * se pregunta si tiene la seña "Posee un collar de rubies"...
	 * devuelve False.
	 */
	@Test
	def void testExisteLaSeniaEnCasoNegativo ()
	{
		Assert.assertFalse(villano.existeLaSenia("Posee un collar de rubies"))
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"...
	 * se le borra la seña "Pelo rojo"...
	 * cuando se pregunta si tiene la seña "Pelo rojo", devuelve True.
	 */
	@Test
	def void testBorrarSeniaEnCasoPositivo ()
	{
		villano.borrarSenia("Pelo rojo")
		Assert.assertFalse(villano.tieneElHobbie("Pelo rojo"))
	}
	
	/**
	 * Dado un villano con la seña "Pelo rojo"...
	 * se le borra la seña "Posee un collar de rubies"...
	 * cuando se pregunta si tiene la seña "Juega tenis", devuelve True.
	 */
	@Test
	def void testBorrarSeniaEnCasoNegativo ()
	{
		villano.borrarSenia("Posee un collar de rubies")
		Assert.assertTrue(villano.existeLaSenia("Pelo rojo"))
	}
	
	/**
	 * Dado un villano con escondido en el club...
	 * si justo cae el detective averiguando...
	 * debera responder acorde a las circunstancias.
	 */
	@Test
	def void testResponderAlDetectiveEnCasoDeQueMeEncuentre ()
	{
//		if (villano.tieneElMismoNombreQue(detectiveMock.ordenDeArresto)){
//			Assert.assertTrue(villano.responderAlDetective(clubMock).contains("ALTO!"))
//		}
//		else
//			Assert.assertFalse(villano.responderAlDetective(clubMock).contains("ALTO!"))
/*
 * la verificacion de arriba la podria hacer el detective
 * en este caso si entra un detective al lugar que estoy escondido
 * sea o no sea el villano en cuestion, corro!
 */		Assert.assertTrue(villano.responderAlDetective(clubMock).contains("ALTO!"))
	}
	
	/**
	 * Dado un villano con escondido en el club...
	 * si el detective averigua en la Biblioteca...
	 * debera advertirle al detective que esta cerca.
	 */
	@Test
	def void testResponderAlDetectiveEnCasoDeNoQueMeEncuentre ()
	{
		
		Assert.assertTrue(villano.responderAlDetective(bibliotecaMock).contains("CUIDADO DETECTIVE!"))
	}
	
	
}