package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.CarmenSan10.Mapamundi
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button

class MapamundiWindow extends SimpleWindow<Mapamundi>{
	
	new(WindowOwner parent, Mapamundi mapa) {
		super(parent, mapa)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val horizontal = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "clic aqui"
		]
	}
	
	
}