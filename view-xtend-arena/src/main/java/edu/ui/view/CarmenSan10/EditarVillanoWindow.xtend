package edu.ui.view.CarmenSan10

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.aop.windows.TransactionalDialog
import edu.ui.domain.AppModel.ExpedienteAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.CarmenSan10.Caracteristicas
import edu.ui.domain.AppModel.VillanoAppModel

class EditarVillanoWindow extends TransactionalDialog<ExpedienteAppModel>{
	
	new(WindowOwner parent, ExpedienteAppModel model) {
		super(parent, model)
		title = defaultTitle
	}
	
	def defaultTitle() 
	{
		"Expediente - Editar Villano"
	}
	
	override protected createFormPanel(Panel mainPanel) 
	{
		var generalPanel = new Panel(mainPanel)
		
			val editItem = new Panel(generalPanel) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editItem) => [
					text = "Nombre:"
				]
				
				new TextBox(editItem) => [
					value <=> "selectedVillano.nombre"
					width = 200
				]
				
				new Label(editItem) => [
					text = "Sexo:"
				]
				
				new TextBox(editItem) => [
					value <=> "selectedVillano.sexo"
					width = 200
				]
				
				new Label(editItem) => [
					text = "Señas Particulares:"
				]
				
				new Button(editItem) => [
					caption = "Editar Señas Particulares"
					onClick([| editarSeniasParticulares])
				]
			
			val tableSenias = new Table<Caracteristicas>(generalPanel, typeof(Caracteristicas)) => [
				items <=> "selectedVillano.seniasParticulares"
				value <=> "selectedVillano"
				
			]
				new Column<Caracteristicas>(tableSenias) => [
					title = "Seña"
					bindContentsToProperty("nombre")
				]
			
			val editItem2 = new Panel(generalPanel) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editItem2) => [
				text = "Hobbies:"
			]
			
			new Button(editItem2) => [
				caption = "Editar Hobbies"
				onClick([| editarHobbies])
			]
			
			var tableHobbies = new Table<Caracteristicas>(generalPanel, typeof(Caracteristicas)) => [
				items <=> "selectedVillano.hobbies"
				value <=> "selectedVillano"
			]
			
				new Column<Caracteristicas>(tableHobbies) => [
					title = "Hobbie"
					bindContentsToProperty("nombre")
				]
	}
	
	def editarHobbies() {
		var model = new VillanoAppModel(modelObject.selectedVillano)
		new EditorSuperHobbies(this, model).open
	}
	
	def editarSeniasParticulares() {
		var model = new VillanoAppModel(modelObject.selectedVillano)
		new EditorSenias(this, model).open
	}
	
	override protected addActions(Panel actionsPanel) 
	{
		new Button(actionsPanel) => [
				caption = "Aceptar"
				onClick([| 
					this.accept
					//this.realizarCambios
				])
			]
	}
	
	def realizarCambios() 
	{
		// Guardar los cambios del villano seleccionado al mapamundi
		this.close()
	}
	
}