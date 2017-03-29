package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.ElPaisYaEstaIncluidoException

@Accessors
class Caso 
{
	private var Villano responzable;
	private var List<Pais> planDeEscape;
	private var String reporteDelActoCriminal;
	private var String objetoDelRobo;
	private var Pais paisDelRobo;
	
	//new () {}
	
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
		responzable = unCriminal
		planDeEscape = unPlanDeEscape
		reporteDelActoCriminal = reporte
		objetoDelRobo = objetoRobado
		paisDelRobo = unPais
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
	
}