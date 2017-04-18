package edu.ui.view.CarmenSan10

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class ExpedienteWindow extends SimpleWindow<T>
{
	new(WindowOwner parent, T model) 
	{
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) 
	{
		tituloDeLaVentana
		val general = new Panel(mainPanel) => [
			layout = new HorizontalLayout
			
			listadoDeLosItems(general, "paises")
			botonesDeAccion(general)
		]
		
		val ladoDer = new Panel(it) => [
				new Label(it) => [
					text = "Nombre:" // + value
					//value <=> "paisSeleccionado"
				]
	}
	
	def botonesDeAccion(Panel general) 
	{
		val botones = new Panel(it) => [
		botonEliminar(it)
		botonEditar(it)
		botonNuevo(it)
		]
	}
	
	protected def Button botonNuevo() {
		new Button(it) => [
			caption = "Nuevo"
			onClick ([|abrirVentanaCrearNuevo()])
		]
	}
	
	def abrirVentanaCrearNuevo() 
	{
	}
	
	protected def Object abrirVentanaDeEdicion() 
	{
		
	}
	
	protected def Button botonEditar() {
		new Button(it) => [
			caption = "Editar"
			onClick ([|abrirVentanaDeEdicion])
		]
	}
	
	protected def Button botonEliminar() {
		new Button(it) => [
					caption = "Eliminar"
				]
	}
	
	def void listadoDeLosItems(Panel panel, String items) 
	{
		// acá se tine que implementar la lista de la izquierda
		val listado = new Panel(it) => [
		new List(it) => [
					items <=> items
					//value <=> "paisSeleccionado"
				]
	}
	
	protected def String tituloDeLaVentana() 
	{
		"Expedientes"
	}
	
	override protected addActions(Panel actionsPanel) 
	{
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
}