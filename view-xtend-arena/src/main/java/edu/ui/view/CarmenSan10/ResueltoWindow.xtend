package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button

class ResueltoWindow extends FinDelJuegoWindow{
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel) 
			
		new Label(form) => [
			text = "En Hora Buena!!!"
		]
		
		new Label(form) => [
			text = "Ha detenido a " + modelObject.nombreVillano + " y recuperado " + modelObject.objetoRobado
		]
		
		new Label(form) => [
			text = "Felicitaciones!!!!"
			foreground = Color.GREEN
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Disfrutar de nuestra victoria"
			onClick[| 
				//modelObject.cerrarWindows
				//modelObject.abrirPpal
			]
			
		]
	}
	
}