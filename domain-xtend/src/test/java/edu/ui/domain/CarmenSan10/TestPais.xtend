package edu.ui.domain.CarmenSan10

import org.junit.Before;
import org.junit.Test;
import org.junit.Assert

class TestPais {
	
	Pais argentina
	Pais uruguay
	Pais panama
	Pais venezuela
	Pais belgica
	
	@Before
	def void setUp() {
		
		val lugares01 = #[LugarDeInteres.BANCO, LugarDeInteres.BIBLIOTECA, LugarDeInteres.CLUB]
		val lugares02 = #[LugarDeInteres.CLUB, LugarDeInteres.BIBLIOTECA, LugarDeInteres.EMBAJADA]
		
		argentina = new Pais("Argentina", lugares01, #[])
							
		uruguay = new Pais("Uruguay", lugares02, #[argentina])
		
		panama = new Pais("Panama")
		venezuela = new Pais("Venezuela")
		belgica = new Pais("Belgica")
		
	}
	
	@Test
	def void testEsElFinalDelRecorrido() {

		val recorrido = #[panama, venezuela, belgica, argentina]
	
	Assert.assertFalse(panama.esElFinalDelRecorrido(recorrido))
		
	}
}