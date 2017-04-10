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

class MapamundiWindow extends SimpleWindow<Mapamundi>{
	
	new(WindowOwner parent, Mapamundi mapa) {
		super(parent, mapa)
	}
	
	override protected createFormPanel(Panel mainPanel) {
//		val horizontal = new Panel(mainPanel) => [
//			layout = new HorizontalLayout
//			title = "Mapamundi"
//		
//		
//		new List(it) => [
//			items <=> "paises"
//				//title = "Paises"
//				//value <=> "paisSeleccionado" // donde esta el paisSeleccionado?
//		
//		]
//		]
//		val ladoDerecho = new Panel(horizontal) => [
//			new Label(mainPanel) => [
//				text = "Nombre"
//				//value <=> "pais.nombre"
//			]
//		]

		val general = new Panel(mainPanel) => [
	
			layout = new HorizontalLayout
			title = "Mapamundi"
	
			val ladoIzq = new Panel(it) => [
				
				new List(it) => [
					items <=> "paises"
					//value <=> "paisSeleccionado"
				]
				
				new Button(it) => [
					caption = "Eliminar"
				]
		
				new Button(it) => [
					caption = "Editar"
				]
			
				new Button(it) => [
					caption = "Nuevo"
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
					title = "Caracteticas"
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