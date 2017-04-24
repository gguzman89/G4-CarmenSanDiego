package edu.ui.view.CarmenSan10

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.commons.utils.ApplicationContext
import edu.ui.domain.Repo.RepoMapamundi
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.ObservableProperty

class EditorSuperConexion extends TransactionalDialog<Pais>{
	
	new(WindowOwner owner, Pais model) {
		super(owner, model)
		title = defaultTitle()
	}
	
	def defaultTitle() {
		"Editar Conexiones"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val general = new Panel(mainPanel)
		
		val table = new Table<Pais>(general, typeof(Pais)) => [
			
			items <=> "paisesConexionAerea"
		]
		
		new Column<Pais>(table) => [
			title = "Característica"
			bindContentsToProperty("nombrePais")
		]
		
		new Button(general) => [
			caption = "Eliminar"
			//onClick([| modelObject.eliminarCaracteristicaSelecionada])
		]
		
		val editHor = new Panel(general) =>[
			layout = new HorizontalLayout
		]
		
		new Selector<Pais>(editHor) => [
			allowNull(false)
			value <=> "paisesConexionAerea"
			val propiedadModelos = bindItems(new ObservableProperty(paisesRepo, "paises"))
			propiedadModelos.adaptWith(typeof(Pais), "nombrePais") // opción A
			//propiedadModelos.adapter = new PropertyAdapter(typeof(Modelo), "descripcionEntera") // opción B
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
	
	def RepoMapamundi getPaisesRepo() {
		ApplicationContext.instance.getSingleton(typeof(Pais))
	}
	
	override executeTask() {
		paisesRepo.update(modelObject)
		super.executeTask()
	}
	
}