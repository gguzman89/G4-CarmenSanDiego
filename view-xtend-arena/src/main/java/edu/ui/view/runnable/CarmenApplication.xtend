package edu.ui.view.runnable

import org.uqbar.arena.Application
import edu.ui.view.CarmenSan10.MapamundiWindow
import edu.ui.domain.CarmenSan10.Mapamundi

class CarmenApplication extends Application{
	
	override createMainWindow() {
		new MapamundiWindow(this, new Mapamundi)
	}
	
	/**
	 * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
	 * tanto en el createMainWindow como en main y denle run en .star
	 * 
	 */
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
	
}