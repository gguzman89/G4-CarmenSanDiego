package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import edu.ui.domain.CarmenSan10.Caso
import edu.ui.domain.AppModel.CarmenSandiegoAppModel
import edu.ui.domain.Dummy.CarmenSan10Dummy
import edu.ui.domain.CarmenSan10.ACME
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.Expediente

class MenuDeAccionesWindow extends SimpleWindow<CarmenSandiegoAppModel> {
	/*
	 * esta es la primer ventana que me aparece cuando inicio el juego,
	 * la hice extender de detective, ya que son comportamientos basicos de un detective
	 */
	 new (WindowOwner parent, CarmenSan10Dummy dummy){
	 	super (parent, new CarmenSandiegoAppModel(dummy))
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
				onClick ([|iniciarJuego(modelObject.acme)]) // con que comportamiento del detective bindeamos este boton??
			]
			new Button (actionsPanel)=>[
				caption = "Mapamundi"
				onClick ([|mapamundi(modelObject.mapamundi)]) // con que comportamiento del detective bindeamos este boton??
			]
			new Button (actionsPanel)=>[
				caption = "Expedientes"
				onClick ([|expediente(modelObject.acme.villanos)]) // con que comportamiento del detective bindeamos este boton??
			]
			
		}
	
	def iniciarJuego(ACME acme) 
	{
		new InicioDelJuegoWindow(this, acme).open
	}
	
	def mapamundi(Mapamundi mapa) 
	{
		new MapamundiWindow(this, mapa).open
	}
	
	def expediente(Expediente exp) 
	{
		new ExpedienteMenuDeAccionesView(this, exp).open
	}
	
		
}