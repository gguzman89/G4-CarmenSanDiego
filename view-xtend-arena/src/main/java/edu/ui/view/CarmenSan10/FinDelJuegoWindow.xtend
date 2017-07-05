package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import edu.ui.domain.AppModel.LugarInteresAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class FinDelJuegoWindow extends Dialog<LugarInteresAppModel>{
	
	new(WindowOwner owner, LugarInteresAppModel model) {
		super(owner, model)
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		title = modelObject.nombreDelCaso + "- Resuelto"
		
		var panelFinal = new Panel(mainPanel)
		
		new Label(panelFinal) => [
			value <=> "tituloDelResultado"
		]
		
		new Label(panelFinal) => [
			value <=> "estadoFinalDelCaso"
		]
		
		new Label(panelFinal) => [
			value <=> "resumenFinal"
		]
		
		new Button(panelFinal) => [
			caption = modelObject.estadoBoton
			onClick([|close])
		]
	}
}