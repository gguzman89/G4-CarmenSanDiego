package edu.ui.view.CarmenSan10

import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.Villano

class NuevoVillanoWindow extends EditarVillanoWindow
{
	
	new(WindowOwner parent) {
		super(parent, new Villano)
	}
	
	override def defaultTitle() 
	{
		"Expediente - Nuevo Villano"
	}
	
	override def realizarCambios()
	{
		// Agregar el nuevo villano
		// modelObject.agregarVillano(itemSeleccionado) ??? Creo que no es así
		this.close()
	}
}