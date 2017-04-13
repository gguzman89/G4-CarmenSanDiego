package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label

class ViajarWindow extends SimpleWindow<MapamundiAppModel>{
	
	new(WindowOwner parent, MapamundiAppModel model) {
		super(parent, model)
		title = "Viajar"
	}
	
	override protected addActions(Panel actionsPanel) {
//		val formH = new Panel(actionsPanel) => [
//			layout = new HorizontalLayout
//		]
		
		new Button(actionsPanel) => [
			caption = "Volver al Pais anterior"
			//onClick[|modelObject.regresarAlPaisAnterior]
			setAsDefault // se asocia con el <Enter> del usuario
		]
		
		new Button(actionsPanel) => [
			caption = "Viajar"
			onClick [| 
				modelObject.viajar
			]
			setAsDefault
			
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)
		
		new Label(form) => [
			text = "Estas en: " + modelObject.nombrePais
		]
		
		// Add Table componente propio
		
		
	}
	
}