package edu.ui.view.CarmenSan10

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Expediente

class ExpedienteWindow extends SimpleWindow<Expediente>
{
	new(WindowOwner parent, Expediente model) 
	{
		super(parent, model)
		
	}
	
	override protected createFormPanel(Panel mainPanel) 
	{
		title = tituloDeLaVentana
		val general = new Panel(mainPanel) => [
			layout = new HorizontalLayout
			
			val ladoIzquierdo = new Panel(it) => [
			listadoDeLosItems(it, "villanos")
			botonesDeAccion(it)
			]
			
			val ladoDerecho = new Panel(it) => [
				datosDelItemSeleccionado(it)
				// fijarse si se puede reutilizar la tablas porque parece que no se puede
				listadoDeSeniasParticulares(it)
				listadoDeHobbies(it)
			]
		]
		
	}

	def listadoDeHobbies (Panel panel) 
	{
		new Label(panel).text = "Hobbies:"
		/**
		 * Es obligatorio definir(Table)
		 * 	- la propiedad items contra una colección de elementos de tipo R
		 *  - al menos una columna
		 */
		 
		val table = new Table<Villano>(panel, typeof(Villano)) => [
		new Column<Villano>(it) => [
			title = "Hobbie"
			//background = Color.GRAY
			fixedSize = 200
			//bindContentsToProperty("pais.Caracteristicas")
			]
		]
	}
	
	def listadoDeSeniasParticulares (Panel panel) 
	{
		new Label(panel).text = "Señas Particulares:"
		/**
		 * Es obligatorio definir(Table)
		 * 	- la propiedad items contra una colección de elementos de tipo R
		 *  - al menos una columna
		 */
		 
		// para poder extraer este componente y generalizarlo se podria hacer un var del tipo 
		// con el que estamos tratando, como pidiendo el tipo de uno de los elementos de la lista
		// que se quiere
		val table = new Table<Villano>(panel, typeof(Villano)) => [
		new Column<Villano>(it) => [
			title = "Seña"
			//background = Color.GRAY
			fixedSize = 200
			//bindContentsToProperty("pais.Caracteristicas")
			]
		]
	}
	
	def void datosDelItemSeleccionado(Panel cont) 
	{
		new Label(cont) => [
			text = "Nombre:" // + value
			//value <=> "paisSeleccionado"
		]
		
		new Label(cont) => [
			text = "Sexo:" // + value
			//value <=> "itemSeleccionado"
		]
	}
	
	def botonesDeAccion(Container cont) 
	{
		val botones = new Panel(cont) => [
		botonEliminar(cont)
		botonEditar(cont)
		botonNuevo(cont)
		]
	}
	
	protected def Button botonNuevo(Container cont) {
		new Button(cont) => [
			caption = "Nuevo"
			onClick ([|abrirVentanaCrearNuevo()])
		]
	}
	
	def abrirVentanaCrearNuevo() 
	{
		
	}
	
	protected def Button botonEditar(Container cont) 
	{
		new Button(cont) => [
			caption = "Editar"
			onClick ([|abrirVentanaDeEdicion])
		]
	}
	
	protected def Object abrirVentanaDeEdicion() 
	{
		
	}
	
	protected def Button botonEliminar(Container cont) 
	{
		new Button(cont) => [
					caption = "Eliminar"
				]
	}
	
	def void listadoDeLosItems(Container cont, String elementos) 
	{
		// acá se tine que implementar la lista de la izquierda
		new List(cont) => [
					items <=> elementos
					//value <=> "paisSeleccionado"
				]
	}
	
	protected def String tituloDeLaVentana() 
	{
		"Expedientes"
	}
	
	override protected addActions(Panel actionsPanel) 
	{
	}
}