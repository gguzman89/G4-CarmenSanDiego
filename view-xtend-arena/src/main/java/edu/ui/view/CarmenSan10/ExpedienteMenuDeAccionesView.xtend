package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import edu.ui.domain.CarmenSan10.Villano
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.ExpedienteAppModel
import org.uqbar.arena.layout.HorizontalLayout
import edu.ui.domain.CarmenSan10.Expediente
import org.uqbar.arena.bindings.NotNullObservable
import edu.ui.domain.CarmenSan10.Caracteristicas
import org.uqbar.arena.widgets.Label

class ExpedienteMenuDeAccionesView extends SimpleWindow<ExpedienteAppModel> {
	
	new(WindowOwner parent, Expediente exp) {
		super(parent, new ExpedienteAppModel(exp))
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Expedientes"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val general = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		
		val elementedSelected = new NotNullObservable("selectedVillano")
		
		val ladoIzq = new Panel(general)
		
		var table = new Table<Villano>(ladoIzq, typeof(Villano)) => [
			height = 200
			width = 450
			bindItemsToProperty("expediente.villanos")
			bindValueToProperty("selectedVillano")
		
		]
			
			new Column<Villano>(table) => [
				title = "Villanos"
				fixedSize = 150
				bindContentsToProperty("nombre")
			]
		
			new Button(ladoIzq) => [
				caption = "Editar"
				onClick(|editarVillano)
				bindEnabled(elementedSelected)
			]
			
			new Button(ladoIzq) => [
				caption = "Nuevo"
				onClick(|agregarNuevoVillano())
			]
		
		val ladoDer = new Panel(general)
		
			val horPanel = new Panel(ladoDer) => [
				layout = new HorizontalLayout
			]
			
			new Label(horPanel) => [
				text = "Nombre: "
			]
			
			new Label(horPanel) => [
				value <=> "selectedVillano.nombre"
			]
			
			val horPanel1 = new Panel(ladoDer) => [
				layout = new HorizontalLayout
			]
			
			new Label(horPanel1) => [
				text = "Sexo: "
			]
			
			new Label(horPanel1) => [
				value <=> "selectedVillano.sexo"
			]
			
			new Label(ladoDer).text = "Señas Particulares: "
			
			var table1 = new Table<Caracteristicas>(ladoDer, typeof(Caracteristicas)) => [
				items <=> "selectedVillano.seniasParticulares"
				value <=> "selectedVillano"
			]
			
				new Column<Caracteristicas>(table1) => [
					title = "Seña"
					fixedSize = 200
					bindContentsToProperty("nombre")
				]
				
			new Label(ladoDer).text = "Hobbies:  "
			
			var table2 = new Table<Caracteristicas>(ladoDer, typeof(Caracteristicas)) => [
				items <=> "selectedVillano.hobbies"
				value <=> "selectedVillano"
			]
			
				new Column<Caracteristicas>(table2) => [
					title = "Hobbie"
					fixedSize = 200
					bindContentsToProperty("nombre")
				]
			
	}
	
	def agregarNuevoVillano() {
		var nuevoVillano = new Villano
		modelObject.selectedVillano = nuevoVillano
		new NuevoVillanoWindow(this, modelObject).open
	}
	
	def editarVillano() {
		new EditarVillanoWindow(this, modelObject).open
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
}