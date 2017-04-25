package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
 import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.AppModel.MapamundiAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.bindings.NotNullObservable

class MapamundiWindow extends SimpleWindow<MapamundiAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new MapamundiAppModel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Mapamundi"
		
		val general = new Panel(mainPanel) => [
				layout = new HorizontalLayout
		]
				
			val elementSelected = new NotNullObservable("itemSeleccionado")
				
			val ladoIzq = new Panel(general)
				
			var table = new Table<Pais>(ladoIzq, typeof(Pais)) => [
				height = 200
				width = 450 
				bindItemsToProperty("todosLosPaises")
				bindValueToProperty("itemSeleccionado")
			]
				
				new Column<Pais>(table) => [
					title = "Paises"
					fixedSize = 150
					bindContentsToProperty("nombrePais")
				]
			
				new Button(ladoIzq) => [
					caption = "Eliminar"
					onClick([|modelObject.eliminarPaisSeleccionado])
					//bindValueToProperty("todosLosPaises")
					bindEnabled(elementSelected)
					
				]
				
				new Button(ladoIzq) => [
					caption = "Editar"
					onClick ([|editarPais])
					bindEnabled(elementSelected)
				]
				
				new Button(ladoIzq) => [
					caption = "Nuevo"
					onClick ([|this.agregarNuevoPais])
				]
			
			val ladoDer = new Panel(general)
				
				val horPanel = new Panel(ladoDer) => [
					layout = new HorizontalLayout
				]
				
				new Label(horPanel) => [
					text = "Nombre:"
				]
				
				new Label(horPanel) => [
					value <=> "itemSeleccionado.nombrePais"
				]
				
			
				new Label(ladoDer).text = "Características"
				
				/**
				 * Es obligatorio definir(Table)
				 * 	- la propiedad items contra una colección de elementos de tipo R
				 *  - al menos una columna
				 */
				
				var tableT = new Table<Pais>(ladoDer, typeof(Pais)) => [
					//items <=> "itemSeleccionado.caracteristicaPais"
					//value <=> "itemSeleccionado"
				]
				
					new Column<Pais>(tableT) => [
						title = "Caraterísticas"
						fixedSize = 200
						//bindContentsToProperty("caracteristicaPais")
					]
				
				new Label(ladoDer).text = "Conexiones"
				
				var table2 = new Table<Pais>(ladoDer, typeof(Pais)) => [
					items <=> "itemSeleccionado.paisesConexionAerea"
					value <=> "itemSeleccionado"
				]
					
					new Column<Pais>(table2) => [
						title = "Conexiones"
						fixedSize = 200
						bindContentsToProperty("nombrePais")
					]
			
				new Label(ladoDer).text = "Lugares De Interes"
				
				var table3 = new Table<Pais>(ladoDer, typeof(Pais)) => [
					items <=> "itemSeleccionado.lugares"
					value <=> "itemSeleccionado"
				]
				
					new Column<Pais>(table3) => [
						title = "Lugares"
						fixedSize = 200
						bindContentsToProperty("nombreLugares")
					]
	}
	
	def agregarNuevoPais() 
	{
		this.openDialog(new NuevoPaisWindow(this))
	}
	
	def editarPais() 
	{
		this.openDialog(new EditarPaisWindows(this, modelObject.itemSeleccionado))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}
	
	override protected addActions(Panel actionsPanel) {}
	
}