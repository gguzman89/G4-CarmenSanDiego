package edu.ui.view.CarmenSan10

import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import edu.ui.domain.CarmenSan10.LugarInteres
import org.uqbar.arena.windows.Dialog

class LugaresWindow extends Dialog<LugarInteres>{
	
	new(WindowOwner owner, LugarInteres model) {
		super(owner, model)
		//title = defaultTitle(modelObject.nombreCaso)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)//.layout = new VerticalLayout
		
		form.width = 200
		
		new Label(form) =>[
			text = "Estas visitando: " + modelObject.nombreLugar
		]
		
//		val hor = new Panel(form) => [
//			layout = new ColumnLayout(1)
//		]
		
		new Label(form) => [
			//text = modelObject.preguntarAlOcupante
			text = "El juego termina cuando llegamos al lugar que 
tiene al delicuente (luego de haber dado la orden de alto).
Cuando esto pasa al continuar nos informan los resultados, 
que pueden ser buenas o malas noticias:"
			//width = 200
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Continuar"
			onClick[| modelObject.validacionContinuar
			]
		]
	}
	
	def defaultTitle(String nombreCaso) {
		"Resolviendo: " + nombreCaso
	}
}