package edu.ui.domain.CarmenSan10

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Observable
@Accessors
class Informante extends Ocupante {

	new(){}	

	override responderAlDetective(Caso caso, LugarDeInteres unLugar, Pais paisActual) 
	{	
		switch(unLugar)
		{
			case LugarDeInteres.BANCO : responderAlBanco(caso, paisActual)
			case LugarDeInteres.BIBLIOTECA : responderALaBiblioteca(caso, paisActual)
			case LugarDeInteres.CLUB : responderAlClub(caso)
			case LugarDeInteres.EMBAJADA : responderALaEmbajada(caso, paisActual)
		}
	}
	
	def responderALaEmbajada(Caso caso, Pais paisActual)
	{
		// 2 pistas del destino del villano
		val proximoPais = caso.proximoDestino(paisActual)
		proximoPais.dar2PistaDeSusCaracteristicas
	}
	
	def responderAlClub(Caso caso)
	{
		// 2 señas particulares
		caso.responsable.dar2PistasSeniasParticulares +
		// 70% 1 hobbie
		informacionAdicional(caso, 70)
	}
	
	def responderAlBanco(Caso caso, Pais paisActual)
	{
		// 1 pais destino
		val proximoPais = caso.proximoDestino(paisActual)
		proximoPais.pistaDeSusCaracteristicas +
		// 1 señas particulares
		caso.responsable.pistaDeSeniasParticulares
	}
	
	def responderALaBiblioteca(Caso caso, Pais paisActual) 
	{
		// lo mismo del banco
		responderAlBanco(caso, paisActual) + 
		// 50% 1 hobbies
		informacionAdicional(caso, 50)
	}
	
	def informacionAdicional(Caso caso, int porcentaje) 
	{
		var Random rnd = new Random
		var int adicional = rnd.nextInt(99)
		if (adicional > (porcentaje-1))
		{
			pistaSobreHobbie(caso.responsable)
		}
	}
	
	def pistaSobreHobbie(Villano villano) 
	{
		villano.pistaDeHobbies
	}
	
	override actualizar(Caso caso, Pais p) 
	{
		if (p.seEncuentraEnRecorridoSinElUltimoPais(caso.planDeEscape))
		{
			p.ocupante = new Informante()
		}
	}
	
	
}
