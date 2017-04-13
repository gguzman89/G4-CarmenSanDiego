package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class OrdenArrestoWindow extends SimpleWindow<MapamundiAppModel>{
	
	new(WindowOwner parent, MapamundiAppModel model) {
		super(parent, model)
		title = defaultTitle(modelObject.nombreCaso) // revisar QUIEN?
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Genenrar orden de arresto"
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)
		
		new Label(form) => [
			text = "Orden de arresto emitida contra " + modelObject.nombreVillano
		]
		
		val hor = new Panel(form) => [
			layout = new HorizontalLayout
		]
		
		new Label(hor) => [
			text = "Villano:"
		]
		
		// new SelectorPropio ADD
		
	}
	
	def defaultTitle(String tituloDelCaso) {
		"Resolviendo: " + tituloDelCaso
	}
	
}