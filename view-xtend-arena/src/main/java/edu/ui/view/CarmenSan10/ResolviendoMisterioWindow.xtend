package edu.ui.view.CarmenSan10

import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.layout.HorizontalLayout
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

class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel>{
	
	new(WindowOwner parent, ResolverMisterioAppModel model) {
		super(parent, model)
	}
	
	override createFormPanel(Panel mainPanel) 	{
		title = "Resolviendo:" + modelObject.tituloDelCaso
		
		val generalPanel = new Panel(mainPanel)
			
				val juego = new Panel(generalPanel) => [
					layout = new HorizontalLayout
				]
				
					val left = new Panel(juego)
						
						val titulo = new Panel(left) => [
							layout = new ColumnLayout(2)
						]
							
							new Label(titulo) => [
								text = "Estás en:"
							]
							
							new Label(titulo) => [
								value <=> "nombrePaisActual"
							]	
						
						new Button(left) => [
							caption = "Orden De Arresto"
							onClick ([|abrirOrdenDeArresto])
						]
						
						val estadoDeLaOrden = new Panel(left) => [
							layout = new ColumnLayout(2)
						]
							
							new Label(estadoDeLaOrden) => [
								fontSize = 8
								text = "estadoDeLaOrdenDeArresto" // no esta funcionando: actualizar el estado
							]
							
							new Label(estadoDeLaOrden) => [
								value <=> "ordenPara"
							]
						
						new Button(left) => [
							caption = "Viajar"
							onClick ([|abrirViajarAPais])
							// Al viajar debe deshabilitarse los botones en caso de poder viajar o no.
						]
					
						new Button(left) => [
							caption = "Expedientes"
							onClick ([|verExpedientes])
						]
					
					val right = new Panel(juego)
						
						new Label(right).text = "Lugares:"
						
						new Button(right) => [
							caption = modelObject.nombreDel1erLugarInteres
							onClick ([|abrir1erLugarDeInteres])
						]
						
						new Button(right) => [
							caption = modelObject.nombreDel2doLugarInteres
							onClick ([|abrir2erLugarDeInteres])
						]
						
						new Button(right) => [
							caption = modelObject.nombreDel3erLugarInteres
							onClick ([|abrir3erLugarDeInteres])
						]		
			
			val estado = new Panel(generalPanel)
			
				new Label(estado).text = "Recorrido criminal:"
				
				new Label(estado) => [
					value <=> "paisesAcertados"
				] 
				
				new Label(estado).text = "Destinos fallidos:"
				
				new List<Pais> (generalPanel) => [
					bindItemsToProperty("paisesFallidos").adapter = new PropertyAdapter(Pais, "nombrePais")
				]
	}
	
	def abrir3erLugarDeInteres() {
		
		val model = new LugarInteresAppModel(modelObject.lugar3, modelObject.caso, modelObject.detective)
		new LugaresWindow(this, model).open
	}
	
	def abrir2erLugarDeInteres(){
		
		val model = new LugarInteresAppModel(modelObject.lugar2, modelObject.caso, modelObject.detective)
		new LugaresWindow(this, model).open
	}
	
	def void abrir1erLugarDeInteres() {
		
		val model = new LugarInteresAppModel(modelObject.lugar1, modelObject.caso, modelObject.detective)
		new LugaresWindow(this, model).open
	}
	
	def verExpedientes() {
		
		val model = new ExpedienteAppModel(modelObject.expediente)
		new ExpedientesResolverMisterioView(this, model).open
	}
	
	def abrirViajarAPais()	{
		
		new ViajarWindow(this, modelObject).open
	}
	
	def abrirOrdenDeArresto()	{
		
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