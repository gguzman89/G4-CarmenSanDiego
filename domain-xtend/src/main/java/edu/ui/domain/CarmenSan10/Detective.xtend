package edu.ui.domain.CarmenSan10

import java.util.List

class Detective 
{
	private var List<Pais> recorrido;
	private var String ordenDeArresto;
	
	new () {}
	
	new (List<Pais> movimientos, String nombreDelVillano)
	{
		recorrido = movimientos
		ordenDeArresto = nombreDelVillano
	}
	
	def tieneUnaOrdenDeArresto ()
	{
		ordenDeArresto==""
	}
	
	def void ordenarArresto (Villano villano)
	{
		ordenDeArresto = villano.nombre
	}
	
	def ubicacionActual ()
	{
		recorrido.last
	}
	
	def regresarAlPaisAnterior()
	{
		//recorrido.get(recorrido.size-2)
	}
	
	def recorridoCriminal ()
	{
		// todos el recorrido menos el ultimo
	}
}