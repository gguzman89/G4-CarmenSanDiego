package edu.ui.view_xtend_arena

import org.uqbar.arena.Application
import edu.ui.domain.CarmenSan10.Detective
import edu.ui.domain.CarmenSan10.ACME

class CarmenSandiegoApplication extends Application 
{
	override protected createMainWindow() 
	{
		new CarmenSandiegoWindow(this, new ACME)
	}
	
	def static main(String[] args) {
		new CarmenSandiegoApplication().start
	}
}