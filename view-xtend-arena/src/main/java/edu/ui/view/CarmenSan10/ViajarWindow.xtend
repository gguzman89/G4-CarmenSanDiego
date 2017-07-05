package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import edu.ui.domain.AppModel.ResolverMisterioAppModel
import edu.ui.domain.CarmenSan10.Pais
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.List
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout

class ViajarWindow extends SimpleWindow<ResolverMisterioAppModel>{
	
	new(WindowOwner parent, ResolverMisterioAppModel model) {
		super(parent, model)
		title = "Viajar"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		val elementSelected = new NotNullObservable("paisSeleccionado")
		val inicioDelJuego = new NotNullObservable("enInicioDelJuego")
		
		
		new Button(actionsPanel) => [
			caption = "Volver al Pais anterior"
			onClick[|regresarAlPaisAnterior]
			bindEnabled(inicioDelJuego)
			setAsDefault // se asocia con el <Enter> del usuario
		]
		
		new Button(actionsPanel) => [
			caption = "Viajar"
			onClick [| viajar]
			bindEnabled(elementSelected)
			setAsDefault
		]
	}
	
	def viajar() 
	{
		modelObject.viajar
		this.close()
	}
	
	def regresarAlPaisAnterior() 
	{
		modelObject.regresarAlPaisAnterior
		this.close()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val titulo = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]
			
			new Label(titulo) => [
				text = "Estas en: "
			]
			
			new Label(titulo) => [
				value <=> "nombrePaisActual"
			]
		
		new List<Pais> (mainPanel) => [
			bindItemsToProperty("conexionesDelPaisActual").adapter = new PropertyAdapter(Pais, "nombrePais")
			bindValueToProperty("paisSeleccionado")
		]
	}
	
}