package edu.ui.view.CarmenSan10

import edu.ui.domain.AppModel.ResolverMisterioAppModel
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.LugarInteres
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.view.runnable.CarmenApplication
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel>
{
	new(WindowOwner parent, ResolverMisterioAppModel model) 
	{
		super(parent, model)
	}
	
	override createFormPanel(Panel mainPanel) 
	{
		title = "Resolviendo:" // + model.tituloDelCaso
		val generalPanel = new Panel(mainPanel) => [ 
			layout = new HorizontalLayout
			
			val left = new Panel(it) => [
				
				new Label(it).text = "Estás en:" // + modelObject.nombrePaisActual
				
				new Button(it) => [
					caption = "Orden De Arresto"
					onClick ([|abrirOrdenDeArresto])
				]
				
				new Label(it) => [
					fontSize = 8
					// text = modelObject.estadoDeLaOrdenDeArresto()
					text = "Orden ya emitida: Carmen Sandiego"
				]
				
				new Button(it) => [
					caption = "Viajar"
					onClick ([|abrirViajarAPais])
					// Al viajar debe deshabilitarse los botones en caso de poder viajar o no.
				]
			
				new Button(it) => [
					caption = "Expedientes"
					onClick ([|verExpedientes])
				]
			]
			
			val right = new Panel(it) => [
				
				new Label(it).text = "Lugares:"
				
				new Button(it) => [
					caption = "Biblioteca" //modelObject.nombreDel1erLugarInteres
					onClick ([|abrir1erLugarDeInteres])
				]
				
				new Button(it) => [
					caption = "Club" //modelObject.nombreDel2erLugarInteres
					onClick ([|abrir2erLugarDeInteres])
				]
				
				]
				new Button(it) => [
					caption = "Embajada" //modelObject.nombreDel3erLugarInteres
					onClick ([|abrir3erLugarDeInteres])
				]
				
		]
	}
	
	def abrir3erLugarDeInteres() 
	{
		new LugaresWindow(this, modelObject.el3erLugarDeInteres).open
	}
	
	def abrir2erLugarDeInteres() 
	{
		new LugaresWindow(this, modelObject.el2erLugarDeInteres).open
	}
	
	protected def void abrir1erLugarDeInteres() 
	{
		
		new LugaresWindow(this, modelObject.el1erLugarDeInteres).open
	}
	
	def verExpedientes() 
	{
		// Abrir el expediente que es solo de visualizacion.
	}
	
	def abrirViajarAPais() 
	{
		new ViajarWindow(this, modelObject).open
	}
	
	def abrirOrdenDeArresto() 
	{
		new OrdenArrestoWindow(this, modelObject).open
	}
	
	def void destinosFallidos(Panel panelPrincipal) 
	{
		val panelDestinosFallidos = new Panel (panelPrincipal)
		panelDestinosFallidos.layout = new VerticalLayout
		new Label(panelDestinosFallidos).text = "Destinos fallidos:"
		tablaDePaises(panelDestinosFallidos)
	}
	
	def tablaDePaises(Panel panelPrincipal) 
	{
		// Add componente propio de Lista/Tabla
	}
	
	def recorridoCriminal(Panel panelPrincipal) 
	{
		val panelRecorrido = new Panel (panelPrincipal)
		panelRecorrido.layout = new VerticalLayout
		new Label(panelRecorrido).text = "Argentina" + "<-" + "Peru" + "<-" + "Italia" + "<-" + "Egipto"
	}
	
	def estadoDeLaOrdenDeArresto(Panel panel) 
	{
		new Label(panel).text = "Orden ya emitida: Carmen Sandiego"
	}
	
	
	override addActions(Panel actionsPanel) 
	{
	}
	
}