package edu.ui.domain.CarmenSan10

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import static org.mockito.Mockito.*
import org.uqbar.commons.model.UserException

class TestDetective 
{
	/**
	 * Dado un detective con una orden de arresto vigente...
	 * pregunta si hay una orden de arresto vigente y... 
	 * devuelve True.
	 */
	@Test
	def testTieneOrdenDeArrestoCasoPositivo ()
	{
		var detective = new Detective ()
		var Villano villanoMock = mock(Villano)
		when(villanoMock.nombre).thenReturn("Carmen Sandiego")
		
		detective.ordenarArresto(villanoMock)
		
		Assert.assertTrue(detective.tieneUnaOrdenDeArresto)
	}
	
	/**
	 * Daso un detective sin una orden de arresto...
	 * pregunta si hay una orden de arresto vigente y... 
	 * devuelve False
	 */
	@Test
	def testTieneOrdenDeArrestoCasoNegativo ()
	{
		var detective = new Detective ()
		var Villano villanoMock = mock(Villano)
		when(villanoMock.nombre).thenReturn("Carmen Sandiego")
		
		Assert.assertFalse(detective.tieneUnaOrdenDeArresto)
	}
	
	/**
	 * El detective emite una orden de arresto para "Carmen Sandiego"...
	 * y verifica si la orden es para "Carmen Sandiego"...
	 * Devuelve True.
	 */
	@Test
	def testOrdenarArrestoCasoPositivo ()
	{
		var detective = new Detective ()
		var Villano villanoMock = mock(Villano)
		when(villanoMock.nombre).thenReturn("Carmen Sandiego")
		
		detective.ordenarArresto(villanoMock)
		
		Assert.assertEquals(detective.ordenDeArresto,"Carmen Sandiego")
	}
	
	/**
	 * El detective emite una orden de arresto para "Ivan Noseque"...
	 * y verifica si la orden es para "Carmen Sandiego"...
	 * Devuelve False.
	 */
	@Test
	def testOrdenarArrestoCasoNegativo ()
	{
		var detective = new Detective ()
		var Villano villanoMock = mock(Villano)
		when(villanoMock.nombre).thenReturn("Ivan Noseque")
		
		detective.ordenarArresto(villanoMock)
		
		Assert.assertNotEquals(detective.ordenDeArresto,"Carmen Sandiego")
	}
	
	/**
	 * El detective viaja a Italia y verifica que se encuentre en Italia.
	 */
	@Test
	def testViajarA ()
	{
		var detective = new Detective ()
		var Pais italiaMock = mock(Pais)
		
		when(italiaMock.nombrePais).thenReturn("Italia")
		
		detective.viajarA(italiaMock)
		
		Assert.assertEquals(detective.ubicacionActual.nombrePais,"Italia")
	}
	
	/**
	 * Dado un detective en Alemania con conexiones aereas a Italia...
	 * intenta viajar a Italia...
	 * Devuelve true
	 */
	@Test
	def testViajarSiPuedeAUnCasoPositivo ()
	{
		var detective = new Detective ()
		var Pais italiaMock = mock(Pais)
		var Pais alemaniaMock = mock(Pais)
		
		when(italiaMock.nombrePais).thenReturn("Italia")
		when(alemaniaMock.nombrePais).thenReturn("Alemania")
		when(alemaniaMock.tieneConexionAereaCon(italiaMock)).thenReturn(true)
		
		detective.viajarA(alemaniaMock)
		detective.viajarSiPuedeA(italiaMock)
		
		Assert.assertEquals(detective.ubicacionActual.nombrePais,"Italia")
	}
	
	/**
	 * Dado un detective en Alemania sin conexiones aereas a Italia...
	 * intenta viajar a Italia...
	 * Devuelve un Excepcion
	 */
	@Test (expected=UserException)
	def testViajarSiPuedaAUnCasoNegativo ()
	{
		var detective = new Detective ()
		var Pais italiaMock = mock(Pais)
		var Pais alemaniaMock = mock(Pais)
		
		when(italiaMock.nombrePais).thenReturn("Italia")
		when(alemaniaMock.nombrePais).thenReturn("Alemania")
		when(alemaniaMock.tieneConexionAereaCon(italiaMock)).thenReturn(false)
		
		detective.viajarA(alemaniaMock)
		detective.viajarSiPuedeA(italiaMock)
	}
	
}