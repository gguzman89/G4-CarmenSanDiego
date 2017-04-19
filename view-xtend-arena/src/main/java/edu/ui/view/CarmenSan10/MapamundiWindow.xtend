package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.CarmenSan10.Mapamundi
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import java.awt.Color

// Para que aparezca este “chiche” tenés que agregar el siguiente import:
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.AppModel.MapamundiAppModel

class MapamundiWindow extends SimpleWindow<MapamundiAppModel>{
	
	new(WindowOwner parent) {
		super(parent, new MapamundiAppModel)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Mapamundi"
		val general = new Panel(mainPanel) => [
	
			layout = new HorizontalLayout
			
			val ladoIzq = new Panel(it) => [
				
			var table = new Table<Pais>(it, typeof(Pais)) => [
			height = 200
			width = 450 
			bindItemsToProperty("paisesAMostrar")
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
				]
			
				new Button(it) => [
					caption = "Nuevo"
					onClick ([|agregarNuevoPais])
				]
			]
			
			val ladoDer = new Panel(it) => [
				new Label(it) => [
					text = "Nombre:" // + value
					//value <=> "paisSeleccionado"
				]
				
				new Label(it).text = "CaracteriHsticas"
				
				/**
				 * Es obligatorio definir(Table)
				 * 	- la propiedad items contra una colección de elementos de tipo R
				 *  - al menos una columna
				 */
				
				val table = new Table<Mapamundi>(it, typeof(Mapamundi)) => [
					new Column<Mapamundi>(it) => [
						title = "CarateristicasPPP"
						background = Color.GRAY
						fixedSize = 200
						//bindContentsToProperty("pais.Caracteristicas")
					]
				]
				
				new Label(it).text = "Conexiones"
				
				val table2 = new Table<Mapamundi>(it, typeof(Mapamundi)) => [
					new Column<Mapamundi>(it) => [
						title = "Conextions"
						fixedSize = 200
						//bindContentsToProperty("pais.conexcionesAereas")
					]
				]
				
				new Label(it).text = "Lugares De Interes"
				
				val table3 = new Table<Mapamundi>(it, typeof(Mapamundi)) => [
					new Column<Mapamundi>(it) => [
						title = "Lugares"
						fixedSize = 200
						//bindContentsToProperty("pais.lugaresInteres")
					]
				]
			]
		
		]
		
	}
	
	def agregarNuevoPais() 
	{
		new NuevoPaisWindow(this).open
	}
	
	def editarPais() 
	{
		new EditarPaisWindows(this, new Pais).open
	}
	
	override protected addActions(Panel actionsPanel) {
		
//		new Button(actionsPanel) => [
//			caption = "Eliminar"
//		]
//		
//		new Button(actionsPanel) => [
//			caption = "Editar"
//		]
//			
//		new Button(actionsPanel) => [
//			caption = "Nuevo"
//		]
	}
	
	
}