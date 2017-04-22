package edu.ui.view.CarmenSan10

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EditorWindow extends TransactionalDialog<Object>{
	
	String tableName
	
	new(WindowOwner owner, Object model) {
		super(owner, model)
		title = defaultTitle()
	}
	
	def defaultTitle() {
		""
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val general = new Panel(mainPanel)
		
		val table = new Table<Object>(general, typeof(Object)) => [
			new Column<Object>(it) => [
				title = tableName
				//bindContentsToProperty("pais.caracteristicas")
			]
		]
		
		new Button(general) => [
			caption = "Eliminar"
			//onClick([| this.editar])
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
			//onClick([| this.editar]) ???
		]
	}
	
}