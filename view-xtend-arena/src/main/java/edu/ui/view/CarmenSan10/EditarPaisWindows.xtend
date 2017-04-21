package edu.ui.view.CarmenSan10

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
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.aop.windows.TransactionalDialog

class EditarPaisWindows extends TransactionalDialog<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Mapamundi-Editar Pais"		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel) => [
			//title = "Mapamundi-Editar Pais"
			
			val editCol = new Panel(it) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editCol) => [
				text = "Nombre:"
			]
			
			new TextBox(editCol) => [
				value <=> "nombrePais"
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
			
			val editCol2 = new Panel(it) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editCol2) => [
				text = "Conexiones"
			]
			
			new Button(editCol2) => [
				caption = "Editar Conexiones"
				//onClick([| this.editarConexiones])
			]
			
			val table2 = new Table<Pais>(it, typeof(Pais)) => [
				//title = "Caracteristicas"
				new Column<Pais>(it) => [
					title = "Conexiones"
					//bindContentsToProperty("pais.conexiones")
				]
			]
			
			val editCol3 = new Panel(it) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editCol3) => [
				text = "Lugar de interes"
			]
			
			new Button(editCol3) => [
				caption = "Editar Lugares"
				//onClick([| this.editarLugares])
			]
			
			val table3 = new Table<Pais>(it, typeof(Pais)) => [
				//title = "Caracteristicas"
				new Column<Pais>(it) => [
					title = "Lugare de Interes"
					//bindContentsToProperty("pais.lugares")
				]
			]
			
			val editHor = new Panel(it) => [
				layout = new HorizontalLayout
			]
			
			new Button(editHor) => [
				caption = "Aceptar"
				onClick([| this.realizarCambios])
			]
		]
	}
	
	def realizarCambios() 
	{
		// Guardar cambios del pais seleccionado
		this.close()
	}
	
}