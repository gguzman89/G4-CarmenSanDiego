package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Caso
import edu.ui.domain.AppModel.CarmenSandiegoAppModel
import edu.ui.domain.CarmenSan10.ACME

class MenuDeAccionesWindow extends SimpleWindow<CarmenSandiegoAppModel> {
	/*
	 * esta es la primer ventana que me aparece cuando inicio el juego,
	 * la hice extender de detective, ya que son comportamientos basicos de un detective
	 */
	 new (WindowOwner parent){
	 	super (parent, new CarmenSandiegoAppModel(new Mapamundi, new ACME()))
	 }
		
		override def createMainTemplate (Panel mainPanel){
			title = "¿Donde esta Carmen Sandiego?"
			// Es importante colocar las siguientes 2 lineas, porque es la superclase la que los ejecuta:
			// Probar qué pasa comentandolas.
			taskDescription = ""
			super.createMainTemplate(mainPanel)
		}
		
		override protected createFormPanel(Panel mainPanel) {
			val panelDelFormulario = new Panel (mainPanel)=>[
				layout = new HorizontalLayout
			]
			new Label (panelDelFormulario)=>[
				text = "¿Qué haremos ahora Detective?"
				//foreground = Color.BLUE // veremos mas adelante cuando afinemos detalles
			]
		}
		
		
		override protected addActions(Panel actionsPanel) {
			new Button (actionsPanel)=>[
				caption = "Resolver Misterio"
				onClick ([|iniciarJuego]) // con que comportamiento del detective bindeamos este boton??
			]
			new Button (actionsPanel)=>[
				caption = "Mapamundi"
				onClick ([|mapamundi]) // con que comportamiento del detective bindeamos este boton??
			]
			new Button (actionsPanel)=>[
				caption = "Expedientes"
				onClick ([|expediente]) // con que comportamiento del detective bindeamos este boton??
			]
			
		}
	
	def iniciarJuego() 
	{
		new InicioDelJuegoWindow(this, new Caso).open
	}
	
	def mapamundi() 
	{
		new MapamundiWindow(this).open
	}
	
	def expediente() 
	{
		// Abri una ventana de dialog como ejemplo de como abrir una ventana
		// modelObject devuelve el objeto con el que estamos modelando la vista.
		new ExpedienteMenuDeAccionesView(this).open
	}
	
		
}