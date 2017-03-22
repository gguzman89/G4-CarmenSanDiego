package edu.ui.domain.CarmenSan10

import java.util.List

class Detective 
{
	private var List<Pais> recorrido;
	private var OrdenDeArresto ordenDeArresto;
	
	new () {}
	
	new (List<Pais> movimientos, OrdenDeArresto orden)
	{
		recorrido = movimientos
		ordenDeArresto = orden
	}
	
	def tieneUnaOrdenDeArresto ()
	{
		ordenDeArresto.hayOrdenDeArresto
	}
	
	def void ordenarArresto (Villano villano)
	{
		ordenDeArresto.villanoAArrestar (villano)
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