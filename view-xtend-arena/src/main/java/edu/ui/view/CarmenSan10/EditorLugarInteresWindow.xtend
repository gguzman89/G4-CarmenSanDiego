package edu.ui.view.CarmenSan10

import edu.ui.view.CarmenSan10.EditorSuperConexion
import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Column
import edu.ui.domain.AppModel.PaisAppModel

class EditorLugarInteresWindow extends EditorSuperConexion {
	
	new(WindowOwner owner, PaisAppModel model) {
		super(owner, model)
	}
	
	override defaultTitle() {
		"Editar Lugares"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel)
		
		val table = new Table<Pais>(general, typeof(Pais)) => [
			
			items <=> "lugares"
		]
		
		new Column<Pais>(table) => [
			title = "Característica"
			bindContentsToProperty("nombreLugares")
		]
		
		new Button(general) => [
			caption = "Eliminar"
			//onClick([| modelObject.eliminarCaracteristicaSelecionada])
		]
		
		val editHor = new Panel(general) =>[
			layout = new HorizontalLayout
		]
		
		new TextBox(editHor) => [
			width = 150
			//value <=> "itemSeleccionado.nombre"
		]
		
		new Button(editHor) => [
			caption = "Agregar"
			//onClick([| this.agregar])
		]
		
		new Button(general) => [
			caption = "Aceptar"
			onClick([| this.accept])
		]
	}
	
}