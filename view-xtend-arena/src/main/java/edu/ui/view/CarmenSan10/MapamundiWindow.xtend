package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.CarmenSan10.Mapamundi
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List

// Para que aparezca este “chiche” tenés que agregar el siguiente import:
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class MapamundiWindow extends SimpleWindow<Mapamundi>{
	
	new(WindowOwner parent, Mapamundi mapa) {
		super(parent, mapa)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val horizontal = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		val vertical = new Panel(horizontal) => [
			layout = new VerticalLayout
			
			new List(horizontal) => [
				items <=> "paises"
				value <=> "paisSeleccionado" // donde esta el paisSeleccionado?
				
			]
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "clic aqui"
		]
	}
	
	
}