package edu.ui.view_xtend_arena

import edu.ui.domain.CarmenSan10.Caso
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class InicioDelJuegoWindow extends SimpleWindow<Caso> 
{
	new(WindowOwner parent, Caso model) 
	{
		super(parent, model)
		title = model.objetoDelRobo
	}
	
	override createFormPanel(Panel mainPanel) 
	{
		val labelPanel = new Panel(mainPanel)
		new Label(labelPanel).text = "Detective, tenemos un caso para usted!"
		//new Label(labelPanel).text = modelObject.reporteDelActoCriminal
	}
	
	override addActions(Panel actionsPanel) 
	{
		new Button(actionsPanel) => [
			caption = "Aceptar el caso"
			//onClick [ | resolverMisterio ]
			]
	}
	
	def resolverMisterio() 
	{
		//val caso = this.modelObject
		//new DialogWindow(this, new ResolviendoWindow).open
	}
}