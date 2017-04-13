package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.Dialog
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

class FinDelJuegoWindow extends Dialog<MapamundiAppModel>{
	
	new(WindowOwner owner, MapamundiAppModel model) {
		super(owner, model)
		title = defaultTitle
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	def defaultTitle() {
		modelObject.nombreCaso + "- Resuelto"
	}
	
}