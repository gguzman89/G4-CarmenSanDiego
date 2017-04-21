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
			
			val ladoIzq = new Panel(it) => [
				
				//val elementSelected = new NotNullObservable("itemSeleccionado")
				
			var table = new Table<Pais>(it, typeof(Pais)) => [
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
			
				new Button(it) => [
					caption = "Eliminar"
				]
		
				new Button(it) => [
					caption = "Editar"
					onClick ([|editarPais])
					//new NotNullObservable("itemSeleccionado")
					//enabled <=> "itemSeleccionado"
				]
			
				new Button(it) => [
					caption = "Nuevo"
					onClick ([|agregarNuevoPais])
				]
			]
			
			val ladoDer = new Panel(it) => [
				
				val horPanel = new Panel(it) => [
					layout = new HorizontalLayout
				]
				
				new Label(horPanel) => [
					text = "Nombre:"
				]
				
				new Label(horPanel) => [
					value <=> "itemSeleccionado.nombrePais"
				]
				
				new Label(it).text = "Características"
				
				/**
				 * Es obligatorio definir(Table)
				 * 	- la propiedad items contra una colección de elementos de tipo R
				 *  - al menos una columna
				 */
				
				var table = new Table<Pais>(it, typeof(Pais)) => [
					
					//items <=> "itemSeleccionado.caracteristicaPais"
					//value <=> "itemSeleccionado"
					
					new Column<Pais>(it) => [
						title = "Caraterísticas"
						fixedSize = 200
						//bindContentsToProperty("caracteristicaPais")
					]
				]
				
				new Label(it).text = "Conexiones"
				
				var table2 = new Table<Pais>(it, typeof(Pais)) => [
					
					items <=> "itemSeleccionado.paisesConexionAerea"
					value <=> "itemSeleccionado"
					new Column<Pais>(it) => [
						title = "Conexiones"
						fixedSize = 200
						bindContentsToProperty("nombrePais")
					]
				]
				
				new Label(it).text = "Lugares De Interes"
				
				var table3 = new Table<Pais>(it, typeof(Pais)) => [
					
					//items <=> "itemSeleccionado.lugares"
					//value <=> "itemSeleccionado"
					
					new Column<Pais>(it) => [
						title = "Lugares"
						fixedSize = 200
						//bindContentsToProperty("nombre")
					]
				]
			]
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