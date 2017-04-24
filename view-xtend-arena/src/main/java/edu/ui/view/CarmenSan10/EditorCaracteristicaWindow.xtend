package edu.ui.view.CarmenSan10

import edu.ui.view.CarmenSan10.EditorSuperConexion
import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.Pais

class EditorCaracteristicaWindow extends EditorSuperConexion {
	
	new(WindowOwner owner, Pais model) {
		super(owner, model)
	}
	
	override defaultTitle() {
		"Editar Características"
	}
	
}