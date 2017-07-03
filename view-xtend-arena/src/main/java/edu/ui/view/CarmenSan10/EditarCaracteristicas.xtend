package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.AppModel.PaisAppModel

class EditarCaracteristicas extends EditorSuperConexion {
	
	new(WindowOwner owner, PaisAppModel model) {
		super(owner, model)
	}
	
	override defaultTitle() {
		"Editar Característica"
	}
	
}