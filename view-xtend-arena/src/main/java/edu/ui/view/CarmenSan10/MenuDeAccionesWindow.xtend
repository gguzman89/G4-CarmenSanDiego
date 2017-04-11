package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.CarmenSan10.Detective
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import edu.ui.view.runnable.CarmenApplication
import org.uqbar.arena.layout.HorizontalLayout

class MenuDeAccionesWindow extends SimpleWindow<Detective> {
	/*
	 * esta es la primer ventana que me aparece cuando inicio el juego,
	 * la hice extender de detective, ya que son comportamientos basicos de un detective
	 */
	 new (WindowOwner parent){
	 	super (parent, new Detective)
	 }
	
		
		override def createMainTemplate (Panel mainPanel){
			title = "¿Donde esta Carmen Sandiego?"
		}
		
		override protected createFormPanel(Panel mainPanel) {
			val panelDelFormulario = new Panel (mainPanel)=>[
				layout = new HorizontalLayout
			]
			new Label (panelDelFormulario)=>[
				text = "¿Que haremos ahora Detective?"
				//foreground = Color.BLUE // veremos mas adelante cuando afinemos detalles
			]
		}
		
		
		
		override protected addActions(Panel actionsPanel) {
			new Button (actionsPanel)=>[
				caption = "Resolver Misterio"
				//onClick ([|this.....]) // con que comportamiento del detective bindeamos este boton??
			]
			new Button (actionsPanel)=>[
				caption = "Mapamundi"
				//onClick ([|this.getMapa]) // con que comportamiento del detective bindeamos este boton??
			]
			new Button (actionsPanel)=>[
				caption = "Expedientes"
				//onClick ([|this.getExpediente]) // con que comportamiento del detective bindeamos este boton??
			]
		}
		
}