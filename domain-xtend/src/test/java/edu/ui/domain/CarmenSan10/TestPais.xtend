package edu.ui.domain.CarmenSan10

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert
import java.util.List

class TestPais {
	
	Pais argentina
	Pais uruguay
	Pais panama
	Pais venezuela
	Pais belgica
	
	////////////////////////////////////////////////////////////////////////////////////
	
	Villano nn
	Caso expo
	
	Caso hard
	
	@Before
	def void setUp() {
		
		val lugares01 = #[LugarDeInteres.BANCO, LugarDeInteres.BIBLIOTECA, LugarDeInteres.CLUB]
		val lugares02 = #[LugarDeInteres.EMBAJADA]
		
		argentina = new Pais("Argentina", lugares01, #[])
							
		uruguay = new Pais("Uruguay", lugares02, #[argentina])
		
		panama = new Pais("Panama")
		
		venezuela = new Pais("Venezuela")
		venezuela.lugares = lugares02
		
		belgica = new Pais("Belgica")
		
		//////////////////////////////////////////////////////////////////////////////
		
		nn = new Villano() => [
			nombre = "Julian"
		]
		
		expo = new Caso() => [
			planDeEscape = #[venezuela, belgica, panama]
			responsable = nn
		]
		
		hard = new Caso() => [
			planDeEscape = #[venezuela, panama, belgica]
			responsable = nn
		]
		
	}
	
	@Test
	def void testEsElFinalDelRecorrido_NoFeliz() {

		val recorrido = #[belgica, venezuela, belgica, panama, argentina]
	
	Assert.assertFalse(panama.esElFinalDelRecorrido(recorrido))
		
	}
	
	@Test
	def void testEsElFinalDelRecorrido_Feliz() {

		val recorrido = #[panama, venezuela, belgica, argentina]
	
	Assert.assertTrue(argentina.esElFinalDelRecorrido(recorrido))
		
	}
	
	@Test
	def void testRecorridoSinElUltimoPais_NoFeliz() {
		
		val recorrido = #[panama, venezuela, belgica, belgica, argentina]
		
		Assert.assertFalse(argentina.seEncuentraEnRecorridoSinElUltimoPais(recorrido))
	}
	
	@Test
	def void testRecorridoSinElUltimoPais_Feliz() {
		
		val recorrido = #[belgica, panama, venezuela, belgica, argentina]
		
		Assert.assertTrue(panama.seEncuentraEnRecorridoSinElUltimoPais(recorrido))
	}
	
	@Test
	def void testCambiarEstado_Villano() {
		
		panama.cambiarEstado(expo)
		
		println("Villano Panama --> " + panama.ocupante.nombre)
		println("Responsable Expo --> " + expo.responsable.nombre)
		Assert.assertTrue("no resp a Equals", panama.ocupante.nombre == expo.responsable.nombre)
	}
	
	@Test
	def void testCambiarEstado_Informante() {
		
		venezuela.cambiarEstado(expo)
		
		println("Informante Venezuela --> " + venezuela.ocupante.nombre)
		println("Responsable Expo --> " + expo.responsable.nombre)
		Assert.assertTrue("no resp a equals", venezuela.ocupante.nombre != expo.responsable.nombre)
		/**
		 * se que no esta vacia pero no se si resp a ser Informante
		 */
	}
	
	@Test
	def void testPistaDeSusCaracteristica() {
		
		val feature01_panama = new Caracteristicas("mucho viento del norte")
		val feature02_panama = new Caracteristicas("mi bandera es mi patria")
		val feature03_panama = new Caracteristicas("este lugar es poco visitado")
		
		var List<Caracteristicas> list_panama = #[feature01_panama, feature02_panama, feature03_panama]
		
		panama.caracteristicaPais = list_panama
		
		val resp = new Caracteristicas(panama.pistaDeSusCaracteristicas)
		
		Assert.assertTrue(list_panama.exists[c | c.nombre == resp.nombre])
	}
	
	@Test
	def void test2PistasdeSusCaracteristicas() {
		
		val feature01_panama = new Caracteristicas("mucho viento del norte")
		val feature02_panama = new Caracteristicas("mi bandera es mi patria")
		val feature03_panama = new Caracteristicas("este lugar es poco visitado")
		
		var List<Caracteristicas> list_panama = #[feature01_panama, feature02_panama, feature03_panama]
		
		panama.caracteristicaPais = list_panama
		
		var pistas = venezuela.pistas(hard)
		
		Assert.assertTrue(pistas.size == 1)
		
		
	}
}