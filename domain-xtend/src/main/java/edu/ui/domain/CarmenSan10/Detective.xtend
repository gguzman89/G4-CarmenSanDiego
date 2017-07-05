package edu.ui.domain.CarmenSan10

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.NoExisteUnaConexionAereaException
import edu.ui.domain.Exceptions.NoHayPasosPorDondeRegresarException
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Detective 
{
	private var List<Pais> recorrido
	private var String ordenDeArresto
	List<LugarDeInteres> lugaresVisitados
	
	/**
	 * @Propósito: Crea un Detective.
	 */
	new ()
	{
		recorrido = new ArrayList<Pais>()
		ordenDeArresto = ""
		lugaresVisitados = new ArrayList<LugarDeInteres>() // puede que no lo necesite
	}
	
	/**
	 * @Propóstio Pregunta si el Detective tiene una orden de arrestro para un villano.
	 */
	def tieneUnaOrdenDeArresto ()
	{
		ordenDeArresto!=""
	}
	
	/**
	 * @Propósito El detective emite una orden de arrestro contra un villano.
	 * @param villano Es el villano al que se leadjudica la orden de arresto.
	 */
	def void ordenarArresto (Villano villano)
	{
		ordenDeArresto = villano.nombre
	}
	
	/**
	 * @Propósito El Detective viaja a un pais determinado, solo si su ubicación actual tiene una conexión aerea con ese país.
	 * @param paisAViajar Es el país donde el Detective quiere viajar.
	 */
	def void viajarSiPuedeA (Pais paisAViajar)
	{
		if (puedeViajarA(paisAViajar))
		{
			viajarA (paisAViajar)
			lugaresVisitados = new ArrayList<LugarDeInteres>() // Limpia los lugaresVisitados
		}
		else 
			throw new NoExisteUnaConexionAereaException ("No existe una conexion aerea")
	}
	
	/**
	 * @Propósito Pregunta si el Detective puede viajar a un Pais determinado.
	 * @param paisAViajar Es el Pais al que el Detective quiere viajar.
	 */
	private def puedeViajarA (Pais paisAViajar) 
	{
		ubicacionActual.tieneConexionAereaCon(paisAViajar)
	}
	
	def visitarLugar (LugarDeInteres lugar)
	{
		lugaresVisitados.add(lugar)
	}
	
	/**
	 * @Propósito El Detective viaja a un pais determinado.
	 * @param paisAViajar Es el Pais al que el Detective viaja.
	 */
	def void viajarA (Pais paisAViajar)
	{
		recorrido.add (paisAViajar)
	}
	
	/**
	 * @Propósito El Detective recorre un LugarDeInteres del Pais actual en el que se encuentra y recibe su política.
	 * @param unLugar Es el LugarDeInteres al que el Detective recorre.
	 */
	def recorrer (LugarDeInteres unLugar)
	{
		
	}
	
	/**
	 * @Propósito Devuelve la ubicación actual del Detective.
	 */
	def ubicacionActual ()
	{
		recorrido.last
	}
	
	/**
	 * @Propósito Devuelve el nombre del Pais de ubicación actual del Detective.
	 */
	def nombreDelPaisActual ()
	{
		ubicacionActual.nombrePais
	}
	
	/**
	 * @Propósito El detective regresa al Pais anterior..
	 */
	def regresarAlPaisAnterior()
	{
		viajarA (recorrido.get(recorrido.size-2))
	}
	
	/**
	 * @Propósito El Detective regresa al Pais anterior, solo si ha realizado un viaje antes. 
	 */
	def regresarAlPaisAnteriorSiPuede ()
	{
		if (puedeRegresarAlPaisAnterior)
			regresarAlPaisAnterior
		else
			throw new NoHayPasosPorDondeRegresarException ("No hay pasos por donde regresar")
	}
	
	/**
	 * @Propósito Pregunta si el Detective puede regresar al Pais anterior.
	 */
	private def puedeRegresarAlPaisAnterior() 
	{
		cantidadDePaisesRecorridos > 1
	}
	
	/**
	 * @Propósito Devuelve la cantidad de paises recorridos por el Detective.
	 */
	def cantidadDePaisesRecorridos() 
	{
		recorrido.length
	}
	
	/**
	 * @Propósito Devuelve la lista de paises que el detective recorrió erroneamente.
	 * @param recorridoDelVillano Es el recorrido correcto que debe realizar el villano.
	 */
	def List<Pais>destinosFallidos(List<Pais> recorridoDelVillano)
	{
		recorrido.filter[pais | pais.estaFueraDelRecorrido(recorridoDelVillano) ].toList
	}
	
	def ultimoLugarVisitado()
	{
		lugaresVisitados.last
	}
	
	def pedirPista(Caso caso) 
	{
		caso.mostrarPista(ubicacionActual, ultimoLugarVisitado)
	}
	
	def pedirPista(Caso caso, LugarDeInteres lugar)
	{
		caso.mostrarPista(ubicacionActual, lugar)
	}
	
	def paisesVisitados(List<Pais> pais) 
	{	
		val visitados = new ArrayList<Pais>()
		
		// SacarLosPaisesRepetidos
		for (p : recorrido)
		{
			agregarSiPuede(visitados, p)
		}
		
		// Saca el pais en donde me encuentro
		visitados.remove(visitados.size-1)
		
		// Sacar los paises fallidos
		visitados.filter[p | p.estaDentroDelRecorrido(pais)].toList
	}
	
	def agregarSiPuede(ArrayList<Pais> paises, Pais pais) 
	{
		if (! paises.contains(pais))
		{
			paises.add(pais)
		}	
	}
	
	def esInicioDelJuego() 
	{
		recorrido.size == 1
	}
	
}