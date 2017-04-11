package edu.ui.view.CarmenSan10

import edu.ui.domain.CarmenSan10.Caso
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.ACME

class InicioDelJuegoWindow extends SimpleWindow<Caso> 
{
	new(WindowOwner parent, Caso model) 
	{
		super(parent, model)
		title = "Robo del Faraón"
		// title = model.objetoDelRobo
	}
	
	override createFormPanel(Panel mainPanel) 
	{
		val labelPanel = new Panel(mainPanel)
		new Label(labelPanel).text = "Detective, tenemos un caso para usted!"
		//new Label(labelPanel).text = modelObject.caso.reporteDelActoCriminal
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
		new DialogWindow(this, new Detective).open
	}
}