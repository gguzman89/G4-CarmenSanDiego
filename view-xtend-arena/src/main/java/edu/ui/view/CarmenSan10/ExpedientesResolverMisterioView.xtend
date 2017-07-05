package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Column
import edu.ui.domain.CarmenSan10.Villano
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import edu.ui.domain.AppModel.ExpedienteAppModel
import edu.ui.domain.CarmenSan10.Caracteristicas

class ExpedientesResolverMisterioView extends SimpleWindow<ExpedienteAppModel> {
	
	new (WindowOwner parent, ExpedienteAppModel exp){
		super(parent, exp)
	}
	
	override protected addActions(Panel actionsPanel) {}
	
	override def createMainTemplate (Panel mainPanel){
		title = "Resolviendo: misterio - Expedientes"
		super.createMainTemplate(mainPanel)

	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panelDividido = new Panel (mainPanel) =>[
			layout = new ColumnLayout (2)
		]
		//a este panel lo divido en dos uno para la tabla y el otro para las demas cosas 
		this.createLeftPanel(panelDividido)
		// en este panel llevara la tabla de villanos
		this.createRightPanel (panelDividido)
		// este panel pondre los demas chiches...
	}
	
	
	def createLeftPanel(Panel panelPadre) {
		val panelIzquierdo = new Panel (panelPadre) 
		
		var table = new Table<Villano>(panelIzquierdo, typeof(Villano)) => [
			height = 200 
			width = 450  
			bindItemsToProperty("expediente.villanos")
			bindValueToProperty("selectedVillano")
		]
			
		new Column<Villano>(table) => [
			title = "Villano"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
	}
	
	def createRightPanel(Panel panelPadre) {
		
		val panelDerecho = new Panel (panelPadre)
		
		this.crearPanelDetallesVillano (panelDerecho)
		
		new Label (panelDerecho) => [
			text = "Señas Particulares"
		]
		var tablaDeArriba = new Table<Caracteristicas>(panelDerecho, typeof(Caracteristicas)) => [
			height = 200 
			width = 450 
			bindItemsToProperty("selectedVillano.seniasParticulares")
			bindValueToProperty("selectedVillano")
		]
			
			new Column<Caracteristicas>(tablaDeArriba) => [
				title = "Seña"
				fixedSize = 150
				bindContentsToProperty("nombre")
			]
		
		new Label (panelDerecho) => [
			text = "Hobbies"
		]
		var tablaDeAbajo = new Table<Caracteristicas>(panelDerecho, typeof(Caracteristicas)) => [
			height = 200 
			width = 450  
			bindItemsToProperty("selectedVillano.hobbies")
			bindValueToProperty("selectedVillano")
		]
			
			new Column<Caracteristicas>(tablaDeAbajo) => [
				title = "Hobbie"
				fixedSize = 150 
				bindContentsToProperty("nombre")
			]
	}
	
	def crearPanelDetallesVillano(Panel panelDependiente) {
		
		val detallesPanel = new Panel (panelDependiente)=> [
			layout = new ColumnLayout(2)
		]
			new Label (detallesPanel) => [
				text = "Nombre"
			]
			new Label (detallesPanel) => [
				value <=> "selectedVillano.nombre"
			]
			new Label (detallesPanel) => [
				text = "Sexo"
			]
			new Label (detallesPanel) => [
				value <=> "selectedVillano.sexo"
			]
	}
}