package edu.ui.view.CarmenSan10

import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.List
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.bindings.PropertyAdapter
import edu.ui.domain.AppModel.ExpedienteAppModel
import edu.ui.domain.AppModel.LugarInteresAppModel

class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel>
{
	new(WindowOwner parent, ResolverMisterioAppModel model) 
	{
		super(parent, model)
	}
	
	override createFormPanel(Panel mainPanel) 	{
		title = "Resolviendo:" + modelObject.tituloDelCaso
		
		val generalPanel = new Panel(mainPanel) => [
			
			layout = new VerticalLayout
				
			val juego = new Panel(mainPanel) => [
				
			layout = new HorizontalLayout
			
				val left = new Panel(it) => [
					
					val titulo = new Panel(it) => [
						layout = new ColumnLayout(2)
						
						new Label(it) => [
							text = "Estás en:"
						]
						
						new Label(it) => [
							value <=> "nombrePaisActual"
						]	
					]
					
					new Button(it) => [
						caption = "Orden De Arresto"
						onClick ([|abrirOrdenDeArresto])
					]
					
					val estadoDeLaOrden = new Panel(it) => [
						layout = new ColumnLayout(2)
						
						new Label(it) => [
							fontSize = 8
							text = "estadoDeLaOrdenDeArresto" // no esta funcionando: actualizar el estado
						]
						
						new Label(it) => [
							value <=> "ordenPara"
						]
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
						caption = modelObject.nombreDel1erLugarInteres
						onClick ([|abrir1erLugarDeInteres])
					]
					
					new Button(it) => [
						caption = modelObject.nombreDel2doLugarInteres
						onClick ([|abrir2erLugarDeInteres])
					]
					
					new Button(it) => [
						caption = modelObject.nombreDel3erLugarInteres
						onClick ([|abrir3erLugarDeInteres])
					]		
				]
			]
			
			val estado = new Panel(mainPanel) => [
				layout = new VerticalLayout
			
				new Label(it).text = "Recorrido criminal:"
				
				new Label(it) => [
					value <=> "paisesAcertados"
				] 
				
				new Label(it).text = "Destinos fallidos:"
				
				new List<Pais> (mainPanel) => [
					bindItemsToProperty("paisesFallidos").adapter = new PropertyAdapter(Pais, "nombrePais")
				]
				
			]
		]
		
	}
	
	def abrir3erLugarDeInteres() 
	{
		val model = new LugarInteresAppModel(modelObject.lugar3, modelObject.caso, modelObject.detective)
		new LugaresWindow(this, model).open
	}
	
	def abrir2erLugarDeInteres() 
	{
		val model = new LugarInteresAppModel(modelObject.lugar2, modelObject.caso, modelObject.detective)
		new LugaresWindow(this, model).open
	}
	
	protected def void abrir1erLugarDeInteres() 
	{
		val model = new LugarInteresAppModel(modelObject.lugar1, modelObject.caso, modelObject.detective)
		new LugaresWindow(this, model).open
	}
	
	def verExpedientes() 
	{
		val model = new ExpedienteAppModel(modelObject.expediente)
		new ExpedientesResolverMisterioView(this, model).open
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
	
	def tablaDePaises(Panel panelPrincipal)	{
		// Add componente propio de Lista/Tabla
	}
	
	def estadoDeLaOrdenDeArresto(Panel panel) {
		new Label(panel).text = "Orden ya emitida: Carmen Sandiego"
	}
	
	
	override addActions(Panel actionsPanel) {}
	
}