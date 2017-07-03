package edu.ui.domain.AppModel

import edu.ui.domain.CarmenSan10.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import edu.ui.domain.CarmenSan10.Expediente

@Accessors
@Observable
class ExpedienteAppModel  {
	
	Villano selectedVillano
	Expediente expediente
	
	new(){}
	
	new(Expediente expediente) {
		this.expediente = expediente
	}
	
}