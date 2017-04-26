package edu.ui.view.CarmenSan10

import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.aop.windows.TransactionalDialog
import edu.ui.domain.Repo.RepoMapamundi
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.AppModel.PaisAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.CarmenSan10.Caracteristicas

class EditarPaisWindows extends TransactionalDialog<PaisAppModel>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, new PaisAppModel(model))
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Mapamundi-Editar Pais"		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel)
			
			val editCol = new Panel(general) => [
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
					onClick([| this.editarCaracteristica])
				]
			
			val table = new Table<Caracteristicas>(general, typeof(Caracteristicas)) => [
				items <=> "paisSelected.caracteristicaPais"
				value <=> "paisSelected"
			]
			
				new Column<Caracteristicas>(table) => [
					title = "Caracteristicas"
					bindContentsToProperty("nombre")
				]
			
			val editCol2 = new Panel(general) => [
				layout = new ColumnLayout(2)
			]
			
			new Label(editCol2) => [
				text = "Conexiones"
			]
			
			new Button(editCol2) => [
				caption = "Editar Conexiones"
				onClick([| this.editarConexiones])
			]
			
			val table2 = new Table<Pais>(general, typeof(Pais)) => [
				items <=> "paisesConexionAerea"
			]
			
				new Column<Pais>(table2) => [
					title = "Conexiones"
					bindContentsToProperty("nombrePais")
				]
		
			val editCol3 = new Panel(general) => [
				layout = new ColumnLayout(2)
			]
			
				new Label(editCol3) => [
					text = "Lugar de interes"
				]
				
				new Button(editCol3) => [
					caption = "Editar Lugares"
					onClick([| this.editarLugares])
				]
				
				val table3 = new Table<Pais>(general, typeof(Pais)) => [
					items <=> "lugares"
				]
				
					new Column<Pais>(table3) => [
						title = "Lugares de Interes"
						bindContentsToProperty("nombreLugares")
					]
		
				val editHor = new Panel(general) => [
					layout = new HorizontalLayout
				]
			
				new Button(editHor) => [
					caption = "Aceptar"
					onClick([| this.accept])
					setAsDefault
					disableOnError
				]
	}
	
	
	override executeTask() {
		if (modelObject.paisSelected.isNew) {
			paisesRepo.create(modelObject.paisSelected)
		} else {
			paisesRepo.update(modelObject.paisSelected)
		}
		super.executeTask()
	}
	
	def RepoMapamundi getPaisesRepo() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	def editarConexiones() {
		new EditorSuperConexion(this, modelObject.paisSelected).open
	}
	
	def editarLugares() {
		new EditorLugarInteresWindow(this, modelObject.paisSelected).open
	}
	
	def editarCaracteristica() {
		new EditorCaracteristicaWindow(this, modelObject.paisSelected).open
	}

	def realizarCambios() 
	{
		// Guardar cambios del pais seleccionado
		this.close()
	}
	
}