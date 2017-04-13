package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.Button

class NoResueltoWindow extends FinDelJuegoWindow {
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel) 
			
		new Label(form) => [
			text = "Malas Noticias :("
			foreground = Color.RED
		]
		
		new Label(form) => [
			text = "Ha detenido a " + modelObject.nombreVillano + ", pero usted tenia una orden contra " + modelObject.objetoRobado
		]
		
		new Label(form) => [
			text = "Lamentablemente este crimen quedara impune"
		]
		
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar el error cometido"
			onClick[| 
				//modelObject.cerrarWindows
				//modelObject.abrirPpal
			]
			
		]
		
	}
	
}