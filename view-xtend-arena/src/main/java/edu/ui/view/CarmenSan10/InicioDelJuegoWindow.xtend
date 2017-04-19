package edu.ui.view.CarmenSan10

import edu.ui.domain.CarmenSan10.Caso
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.ACME
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.ColumnLayout
import edu.ui.domain.AppModel.ResolverMisterioAppModel

class InicioDelJuegoWindow extends SimpleWindow<Caso> 
{
	new(WindowOwner parent, Caso model) 
	{
		super(parent, model)
		
	}
	
	override createFormPanel(Panel mainPanel) 
	{
		title = "Robo del Faraón"
		// title = model.objetoDelRobo
		val panelDelCaso = new Panel(mainPanel)
		panelDelCaso.layout = new VerticalLayout()
		new Label(panelDelCaso).text = "Detective, tenemos un caso para usted!"
		val detalleDelCaso = new Panel(panelDelCaso)
		detalleDelCaso.layout = new VerticalLayout
		//new Label(detalleDelCaso).text = modelObject.reporteDelActoCriminal
		new Label(detalleDelCaso).text = "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del bla bla bla"
	}
	
	override addActions(Panel actionsPanel) 
	{
		new Button(actionsPanel) => [
			caption = "Aceptar el caso"
			onClick [ | resolverMisterio ]
			]
	}
	
	def resolverMisterio() 
	{
		//val caso = modelObject.caso
		//new DialogWindow(this, new Detective).open
		new ResolviendoMisterioWindow(this, new ResolverMisterioAppModel()).open
	}
}