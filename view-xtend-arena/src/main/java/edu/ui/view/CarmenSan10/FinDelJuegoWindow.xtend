package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.Dialog
import edu.ui.domain.AppModel.MapamundiAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import edu.ui.domain.AppModel.LugarInteresAppModel

class FinDelJuegoWindow extends Dialog<LugarInteresAppModel>{
	
	new(WindowOwner owner, LugarInteresAppModel model) {
		super(owner, model)
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = modelObject.nombreDelCaso + "- Resuelto"
		
	}
	
}