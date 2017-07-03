package edu.ui.view.CarmenSan10

import org.uqbar.arena.aop.windows.TransactionalDialog
import edu.ui.domain.AppModel.VillanoAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.Caracteristicas
import org.uqbar.arena.widgets.tables.Table
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox

class EditorSuperHobbies extends TransactionalDialog<VillanoAppModel>{
	
	new(WindowOwner owner, VillanoAppModel model) {
		super(owner, model)
	}
	
	def defaultTitle() {
		"Editar Hobbies"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel)
		
		val table = new Table<Caracteristicas>(general, typeof(Caracteristicas)) => [
			items <=> "villano.hobbies"
			value <=> "hobbieSelected"
		]
		
			new Column<Caracteristicas>(table) => [
				title = "Hobbie"
				bindContentsToProperty("nombre")
			]
			
		new Button(general) => [
			caption = "Eliminar"
			onClick([|modelObject.eliminarHobbie])
		]
		
		val horPanel = new Panel(general) => [
			layout = new ColumnLayout(2)
		]
		
			new TextBox(horPanel) => [
				value <=> "textCaracteristica"
			]
			
			new Button(horPanel) => [
				caption = "Agregar"
				onClick([|modelObject.agregarCaracteristicaHobbie])
			]
			
		new Button(general) => [
			caption = "Aceptar"
			onClick([|this.accept])
		]
	}
	
}