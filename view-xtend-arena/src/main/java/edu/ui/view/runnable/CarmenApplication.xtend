package edu.ui.view.runnable

import org.uqbar.arena.Application
import edu.ui.view.CarmenSan10.MapamundiWindow
import edu.ui.domain.CarmenSan10.Mapamundi
//import edu.ui.domain.CarmenSan10.Detective
//import edu.ui.view.CarmenSan10.MenuDeAccionesWindow
//import org.uqbar.arena.windows.Window

class CarmenApplication extends Application{
	
	override createMainWindow() {
		new MapamundiWindow(this, new Mapamundi)
		//new MenuDeAccionesWindow(this)
	}
	
 
	
/*	override protected Window<?> createMainWindow() {
		return new MenuDeAccionesWindow(this)
	}*/
	/**
	 * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
	 * tanto en el createMainWindow como en main y denle run en .star
	 * 
	 */
	
	def static main(String[] args) {
		new CarmenApplication().start
	}
	
}