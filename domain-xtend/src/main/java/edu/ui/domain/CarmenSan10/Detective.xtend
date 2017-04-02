package edu.ui.domain.CarmenSan10

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.Exceptions.NoExisteUnaConexionAereaException
import edu.ui.domain.Exceptions.NoHayPasosPorDondeRegresarException

@Accessors
// Con el @Data no solo crea los geters y seter.
// sino tambien un new con todas las variables internas para cargar por parametros.



class Detective 
{
	private var List<Pais> recorrido;
	private var String ordenDeArresto;
	private var Caso casoAResolver;
	// List<Pais> recorridoFallido
	
	/**
	 * @Propósito: Crea un Detective.
	 */
	new ()
	{
		recorrido = new ArrayList<Pais>()
		ordenDeArresto = ""
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
			viajarA (paisAViajar)
		else 
			throw new NoExisteUnaConexionAereaException ("No existe una conexion aerea")
	}
	
	/**
	 * @Propósito Pregunta si el Detective puede viajar a un Pais determinado.
	 * @param paisAViajar Es el Pais al que el Detective quiere viajar.
	 */
	private def puedeViajarA (Pais paisAViajar) 
	{
		// no mandar el objeto, sino solo el nombre del pais
		ubicacionActual.tieneConexionAereaCon(paisAViajar)
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
	def recorrer (LugarInteres unLugar)
	{
		unLugar.preguntarAlOcupante() 
		// Esta bien que devuelva la politica del lugar? o tengo que mostrar otra cosa?
	}
	
	/**
	 * @Propósito Devuelve la ubicación actual del Detective.
	 */
	def ubicacionActual ()
	{
		recorrido.last
	}
	
	/**
	 * @Propósito El detective regresa al Pais anterior..
	 */
	def regresarAlPaisAnterior()
	{
		// NO CUMPLE CON LO PEDIDO!!!
		// A B C => A B C B
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
	
}