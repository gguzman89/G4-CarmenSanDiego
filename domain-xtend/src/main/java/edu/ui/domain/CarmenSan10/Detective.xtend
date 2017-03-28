package edu.ui.domain.CarmenSan10

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException

@Accessors
class Detective 
{
	private var List<Pais> recorrido;
	private var String ordenDeArresto;
	
	new ()
	{
		recorrido = new ArrayList<Pais>()
		ordenDeArresto = ""
	}
	
	def tieneUnaOrdenDeArresto ()
	{
		ordenDeArresto!=""
	}
	
	def void ordenarArresto (Villano villano)
	{
		ordenDeArresto = villano.nombre
	}
	
	def void viajarSiPuedeA (Pais paisAViajar)
	{
		if (puedeViajarA(paisAViajar))
			viajarA (paisAViajar)
		else 
			throw new UserException ("No existe una conexion aerea")
	}
	
	private def puedeViajarA(Pais paisAViajar) 
	{
		ubicacionActual.tieneConexionAereaCon(paisAViajar)
	}
	
	def void viajarA (Pais paisAViajar)
	{
		recorrido.add (paisAViajar)
	}
	
	def recorrer (LugarInteres unLugar)
	{
		unLugar.getPoliticaDelLugar() 
		// Esta bien que devuelva la politica del lugar? o tengo que mostrar otra cosa?
	}
	
	def conexionesAereasDelPaisActual()
	{
		ubicacionActual.paisesConexionAerea
	}
	
	def ubicacionActual ()
	{
		recorrido.last
	}
	
	private def regresarAlPaisAnterior()
	{
		recorrido.get(recorrido.size-2)
	}
	
	def regresarAlPaisAnteriorSiPuede ()
	{
		if (puedeRegresarAlPaisAnterior)
			regresarAlPaisAnterior
		else
			throw new UserException ("No hay pasos por donde regresar")
	}
	
	private def puedeRegresarAlPaisAnterior() 
	{
		cantidadDePaisesRecorridos > 1
	}
	
	private def cantidadDePaisesRecorridos() 
	{
		recorrido.length
	}
	
}