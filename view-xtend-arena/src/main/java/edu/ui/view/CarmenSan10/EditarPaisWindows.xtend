package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

class EditarPaisWindows extends SimpleWindow<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel) => [
			title = "Mapamundi-Editar Pais"
			
			val editCol = new Panel(it) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editCol) => [
				text = "Nombre:"
			]
			
			new TextBox(editCol) => [
				//value <=> "paisSeleccionado.nombre"
				width = 200
			]
			
			new Label(editCol) => [
				text = "Caracteristicas"
			]
			
			new Button(editCol) => [
				caption = "Editar Caracteristicas"
				//onClick([| this.editarCarateristica])
			]
			
			val table = new Table<Pais>(it, typeof(Pais)) => [
				//title = "Caracteristicas"
				new Column<Pais>(it) => [
					title = "Caracteristicas"
					//bindContentsToProperty("pais.caracteristicas")
				]
			]
		]
	}
	
}