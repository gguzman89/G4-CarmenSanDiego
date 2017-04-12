package edu.ui.view.CarmenSan10

import edu.ui.view.CarmenSan10.ExpedientesResolverMisterioView
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Villano
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button

class ExpedienteMenuDeAccionesView extends ExpedientesResolverMisterioView {
	
	new(WindowOwner parent) {
		super(parent)
	}
	
	override createLeftPanel(Panel panelPadre) {
		val panelIzquierdo = new Panel (panelPadre)=>[
			layout = new VerticalLayout // es el layout por defecto
		]
		
		var table = new Table<Villano>(panelIzquierdo, typeof(Villano)) => [
			height = 200 //ni idea
			width = 450  //tampoco
			bindItemsToProperty("villanos")
			bindValueToProperty("selectedVillano")
		]
			
		new Column<Villano>(table) => [
			title = "Villano"
			fixedSize = 150 // ni idea
			bindContentsToProperty("nombre")//bindeamos al nombre del villano en cuestion
		]
	// todo lo de arriba lo mismo, pero le agrego los botones
	   new Button (panelIzquierdo)=> [
	   	caption = "Nuevo"
	   	//on click
	   ]
	   new Button (panelIzquierdo)=> [
	   	caption = "Editar"
	   	//on click
	   ]
	}
	
}