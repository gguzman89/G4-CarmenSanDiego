package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.SimpleWindow
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.AppModel.ResolverMisterioAppModel
import org.uqbar.arena.widgets.Selector
import edu.ui.domain.CarmenSan10.Villano

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class OrdenArrestoWindow extends SimpleWindow<ResolverMisterioAppModel>{
	
	new(WindowOwner parent, ResolverMisterioAppModel model) {
		super(parent, model)
		title = "Resolviendo:" // + defaultTitle(modelObject.nombreDelCaso)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		val form = new Panel(mainPanel)
		
		new Label(form) => [
			text = "Orden de arresto emitida contra:" // + modelObject.ordenDeArresto
		]
		
		val list = new Panel(form) => [
			layout = new HorizontalLayout
		]
		
		new Label(list) => [
			text = "Villano:"
		]
		
		// new SelectorPropio ADD
		
		/*
		new Selector<Villano>(list) => [
			allowNull(false)
			value <=> "nombre"
			val propiedadModelos = bindItems(new ObservableProperty(repoVillanos, "modelos"))
			propiedadModelos.adaptWith(typeof(Villano), "descripcionEntera") // opción A
			//propiedadModelos.adapter = new PropertyAdapter(typeof(Modelo), "descripcionEntera") // opción B
		]
		*/
		
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Generar orden de arresto"
		]
	}
	
	def defaultTitle(String tituloDelCaso) {
		"Resolviendo: " + tituloDelCaso
	}
	
}