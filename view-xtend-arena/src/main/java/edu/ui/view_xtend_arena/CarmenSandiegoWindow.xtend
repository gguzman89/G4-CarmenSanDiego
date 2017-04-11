package edu.ui.view_xtend_arena

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.CarmenSan10.ACME
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import edu.ui.domain.CarmenSan10.Caso

class CarmenSandiegoWindow extends SimpleWindow<ACME> 
{
	new(CarmenSandiegoApplication parent, ACME model) 
	{
		super(parent, model)
		title = "¿Dónde está Carmen Sandiego?"
		taskDescription = ""
	}
	
	override createFormPanel(Panel mainPanel) 
	{
		// Aquí ponemos todo el contenido de la ventana
		val labelPanel = new Panel(mainPanel)
		new Label(labelPanel).text = "¿Qué haremos ahora detective?"
	}
	
	override addActions(Panel actionsPanel) 
	{
		// Aquí se colocan los botones de accion que apareceran abajo del createFormPanel
		
		new Button(actionsPanel) => [
			caption = "Boton de prueba"
			onClick [ | botonDeDialog ]
			]
			
		new Button(actionsPanel) => [
			caption = "Resolver misterio"
			onClick [ | iniciarJuego ]
			]
			
		new Button(actionsPanel) => [
			caption = "Mapamundi"
			onClick [ | botonDeDialog ]
			]
		
		new Button(actionsPanel) => [
			caption = "Expedientes"
			onClick [ | botonDeDialog ]
			]
		
	}
	
	def void iniciarJuego() 
	{
	}
	
	def botonDeDialog() 
	{
		val acme = this.modelObject 
		// Mensaje "getModelObject" reimplementado de la clase Window, que devuelve... 
		// la clase a la que le esta pegando CarmenSandiegoWindow, en este caso ACME.
		new DialogWindow(this, acme).open
		// Ubiera sido lo mismo que poner:
		// new DialogWindow(this, this.modelObject ).open
	}
	
}