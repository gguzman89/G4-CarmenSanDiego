package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.ElPaisYaEstaIncluidoException
import org.uqbar.commons.utils.Observable
import java.util.Random

@Observable
@Accessors
class Caso 
{
	Integer id;
	Villano responsable;
	List<Pais> planDeEscape;
	String reporteDelActoCriminal;
	String objetoDelRobo;
	Pais paisDelRobo;
	LugarDeInteres lugarDelVillano;
	List<List<LugarDeInteres>> lugaresDelPlanEscape;
	List<List<String>> pistasDelPlanDeEscape;
	
	new () {}
	
	/**
	 * @Propósito Crea un Caso nuevo con unCriminal, unPlanDeEscape, un reporte, el objetoRobado y un Pais.
	 * @param unCriminal Es el Villano que produjo el crimen.
	 * @param unPlanDeEscape Es una lista de paises por las que el Villano escapó despues de cometer el robo.
	 * @param reporte Es un reporte con los acontecimientos del robo.
	 * @param objetoRobado Es el objeto que el Villano robó.
	 * @param unPais Es el Pais en el que se cometio el robo.
	 */
	new (Villano unCriminal, List<Pais> unPlanDeEscape, String reporte, String objetoRobado, Pais unPais) 
	{
		id = 1
		responsable = unCriminal
		planDeEscape = actualizarPaises(unPlanDeEscape)
		reporteDelActoCriminal = reporte
		objetoDelRobo = objetoRobado
		paisDelRobo = unPais
		lugarDelVillano = lugarDondeSeEncuentraElVillano
		lugaresDelPlanEscape = lugaresDelRecorrido(planDeEscape)
		pistasDelPlanDeEscape = pistasDelRecorrido(planDeEscape)
	}
	
	def mostrarPista(Pais p, LugarDeInteres lugar) {
		
		/**
		 * Falta contemplar el caso en el que el pais NO se encuentra en el 
		 * planDeEscape
		 */
		 
		val posLugarPista = planDeEscape.indexOf(p)
		
		val resLugares = lugaresDelPlanEscape.get(posLugarPista).indexOf(lugar)
		
		pistasDelPlanDeEscape.get(posLugarPista).get(resLugares)
	}
	
	def pistasDelRecorrido(List<Pais> paises) 
	{
		paises.map[pais | pais.pistas(this)].toList
	}
	
	def lugaresDelRecorrido(List<Pais> paises) 
	{
		paises.map[pais | pais.lugares].toList
	}
	
	
	def List<Pais> actualizarPaises(List<Pais> paises) 
	{
<<<<<<< HEAD
		for (var i=0; i>=paises.size; i++)
		{
			paises.get(i).cambiarEstado(this)
		}
		//paises.forEach[p | p.cambiarEstado(this)]
=======
		//paises.map[p|p.cambiarEstado(this)]
		
		paises.forEach[p | p.cambiarEstado(this)]
>>>>>>> 5175cddc20282da894fa082e1348fa3cdcd250b3
		paises
	}
	
	
	def Pais actualizarUltimoPaisVillano(Pais ultimo) {
		
	}
	
	def lugarDondeSeEncuentraElVillano() 
	{
		ultimoPaisDelRecorrido.lugarDelVillano
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
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	/**
	 * @Propósito Agrega un paisDeEscape al caso.
	 * @param paisDeEscape Es el Pais que se le agrega al plan de escape. 
	 */
	def agregarPaisDeEscape (Pais paisDeEscape)
	{
		planDeEscape.add (paisDeEscape)
	}
	
	/**
	 * @Propósito Agrega un paisDeEscape al caso solo si no existe ya en el plan de escape.
	 * @param paisDeEscape Es el Pais que se intenta agregar al plan de escape. 
	 */
	def agregarPaisDeEscapeSiPuede (Pais paisDeEscape)
	{
		if (! estaIncluidoEnElPlanDeEscape(paisDeEscape))
			planDeEscape.add (paisDeEscape)
		else 
			throw new ElPaisYaEstaIncluidoException ("El pais ya está incluido en el plan de escape")
	}
	
	/**
	 * @Propósito Pregunta si pais ya está incluido en el plan de escape.
	 * @param pais Es el Pais que se quiere verificar.
	 */ 
	def estaIncluidoEnElPlanDeEscape(Pais pais) 
	{
		planDeEscape.exists[p | p.nombrePais == pais.nombrePais]
	}
	
	def esElFinDelCaso (Pais paisActual) 
	{
		paisActual.esElFinalDelRecorrido(planDeEscape)
	}
	
	def ultimoPaisDelRecorrido()
	{
		planDeEscape.get(planDeEscape.size-1)
	}
	
	def proximoDestino(Pais pais) 
	{
		val posicionPaisActual = planDeEscape.indexOf(pais)
		planDeEscape.get(posicionPaisActual+1)
	}
	
	def estaResuelto(Detective doc) {
		
		doc.ubicacionActual.esElFinalDelRecorrido(planDeEscape) &&
		doc.ordenDeArresto == responsable.nombre				&&
		doc.ultimoLugarVisitado == lugarDelVillano 
	}
	
}