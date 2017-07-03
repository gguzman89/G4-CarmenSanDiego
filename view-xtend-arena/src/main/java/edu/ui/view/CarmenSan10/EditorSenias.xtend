package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.AppModel.VillanoAppModel
import org.uqbar.arena.widgets.Panel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.CarmenSan10.Caracteristicas
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox

class EditorSenias extends EditorSuperHobbies {
	
	new(WindowOwner owner, VillanoAppModel model) {
		super(owner, model)
	}
	
	override defaultTitle() {
		"Editar Señas Particulares"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel)
		
		val table = new Table<Caracteristicas>(general, typeof(Caracteristicas)) => [
			items <=> "villano.seniasParticulares"
			value <=> "seniaSelected"
		]
		
			new Column<Caracteristicas>(table) => [
				title = "Seña"
				bindContentsToProperty("nombre")
			]
			
		new Button(general) => [
			caption = "Eliminar"
			onClick([|modelObject.eliminarSenia])
		]
		
		val horPanel = new Panel(general) => [
			layout = new ColumnLayout(2)
		]
		
			new TextBox(horPanel) => [
				value <=> "textSenia"
			]
			
			new Button(horPanel) => [
				caption = "Agregar"
				onClick([|modelObject.agregarCaracteristicaSenia])
			]
			
		new Button(general) => [
			caption = "Aceptar"
			onClick([|this.accept])
		]
	}
	
}